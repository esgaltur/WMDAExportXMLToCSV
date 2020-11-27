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
  PythonEngine, Vcl.StdCtrls, VarPyth, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxProgressBar;

const
  cPythonPlaceDir = 'D:\Python39\';
  cPythondll = 'python39.dll';
  cPythonPlace = cPythonPlaceDir + cPythondll;
  cOutFull = './out_full.csv';
  cDropped = './out_dropped.csv';
  cPandas = 'pandas';
  cElementTree = 'xml.etree.ElementTree';
  c_place = './';

  c_el_list: array of string = ['GRID',
 'ATTR',
 'BIRTH_DATE',
 'SEX',
 'ABO',
 'RHESUS',
 'ETHN',
 'CCR5',
 'HLA',
 'KIR',
 'IDM',
 'RSV_PAT',
 'STATUS',
 'STAT_END_DATE',
 'STAT_REASON',
 'CONTACT_DATE',
 'CHECKUP_DATE',
 'WEIGHT',
 'HEIGHT',
 'NMBR_TRANS',
 'NMBR_PREG',
 'NMBR_MARR',
 'NMBR_PBSC',
 'COLL_TYPE',
 'STAT_REASON',
 'LOCAL_ID',
 'BAG_ID',
 'BANK_MANUF_ID',
 'BANK_DISTRIB_ID',
 'COLL_DATE',
 'PROC_DATE',
 'PROC_METH',
 'PROC_METH_TYPE',
 'FREEZE_DATE',
 'FREEZE_METH',
 'PROD_MOD',
 'BAG_TYPE',
 'BAGS',
 'BACT_CULT',
 'FUNG_CULT',
 'HEMO_STATUS',
 'VOL',
 'VOL_FRZN',
 'TNC',
 'TNC_FRZN',
 'RED_BC_FRZN',
 'MNC_FRZN',
 'CD34PC',
 'CD34PC_FRZN',
 'CFU_FRZN',
 'VIABILITY',
 'VIABILITY_DATE',
 'VIABILITY_CELLS',
 'VIABILITY_METHOD',
 'ATT_SEG',
 'DNA_SMPL',
 'OTH_SMPL',
 'CT_COMPLETE_DATE',
 'CT_SMPL_TYPE',
 'AL_RED_BC',
 'AL_SER',
 'SER_QUANT',
 'AL_PLA',
 'PLA_QUANT',
 'ID',
 'MAT_ID',
 'MAT_ID_BANK',
 'AL_SER',
 'SER_QUANT',
 'AL_PLA',
 'PLA_QUANT',
 'IDM/CMV',
 'IDM/CMV_NAT',
 'IDM/CMV_DATE',
 'IDM/HBS_AG',
 'IDM/ANTI_HBC',
 'IDM/ANTI_HBS',
 'IDM/ANTI_HCV',
 'IDM/ANTI_HIV_12',
 'IDM/HIV_1_NAT',
 'IDM/HIV_P24',
 'IDM/HCV_NAT',
 'IDM/ANTI_HTLV',
 'IDM/SYPHILIS',
 'IDM/WNV',
 'IDM/CHAGAS',
 'IDM/EBV',
 'IDM/TOXO',
 'IDM/HBV_NAT',
 'IDM/PB19_NAT',
 'IDM/ALT',
 'MAT/IDM/CMV',
 'MAT/IDM/CMV_NAT',
 'MAT/IDM/CMV_DATE',
 'MAT/IDM/HBS_AG',
 'MAT/IDM/ANTI_HBC',
 'MAT/IDM/ANTI_HBS',
 'MAT/IDM/ANTI_HCV',
 'MAT/IDM/ANTI_HIV_12',
 'MAT/IDM/HIV_1_NAT',
 'MAT/IDM/HIV_P24',
 'MAT/IDM/HCV_NAT',
 'MAT/IDM/ANTI_HTLV',
 'MAT/IDM/SYPHILIS',
 'MAT/IDM/WNV',
 'MAT/IDM/CHAGAS',
 'MAT/IDM/EBV',
 'MAT/IDM/TOXO',
 'MAT/IDM/HBV_NAT',
 'MAT/IDM/PB19_NAT',
 'MAT/IDM/ALT',
 'KIR/KIR2DL1',
 'KIR/KIR2DL2',
 'KIR/KIR2DL3',
 'KIR/KIR2DL4',
 'KIR/KIR2DL5A',
 'KIR/KIR2DL5B',
 'KIR/KIR2DS1',
 'KIR/KIR2DS2',
 'KIR/KIR2DS3',
 'KIR/KIR2DS4',
 'KIR/KIR2DS5',
 'KIR/KIR2DP1',
 'KIR/KIR3DL1',
 'KIR/KIR3DL2',
 'KIR/KIR3DL3',
 'KIR/KIR3DS1',
 'KIR/KIR3DP1',
 'KIR/KIR_GL',
 'HLA/A/SER/FIELD1',
 'HLA/A/SER/FIELD2',
 'HLA/A/DNA/FIELD1',
 'HLA/A/DNA/FIELD2',
 'HLA/B/SER/FIELD1',
 'HLA/B/SER/FIELD2',
 'HLA/B/DNA/FIELD1',
 'HLA/B/DNA/FIELD2',
 'HLA/C/SER/FIELD1',
 'HLA/C/SER/FIELD2',
 'HLA/C/DNA/FIELD1',
 'HLA/C/DNA/FIELD2',
 'HLA/DRB1/SER/FIELD1',
 'HLA/DRB1/SER/FIELD2',
 'HLA/DRB1/DNA/FIELD1',
 'HLA/DRB1/DNA/FIELD2',
 'HLA/DRB3/DNA/FIELD1',
 'HLA/DRB3/DNA/FIELD2',
 'HLA/DRB4/DNA/FIELD1',
 'HLA/DRB4/DNA/FIELD2',
 'HLA/DRB5/DNA/FIELD1',
 'HLA/DRB5/DNA/FIELD2',
 'HLA/DQA1/DNA/FIELD1',
 'HLA/DQA1/DNA/FIELD2',
 'HLA/DQB1/SER/FIELD1',
 'HLA/DQB1/SER/FIELD2',
 'HLA/DQB1/DNA/FIELD1',
 'HLA/DQB1/DNA/FIELD2',
 'HLA/DQB1/DNA/FIELD1',
 'HLA/DPA1/DNA/FIELD1',
 'HLA/DPA1/DNA/FIELD2',
 'HLA/DPB1/DNA/FIELD1',
 'HLA/DPB1/DNA/FIELD2',
 'MAT/HLA/A/SER/FIELD1',
 'MAT/HLA/A/SER_FIELD2',
 'MAT/HLA/A/DNA/FIELD1',
 'MAT/HLA/A/DNA/FIELD2',
 'MAT/HLA/B/SER/FIELD1',
 'MAT/HLA/B/SER/FIELD2',
 'MAT/HLA/B/DNA/FIELD1',
 'MAT/HLA/B/DNA/FIELD2',
 'MAT/HLA/C/SER/FIELD1',
 'MAT/HLA/C/SER/FIELD2',
 'MAT/HLA/C/DNA/FIELD1',
 'MAT/HLA/C/DNA/FIELD2',
 'MAT/HLA/DRB1/SER/FIELD1',
 'MAT/HLA/DRB1/SER/FIELD2',
 'MAT/HLA/DRB1/DNA/FIELD1',
 'MAT/HLA/DRB1/DNA/FIELD2',
 'MAT/HLA/DRB3/DNA/FIELD1',
 'MAT/HLA/DRB3/DNA/FIELD2',
 'MAT/HLA/DRB4/DNA/FIELD1',
 'MAT/HLA/DRB4/DNA/FIELD2',
 'MAT/HLA/DRB5/DNA/FIELD1',
 'MAT/HLA/DRB5/DNA/FIELD2',
 'MAT/HLA/DQA1/DNA/FIELD1',
 'MAT/HLA/DQA1/DNA/FIELD2',
 'MAT/HLA/DQB1/SER/FIELD1',
 'MAT/HLA/DQB1/SER/FIELD2',
 'MAT/HLA/DQB1/DNA/FIELD1',
 'MAT/HLA/DQB1/DNA/FIELD2',
 'MAT/HLA/DPA1/DNA/FIELD1',
 'MAT/HLA/DPA1/DNA/FIELD2',
 'MAT/HLA/DPB1/DNA/FIELD1',
 'MAT/HLA/DPB1/DNA/FIELD2',
 'IDM/ANTI_CMV',
 'IDM/ANTI_CMV_DATE',
 'IDM/CMV_NAT_DATE',
 'MAT/IDM/ANTI_CMV',
 'MAT/IDM/ANTI_CMV_DATE',
 'MAT/IDM/CMV_NAT_DATE'];

  c_el_names: array of string = ['GRID',
 'ATTR',
 'BIRTH_DATE',
 'SEX',
 'ABO',
 'RHESUS',
 'ETHN',
 'CCR5',
 'HLA',
 'KIR',
 'IDM',
 'RSV_PAT',
 'STATUS',
 'STAT_END_DATE',
 'STAT_REASON',
 'CONTACT_DATE',
 'CHECKUP_DATE',
 'WEIGHT',
 'HEIGHT',
 'NMBR_TRANS',
 'NMBR_PREG',
 'NMBR_MARR',
 'NMBR_PBSC',
 'COLL_TYPE',
 'STAT_REASON',
 'LOCAL_ID',
 'BAG_ID',
 'BANK_MANUF_ID',
 'BANK_DISTRIB_ID',
 'COLL_DATE',
 'PROC_DATE',
 'PROC_METH',
 'PROC_METH_TYPE',
 'FREEZE_DATE',
 'FREEZE_METH',
 'PROD_MOD',
 'BAG_TYPE',
 'BAGS',
 'BACT_CULT',
 'FUNG_CULT',
 'HEMO_STATUS',
 'VOL',
 'VOL_FRZN',
 'TNC',
 'TNC_FRZN',
 'RED_BC_FRZN',
 'MNC_FRZN',
 'CD34PC',
 'CD34PC_FRZN',
 'CFU_FRZN',
 'VIABILITY',
 'VIABILITY_DATE',
 'VIABILITY_CELLS',
 'VIABILITY_METHOD',
 'ATT_SEG',
 'DNA_SMPL',
 'OTH_SMPL',
 'CT_COMPLETE_DATE',
 'CT_SMPL_TYPE',
 'AL_RED_BC',
 'AL_SER',
 'SER_QUANT',
 'AL_PLA',
 'PLA_QUANT',
 'ID',
 'MAT_ID',
 'MAT_ID_BANK',
 'AL_SER',
 'SER_QUANT',
 'AL_PLA',
 'PLA_QUANT',
 'IDM_CMV',
 'IDM_CMV_NAT',
 'IDM_CMV_DATE',
 'IDM_HBS_AG',
 'IDM_ANTI_HBC',
 'IDM_ANTI_HBS',
 'IDM_ANTI_HCV',
 'IDM_ANTI_HIV_12',
 'IDM_HIV_1_NAT',
 'IDM_HIV_P24',
 'IDM_HCV_NAT',
 'IDM_ANTI_HTLV',
 'IDM_SYPHILIS',
 'IDM_WNV',
 'IDM_CHAGAS',
 'IDM_EBV',
 'IDM_TOXO',
 'IDM_HBV_NAT',
 'IDM_PB19_NAT',
 'IDM_ALT',
 'MAT_IDM_CMV',
 'MAT_IDM_CMV_NAT',
 'MAT_IDM_CMV_DATE',
 'MAT_IDM_HBS_AG',
 'MAT_IDM_ANTI_HBC',
 'MAT_IDM_ANTI_HBS',
 'MAT_IDM_ANTI_HCV',
 'MAT_IDM_ANTI_HIV_12',
 'MAT_IDM_HIV_1_NAT',
 'MAT_IDM_HIV_P24',
 'MAT_IDM_HCV_NAT',
 'MAT_IDM_ANTI_HTLV',
 'MAT_IDM_SYPHILIS',
 'MAT_IDM_WNV',
 'MAT_IDM_CHAGAS',
 'MAT_IDM_EBV',
 'MAT_IDM_TOXO',
 'MAT_IDM_HBV_NAT',
 'MAT_IDM_PB19_NAT',
 'MAT_IDM_ALT',
 'KIR_KIR2DL1',
 'KIR_KIR2DL2',
 'KIR_KIR2DL3',
 'KIR_KIR2DL4',
 'KIR_KIR2DL5A',
 'KIR_KIR2DL5B',
 'KIR_KIR2DS1',
 'KIR_KIR2DS2',
 'KIR_KIR2DS3',
 'KIR_KIR2DS4',
 'KIR_KIR2DS5',
 'KIR_KIR2DP1',
 'KIR_KIR3DL1',
 'KIR_KIR3DL2',
 'KIR_KIR3DL3',
 'KIR_KIR3DS1',
 'KIR_KIR3DP1',
 'KIR_KIR_GL',
 'HLA_A_SER_FIELD1',
 'HLA_A_SER_FIELD2',
 'HLA_A_DNA_FIELD1',
 'HLA_A_DNA_FIELD2',
 'HLA_B_SER_FIELD1',
 'HLA_B_SER_FIELD2',
 'HLA_B_DNA_FIELD1',
 'HLA_B_DNA_FIELD2',
 'HLA_C_SER_FIELD1',
 'HLA_C_SER_FIELD2',
 'HLA_C_DNA_FIELD1',
 'HLA_C_DNA_FIELD2',
 'HLA_DRB1_SER_FIELD1',
 'HLA_DRB1_SER_FIELD2',
 'HLA_DRB1_DNA_FIELD1',
 'HLA_DRB1_DNA_FIELD2',
 'HLA_DRB3_DNA_FIELD1',
 'HLA_DRB3_DNA_FIELD2',
 'HLA_DRB4_DNA_FIELD1',
 'HLA_DRB4_DNA_FIELD2',
 'HLA_DRB5_DNA_FIELD1',
 'HLA_DRB5_DNA_FIELD2',
 'HLA_DQA1_DNA_FIELD1',
 'HLA_DQA1_DNA_FIELD2',
 'HLA_DQB1_SER_FIELD1',
 'HLA_DQB1_SER_FIELD2',
 'HLA_DQB1_DNA_FIELD1',
 'HLA_DQB1_DNA_FIELD2',
 'HLA_DQB1_DNA_FIELD1',
 'HLA_DPA1_DNA_FIELD1',
 'HLA_DPA1_DNA_FIELD2',
 'HLA_DPB1_DNA_FIELD1',
 'HLA_DPB1_DNA_FIELD2',
 'MAT_HLA_A_SER_FIELD1',
 'MAT_HLA_A_SER_FIELD2',
 'MAT_HLA_A_DNA_FIELD1',
 'MAT_HLA_A_DNA_FIELD2',
 'MAT_HLA_B_SER_FIELD1',
 'MAT_HLA_B_SER_FIELD2',
 'MAT_HLA_B_DNA_FIELD1',
 'MAT_HLA_B_DNA_FIELD2',
 'MAT_HLA_C_SER_FIELD1',
 'MAT_HLA_C_SER_FIELD2',
 'MAT_HLA_C_DNA_FIELD1',
 'MAT_HLA_C_DNA_FIELD2',
 'MAT_HLA_DRB1_SER_FIELD1',
 'MAT_HLA_DRB1_SER_FIELD2',
 'MAT_HLA_DRB1_DNA_FIELD1',
 'MAT_HLA_DRB1_DNA_FIELD2',
 'MAT_HLA_DRB3_DNA_FIELD1',
 'MAT_HLA_DRB3_DNA_FIELD2',
 'MAT_HLA_DRB4_DNA_FIELD1',
 'MAT_HLA_DRB4_DNA_FIELD2',
 'MAT_HLA_DRB5_DNA_FIELD1',
 'MAT_HLA_DRB5_DNA_FIELD2',
 'MAT_HLA_DQA1_DNA_FIELD1',
 'MAT_HLA_DQA1_DNA_FIELD2',
 'MAT_HLA_DQB1_SER_FIELD1',
 'MAT_HLA_DQB1_SER_FIELD2',
 'MAT_HLA_DQB1_DNA_FIELD1',
 'MAT_HLA_DQB1_DNA_FIELD2',
 'MAT_HLA_DPA1_DNA_FIELD1',
 'MAT_HLA_DPA1_DNA_FIELD2',
 'MAT_HLA_DPB1_DNA_FIELD1',
 'MAT_HLA_DPB1_DNA_FIELD2',
 'IDM_ANTI_CMV',
 'IDM_ANTI_CMV_DATE',
 'IDM_CMV_NAT_DATE',
 'MAT_IDM_ANTI_CMV',
 'MAT_IDM_ANTI_CMV_DATE',
 'MAT_IDM_CMV_NAT_DATE'];

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
  et, pd: variant;
  tree: variant;
  root: Variant;
  inventory: variant;
  dlg: TOpenDialog;
  file_open: Variant;
  df: Variant;
  datetime:Variant;
  os:Variant;
