unit uMain;

interface

{
  @author  Dmitriy Sosnovich
  @version 1.0
  with using of the Python4Delphi Component(https://github.com/pyscripter/python4delphi), for minimal code writing :D
  You should install Design time Components, it is better for using.


}
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  PythonEngine, Vcl.StdCtrls, VarPyth, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters,
  cxContainer, cxEdit, cxProgressBar,uTags,uConsts;





type
  TfMain = class(TForm)
    btnStart: TButton;
    Log: TMemo;
    lblInstructions: TLabel;
    pbProgress: TcxProgressBar;
    procedure btnStartClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    PythonEngine: TPythonEngine;
    columns_xpath: Variant;
    columns_name: Variant;
    procedure ProcessDonorCsv;
    procedure ProcessCbuCsv;
    procedure CreatePythonEngine;
    procedure DestroyPythonEngine;
    procedure iterate_over_donors(const aFile: Variant; const aDonors: variant);
    procedure iterate_over_cbu(const aFile: Variant; const aCbus: variant);
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure TfMain.btnStartClick(Sender: TObject);
var
  et: variant;
  tree: variant;
  root: Variant;
  inventory: variant;
  dlg: TOpenDialog;
  file_open: Variant;

begin
  et := Import(cElementTreeLib);
  dlg := TOpenDialog.Create(nil);
  try
    if (dlg.Execute) then
    begin
      tree := et.parse(Utf8Encode(dlg.FileName));
      root := tree.getroot();
      try
        for inventory in VarPyIterate(root.findall(cInventoryTag)) do
        begin
          try
            file_open := BuiltinModule.open(cOutFull, 'w+');
            try
              file_open.write(BuiltinModule.str(BuiltinModule.str(';').join(columns_name)) +
              VarPythonEval(cPythonNewStringExpresstion));
              pbProgress.Position := 0;
              if (len(inventory.findall(cDonorTag)) > 0) then
              begin
                pbProgress.Position := 0;
                iterate_over_donors(VarPythonCreate(file_open), VarPythonCreate(inventory.findall(cDonorTag)));
                ProcessDonorCsv;
              end;

              if (len(inventory.findall(cCBUTag)) > 0) then
              begin
                pbProgress.Position := 0;
                iterate_over_cbu(VarPythonCreate(file_open), VarPythonCreate(inventory.findall(cCBUTag)));
                ProcessCbuCsv;
              end;

            finally
              file_open.close()
            end;

          except
            on EPyStopIteration do
            begin

            end;
          end;
        end;
      except
        on EPyStopIteration do
        begin

        end;
      end;

    end;
  finally
    dlg.free;
  end;
end;

procedure TfMain.CreatePythonEngine;
begin
  PythonEngine := TPythonEngine.Create(nil);
  with PythonEngine do
  begin
    AutoLoad := False;
    DllName := cPythonDll;
    DllPath := cPythonInstalledDir;
    APIVersion := 1013;
    RegVersion := '3.9';
    UseLastKnownVersion := False;
    PyFlags := [pfOptimize];
  end;
  MaskFPUExceptions(true);
  PythonEngine.LoadDLL;
end;

procedure TfMain.DestroyPythonEngine;
begin
  if (Assigned(PythonEngine)) then
  begin
    PythonEngine.Finalize;
    FreeAndNil(PythonEngine);
  end;
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  if (not FileExists(cPythonDllFullPath)) then
  begin
    raise Exception.Create('Python39.dll not found.');
    Application.Terminate;
  end;
  CreatePythonEngine;
  columns_xpath := BuiltinModule.list(VarPythonCreate(cTagsXPathList));
  columns_name := BuiltinModule.list(VarPythonCreate(cHeadersList));
  if(len(columns_xpath)  <>len(columns_name) ) then
  begin
  raise Exception.Create('Count of the tags xpath and header are not the same!  '+IntToStr(len(columns_xpath))+' a columns_name'+IntToStr(len(columns_name))+'  ');
      Application.Terminate;
  end;
end;

procedure TfMain.FormDestroy(Sender: TObject);
begin
  DestroyPythonEngine;
end;

procedure TfMain.iterate_over_cbu(const aFile: Variant; const aCBUs: Variant);
var
  cbu: variant;
  tag: variant;
  tag_name: Variant;
  donor_row: Variant;
  final_list: Variant;
begin

