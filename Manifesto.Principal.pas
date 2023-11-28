unit Manifesto.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvGlowButton,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Manifesto.Controller, Manifesto.Model,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Manifesto.Carregamento,
  Manifesto.DAO, Manifesto.Evento;

type
  TFrmManifesto = class(TForm)
    PnlTop: TPanel;
    btnSair: TSpeedButton;
    Panel1: TPanel;
    PnlBotoes: TPanel;
    BtnBuscar: TAdvGlowButton;
    BtnEvento: TAdvGlowButton;
    tmrBuscarNotas: TTimer;
    DBGrid1: TDBGrid;
    procedure BtnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnEventoClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    ThreadManifesto: TManifesto;
    CodDestinatario, CodUFDestinatario: Integer;
    CNPJDestinatario, Certificado, NSU: String;
    NotaSelecionada : TNotaManifesto;
    procedure BuscarNotas();
    procedure EnviarEvento();

  public
    { Public declarations }
  end;


var
 FrmManifesto : TFrmManifesto;

implementation

procedure TFrmManifesto.BuscarNotas;
begin
  FrmCarregamento := TFrmCarregamento.Create(Self, 'Buscando notas',
      'Pressione Esc para finalizar a busca.', 0, 100, True);
  try
    Self.ThreadManifesto := TManifesto.Create(True, Self.Certificado, Self.CNPJDestinatario, Self.CodDestinatario, Self.CodUFDestinatario);
    tmrBuscarNotas.Enabled := True;
    Application.ProcessMessages();

    NSU := DmManifesto.ObterUltimoNSU();

    Self.ThreadManifesto.SetConfig(NSU, Self.CodDestinatario, Self.CodUFDestinatario);
    Self.ThreadManifesto.Start();
    FrmCarregamento.ShowModal();
  finally
    Self.ThreadManifesto.Parar := True;
    tmrBuscarNotas.Enabled := False;
    FreeAndNil(FrmCarregamento);
  end;

end;


procedure TFrmManifesto.BtnEventoClick(Sender: TObject);
begin
  Self.EnviarEvento();
end;

procedure TFrmManifesto.btnSairClick(Sender: TObject);
begin
  Application.Terminate();
end;

procedure TFrmManifesto.DBGrid1CellClick(Column: TColumn);
begin
  Self.NotaSelecionada := DmManifesto.ObterNota(dbgrid1.DataSource.DataSet.FieldByName('ChaveAcesso').AsString);
end;

procedure TFrmManifesto.EnviarEvento;
var
  FrmEventoManifesto : TFrmEventoManifesto;
begin
  if not(Self.NotaSelecionada.ChaveAcesso.IsEmpty) then
  begin
    FrmEventoManifesto := TFrmEventoManifesto.Create(Self, Self.CodUFDestinatario, Self.CNPJDestinatario,
      Self.Certificado, Self.NotaSelecionada.ChaveAcesso);
    try
      FrmEventoManifesto.ShowModal();
      if FrmEventoManifesto.Enviado then
      begin
        Self.NotaSelecionada.Evento     := FrmEventoManifesto.Evento;
        Self.NotaSelecionada.DataEvento := Now();
        Self.NotaSelecionada.XMLNota    := FrmEventoManifesto.XMLNota;
        DmManifesto.AlterarNota(Self.NotaSelecionada);

      end;
    finally
      FreeAndNil(FrmEventoManifesto);
    end;
  end
  else
  begin
    MessageDlg('Selecione uma nota antes de enviar um evento!', mtInformation, [mbOK], 0);
  end;

end;

procedure TFrmManifesto.FormCreate(Sender: TObject);
begin
  Self.CodDestinatario   := 1;
  Self.CNPJDestinatario  := '09290287000106';
  Self.CodUFDestinatario := 0;
  Self.Certificado       := '344C926270A1F9E607394F98CBBF72E9E6F5C6E0';

end;


procedure TFrmManifesto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Application.Terminate();

end;

procedure TFrmManifesto.BtnBuscarClick(Sender: TObject);
begin
  Self.BuscarNotas();
end;


{$R *.dfm}

end.
