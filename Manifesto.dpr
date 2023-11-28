program Manifesto;

uses
  Vcl.Forms,
  Manifesto.Principal in 'Manifesto.Principal.pas' {FrmManifesto},
  Manifesto.Model in 'Manifesto.Model.pas',
  Manifesto.Configuracao.Model in 'Manifesto.Configuracao.Model.pas',
  Manifesto.Controller in 'Manifesto.Controller.pas',
  Manifesto.Evento.Controller in 'Manifesto.Evento.Controller.pas',
  Manifesto.Carregamento in 'Manifesto.Carregamento.pas' {FrmCarregamento},
  Manifesto.Evento in 'Manifesto.Evento.pas' {FrmEventoManifesto},
  Manifesto.DAO in 'Manifesto.DAO.pas' {DmManifesto: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmManifesto, frmManifesto);
  Application.CreateForm(TDmManifesto, DmManifesto);
  Application.Run;
end.