begin
  et := Import(cElementTree);
  dlg := TOpenDialog.Create(nil);
  try
    if (dlg.Execute) then
    begin
      tree := et.parse(Utf8Encode(dlg.FileName));
      root := tree.getroot();
      try
        for inventory in VarPyIterate(root.findall('INVENTORY')) do
        begin
          try
            file_open := BuiltinModule.open(cOutFull, 'w+');
            try
              file_open.write(BuiltinModule.str(BuiltinModule.str(';').join(columns_name)) + VarPythonEval('str(''\n'')'));
              pbProgress.Position := 0;
              if (len(inventory.findall('DONOR')) > 0) then
              begin
                pbProgress.Position := 0;
                iterate_over_donors(VarPythonCreate(file_open), VarPythonCreate(inventory.findall('DONOR')));
              end;

              if (len(inventory.findall('CBU')) > 0) then
              begin
                pbProgress.Position := 0;
                iterate_over_cbu(VarPythonCreate(file_open), VarPythonCreate(inventory.findall('CBU')));
              end;
            finally
              file_open.close()
            end;
            pd := Import(cPandas);
            datetime := Import('datetime');
            os := Import('os');

            df := pd.read_csv(UTF8Encode(cOutFull), UTF8Encode(';'));
            df := df.dropna(1, UTF8Encode('all'));
            df.to_csv(UTF8Encode(cDropped+ datetime.datetime.now().strftime('%y%m%d%H%M%S'))) ;
            os.remove(cOutFull)
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
    DllName := cPythondll;
    DllPath := cPythonPlaceDir;
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
  if (not FileExists(cPythonPlace)) then
  begin
    raise Exception.Create('Python39.dll not found.');
    Application.Terminate;
  end;
  CreatePythonEngine;
  columns_xpath := BuiltinModule.list(VarPythonCreate(c_el_list));
  columns_name := BuiltinModule.list(VarPythonCreate(c_el_names));
  if(len(columns_xpath)  <>len(columns_name) ) then
  begin
  raise Exception.Create('Pocet elementu columns_xpath '+IntToStr(len(columns_xpath))+' a columns_name'+IntToStr(len(columns_name))+'  se neshoduje ');
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
      tag := cbu.find(UTF8Encode(c_place + tag_name));
      if (tag <> None) then
      begin
