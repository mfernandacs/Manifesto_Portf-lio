unit Manifesto.Evento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Manifesto.Evento.Controller, Manifesto.Carregamento, AdvGlowButton;

type
  TFrmEventoManifesto = class(TForm)
    PnlTop: TPanel;
    btnSair: TSpeedButton;
    Panel1: TPanel;
    RdbConfirmacao: TRadioButton;
    RdbNaoRealizada: TRadioButton;
    RdbDesconhecimento: TRadioButton;
    RdbCiencia: TRadioButton;
    BtnEnviar: TAdvGlowButton;
    MemJustificativa: TMemo;
    Label1: TLabel;
    procedure BtnEnviarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    EventoManifesto: TEventoManifesto;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; ACodUF: Integer; ACNPJ, ACertificado, AChaveAcesso: String);
    function CodigoEvento : Integer;
    function EnviarEvento(ACodEvento: Integer; AJust: String): Boolean;

    var
      Evento, XMLNota, CNPJ, ChaveAcesso, Just: String;
      Enviado, Importar: Boolean;
      CodEvento, CodUF: Integer;
  end;

var
  FrmEventoManifesto: TFrmEventoManifesto;

implementation

{$R *.dfm}

constructor TFrmEventoManifesto.Create(aOwner: TComponent; ACodUF: Integer;
  ACNPJ, ACertificado, AChaveAcesso: String);
begin
  inherited Create(aOwner);
  Self.CodUF := ACodUF;
  Self.CNPJ := ACNPJ;
  Self.ChaveAcesso := AChaveAcesso;
  Self.EventoManifesto := TEventoManifesto.Create(ACertificado, ACNPJ);
  Self.MemJustificativa.Visible := False;
  Self.MemJustificativa.Lines.Text := '';
end;

procedure TFrmEventoManifesto.BtnEnviarClick(Sender: TObject);
begin
 Self.CodigoEvento();
  if not((CodEvento = 0) or (CodEvento = 1) or (CodEvento = 2) or (CodEvento = 3)) then
  begin
    MessageDlg('Selecione um evento antes de enviar!', mtInformation, [mbOK], 0);
    exit();
  end;
  if(CodEvento=1) and (Just='') then
  begin
    MessageDlg('� necess�rio informar a justificativa!', mtInformation, [mbOK], 0);
    exit();
  end;
  Self.EnviarEvento(CodEvento, Just);
end;

procedure TFrmEventoManifesto.btnSairClick(Sender: TObject);
begin
 Close;
end;

function TFrmEventoManifesto.CodigoEvento : Integer;
begin
  if Self.RdbConfirmacao.Checked then
  begin
    CodEvento := 0;
    Evento := 'Confirma��o de Opera��o';
    Just := '';
  end
  else if Self.RdbNaoRealizada.Checked then
  begin
    CodEvento := 1;
    Evento := 'Opera��o n�o Realizada';
    Just := Self.MemJustificativa.Lines.Text;
  end
  else if Self.RdbDesconhecimento.Checked then
  begin
    CodEvento := 2;
    Evento := 'Desconhecimento da Opera��o';
    Just := '';
  end
  else if Self.Rdbciencia.Checked then
  begin
    CodEvento := 3;
    Evento := 'Ci�ncia da Opera��o';
    Just := '';
  end;
end;

function TFrmEventoManifesto.EnviarEvento(ACodEvento: Integer; AJust: String): Boolean;
var
  FrmCarregamento: TFrmCarregamento;
  I: Integer;
begin
  Result := False;
  if (Evento<>'') then
  begin
    if(Self.EventoManifesto.EnviarEvento(ACodEvento, CodUF, ChaveAcesso, CNPJ, AJust)) then
    begin
      if (CodEvento=0) or (CodEvento=3) then
      begin

        FrmCarregamento := TFrmCarregamento.Create(Self, 'Baixando XML',
          'Envio de evento realizado com sucesso. Baixando o XML da nota.', 0, 100, True);
//        FrmCarregamento := TFrmCarregamento.Create(Self, 'Baixando XML',
//          'Envio de evento realizado com sucesso. Baixando o XML da nota.', 0, 30, True);
        try
          FrmCarregamento.Show();
          Application.ProcessMessages();
          for I := 0 to 30 do
          begin
            Sleep(1000);
          end;
        finally
          FreeAndNil(FrmCarregamento);
        end;

        if not Self.EventoManifesto.BaixarXML(CodUF, CNPJ, ChaveAcesso) then
          MessageDlg('Envio de Evento realizado com sucesso.', mtInformation, [mbOK], 0);

        XMLNota := Self.EventoManifesto.XMLNota;
      end;
      Enviado := True;
      Self.Close;
    end;
  end
  else
  begin
    MessageDlg('Selecione uma op��o de evento!', mtInformation, [mbOK], 0);
  end;
end;

end.
