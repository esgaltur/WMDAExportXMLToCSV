program WMDAExportXMLToCsv;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  uTags in 'uTags.pas',
  uConsts in 'uConsts.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
