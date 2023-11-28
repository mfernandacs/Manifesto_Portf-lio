unit Manifesto.Carregamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, W7Classes, W7ProgressBars,
  Vcl.StdCtrls, Vcl.ExtCtrls, AdvWiiProgressBar, Vcl.Buttons;

  Type
  TFrmCarregamento = class(TForm)
    LblMensagem: TLabel;
    PgbSemProgresso: TAdvWiiProgressBar;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    Titulo: String;
    SemProgresso: Boolean;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ATitulo, AMensagem: String;
    AValorMinimo: Integer = 0; AValorMaximo: Integer = 100; ASemProgresso: Boolean = False);
  end;

var
  FrmCarregamento: TFrmCarregamento;

implementation

{$R *.dfm}

constructor TFrmCarregamento.Create(AOwner: TComponent; ATitulo, AMensagem: String;
    AValorMinimo: Integer = 0; AValorMaximo: Integer = 100; ASemProgresso: Boolean = False);
begin
  inherited
  Create(AOwner);
  Self.Titulo                   := ATitulo;
  Self.SemProgresso             := ASemProgresso;
  Self.LblMensagem.Caption      := AMensagem;
end;

procedure TFrmCarregamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_Escape then
    Self.Close();
end;

procedure TFrmCarregamento.SpeedButton1Click(Sender: TObject);
begin
 close;
end;

end.