  final_list := BuiltinModule.list();
    pbProgress.Properties.Max :=  len(aCBUs) ;
  for cbu in VarPyIterate(aCBUs) do
  begin
    donor_row := BuiltinModule.list();
    for tag_name in VarPyIterate(columns_xpath) do
    begin
      tag := cbu.find(UTF8Encode(cXPathStart + tag_name));
      if (tag <> None) then
      begin

        if (tag.text <> None) then
          donor_row.append(UTF8Encode(Trim(VarPythonAsString(tag.text.strip()))))
        else
          donor_row.append(UTF8Encode(cEmptyTag))
      end
      else
        donor_row.append(UTF8Encode(EmptyStr))
    end;
    final_list.append(BuiltinModule.str(BuiltinModule.str(cCSVDelimiter).join(donor_row))
    + VarPythonEval(cPythonNewStringExpresstion));
    pbProgress.Position := pbProgress.Position + 1;
        Application.ProcessMessages  ;
    if (len(final_list) > 10000) then
    begin
      log.Lines.Add('10000');
      Application.ProcessMessages;
      aFile.writelines(final_list);
      final_list.clear()
    end;
  end;
  if (len(final_list) > 0) then
  begin
    log.Lines.Add(VarPythonAsString(len(final_list)));
    Application.ProcessMessages;
    aFile.writelines(final_list);
    final_list.clear()
  end;
end;

procedure TfMain.iterate_over_donors(const aFile: Variant; const aDonors: variant);
var
  donor: variant;
  tag: variant;
  tag_name: Variant;
  donor_row: Variant;
  final_list: Variant;
begin
  pbProgress.Properties.Max :=  len(aDonors) ;
  final_list := BuiltinModule.list();
  for donor in VarPyIterate(aDonors) do
  begin
    donor_row := BuiltinModule.list();
    for tag_name in VarPyIterate(columns_xpath) do
    begin
      tag := donor.find(UTF8Encode(cXPathStart + tag_name));
      if (tag <> None) then
      begin
        if (tag.text <> None) then
          donor_row.append(UTF8Encode(Trim(VarPythonAsString(tag.text.strip()))))
        else
          donor_row.append(UTF8Encode(cEmptyTag))
      end
      else
        donor_row.append(UTF8Encode(EmptyStr))
    end;
    final_list.append(BuiltinModule.str(BuiltinModule.str(cCSVDelimiter).join(donor_row)) + VarPythonEval(cPythonNewStringExpresstion));
    pbProgress.Position := pbProgress.Position + 1;
    Application.ProcessMessages ;
    if (len(final_list) > 10000) then
    begin
      log.Lines.Add('10000');
      Application.ProcessMessages;
      aFile.writelines(final_list);
      final_list.clear()
    end;
  end;
  if (len(final_list) > 0) then
  begin
    log.Lines.Add(VarPythonAsString(len(final_list)));
    Application.ProcessMessages;
    aFile.writelines(final_list);
    final_list.clear()
  end;
end;

procedure TfMain.ProcessCbuCsv;
var
  pd: variant;
  df: Variant;
  datetime:Variant;
  os:Variant;
begin
    pd := Import(cPandasLib);
    datetime := Import(cDateTimeLib);
    os := Import(cOsLib);
    df := pd.read_csv(UTF8Encode(cOutFull), UTF8Encode(';'));
    df := df.dropna(1, UTF8Encode('all'));
    df.to_csv(UTF8Encode(format(cDropped,['C',datetime.datetime.now().strftime('%y%m%d%H%M%S')]) )) ;
    os.remove(cOutFull)
end;

procedure TfMain.ProcessDonorCsv;
var
  pd: variant;
  df: Variant;
  datetime:Variant;
  os:Variant;
begin
    pd := Import(cPandasLib);
    datetime := Import(cDateTimeLib);
    os := Import(cOsLib);
    df := pd.read_csv(UTF8Encode(cOutFull), UTF8Encode(';'));
    df := df.dropna(1, UTF8Encode('all'));
    df.to_csv(UTF8Encode(format(cDropped,['D',datetime.datetime.now().strftime('%y%m%d%H%M%S')]) )) ;
    os.remove(cOutFull)
end;

end.

