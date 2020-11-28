program WMDAExportXMLToCsv;

uses
  Vcl.Forms,
  uMain in 'units/uMain.pas' {fMain},
  uTags in 'units/uTags.pas',
  uConsts in 'units/uConsts.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