//      if (tag.tag = 'ID') then
//        Memo1.Lines.Add(VarPythonAsString(BuiltinModule.str('').join(element4.text)));

        if (tag.text <> None) then
          donor_row.append(UTF8Encode(Trim(VarPythonAsString(tag.text.strip()))))
        else
          donor_row.append(UTF8Encode('Empty_Tag'))
      end
      else
        donor_row.append(UTF8Encode(''))
    end;
    final_list.append(BuiltinModule.str(BuiltinModule.str(';').join(donor_row)) + VarPythonEval('str(''\n'')'));
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
      tag := donor.find(UTF8Encode(c_place + tag_name));
      if (tag <> None) then
      begin
//    if (tag.tag = 'ID') then
//      Memo1.Lines.Add(VarPythonAsString(BuiltinModule.str('').join(element4.text)));

        if (tag.text <> None) then
          donor_row.append(UTF8Encode(Trim(VarPythonAsString(tag.text.strip()))))
        else
          donor_row.append(UTF8Encode('Empty_Tag'))
      end
      else
        donor_row.append(UTF8Encode(''))
    end;
    final_list.append(BuiltinModule.str(BuiltinModule.str(';').join(donor_row)) + VarPythonEval('str(''\n'')'));
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
  {      document := et.parse(Utf8Encode(dlg.FileName));
      I := 0;
      while (I <= BuiltinModule.len(BuiltinModule.list(document.iterfind('INVENTORIES')))) do
      begin
       element  :=    document.iterfind('INVENTORIES');
       VarPythonAsString(BuiltinModule.list(document.iterfind('INVENTORIES')))  ;
        J := 0;
        while (J <= BuiltinModule.len(BuiltinModule.list(element.findtext('INVENTORY')))) do
        begin
          element1 := document.findtext('INVENTORY');
          Memo1.Lines.Add(VarPythonAsString(BuiltinModule.str('').join(element1)));
          Inc(J);
          document.findtext('INVENTORY').__next__()
        end;
        Inc(I);

      end;}

end.

