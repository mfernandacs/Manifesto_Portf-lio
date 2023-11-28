unit Manifesto.DAO;

interface

uses
  System.SysUtils, System.Classes, Manifesto.Model, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDmManifesto = class(TDataModule)
    DsNotas: TDataSource;
    tbNotas: TFDMemTable;
    tbNotasnumNota: TIntegerField;
    tbNotasNomeEmitente: TStringField;
    tbNotasValorNF: TFloatField;
    tbNotasDataEmissao: TDateField;
    tbNotasCodigo: TIntegerField;
    tbNotasXML: TStringField;
    tbNotasChaveAcesso: TStringField;
    tbNotasCodDestinatario: TIntegerField;
    tbNotasIEEmitente: TStringField;
    tbNotasNSU: TIntegerField;
    tbNotasTipo: TStringField;
    tbNotasdigVal: TStringField;
    tbNotasNProt: TStringField;
    tbNotasCSitNFe: TStringField;
    tbNotasSituacao: TStringField;
    tbNotasEvento: TStringField;
    tbNotasXMLNota: TStringField;
    tbNotasDataEvento: TDateField;
    tbNotasCNPJDestinatario: TStringField;
    tbNotasCNPJEmitente: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure NotaToData(NotaManifesto : TNotaManifesto);
    procedure DataToNota(NotaManifesto : TNotaManifesto);
  public
    { Public declarations }
    function InserirNota(NotaManifesto : TNotaManifesto) : Boolean;
    function AlterarNota(NotaManifesto : TNotaManifesto) : Boolean;
    function ObterNota(ChaveAcesso: string): TNotaManifesto;
    function ObterUltimoNSU(): string;
  end;

var
  DmManifesto: TDmManifesto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmManifesto }

function TDmManifesto.AlterarNota(NotaManifesto: TNotaManifesto): Boolean;
begin
  Result := True;

  if tbNotas.Locate('ChaveAcesso', NotaManifesto.ChaveAcesso, []) then
  begin
    try
      Self.tbNotas.Edit();
      Self.NotaToData(NotaManifesto);
      Self.tbNotas.Post();
    except
      Result := False;
    end;
  end;
end;

procedure TDmManifesto.DataModuleCreate(Sender: TObject);
begin
  Self.tbNotas.Close();
  Self.tbNotas.Open();
end;

procedure TDmManifesto.DataToNota(NotaManifesto: TNotaManifesto);
begin
  NotaManifesto.XML              := tbNotas.FieldByName('XML').AsString;
  NotaManifesto.ChaveAcesso      := tbNotas.FieldByName('ChaveAcesso').AsString;
  NotaManifesto.NumNota          := tbNotas.FieldByName('NumNota').AsInteger;
  NotaManifesto.CodDestinatario  := tbNotas.FieldByName('CodDestinatario').AsInteger;
  NotaManifesto.CNPJDestinatario := tbNotas.FieldByName('CNPJDestinatario').AsString;
  NotaManifesto.NomeEmitente     := tbNotas.FieldByName('NomeEmitente').AsString;
  NotaManifesto.CNPJEmitente     := tbNotas.FieldByName('CNPJEmitente').AsString;
  NotaManifesto.IEEmitente       := tbNotas.FieldByName('IEEmitente').AsString;
  NotaManifesto.NSU              := tbNotas.FieldByName('NSU').AsString;
  NotaManifesto.ValorNF          := tbNotas.FieldByName('ValorNF').AsFloat;
  NotaManifesto.DataEmissao      := tbNotas.FieldByName('DataEmissao').AsDateTime;
  NotaManifesto.Tipo             := tbNotas.FieldByName('Tipo').AsString;
  NotaManifesto.DigVal           := tbNotas.FieldByName('digVal').AsString;
  NotaManifesto.NProt            := tbNotas.FieldByName('nProt').AsString;
  NotaManifesto.CSitNFe          := tbNotas.FieldByName('cSitNFe').AsString;
  NotaManifesto.Situacao         := tbNotas.FieldByName('Situacao').AsString;
  NotaManifesto.Evento           := tbNotas.FieldByName('Evento').AsString;
  NotaManifesto.DataEvento       := tbNotas.FieldByName('DataEvento').AsDateTime;
  NotaManifesto.XMLNota          := tbNotas.FieldByName('XMLNota').AsString;
end;

function TDmManifesto.InserirNota(NotaManifesto: TNotaManifesto): Boolean;
begin
  Result := True;
  try
    Self.tbNotas.Append();
    Self.NotaToData(NotaManifesto);
    Self.TbNotas.Post();

  except
    Result := False;
  end;
end;

procedure TDmManifesto.NotaToData(NotaManifesto: TNotaManifesto);
begin
 Self.tbNotasXML.AsString              := NotaManifesto.XML;
  Self.tbNotasChaveAcesso.AsString      := NotaManifesto.ChaveAcesso;

  if trim(NotaManifesto.NumNota.ToString).IsEmpty then
  begin
    Self.tbNotasNumNota.Clear();
  end
  else
  begin
    Self.tbNotasNumNota.AsInteger       := NotaManifesto.NumNota;
  end;

  Self.tbNotasCodDestinatario.AsInteger := NotaManifesto.CodDestinatario;
  Self.tbNotasCNPJDestinatario.AsString := NotaManifesto.CNPJDestinatario;
  Self.tbNotasNomeEmitente.AsString     := NotaManifesto.NomeEmitente;
  Self.tbNotasCNPJEmitente.AsString     := NotaManifesto.CNPJEmitente;

  if trim(NotaManifesto.IEEmitente).IsEmpty then
  begin
    Self.tbNotasIEEmitente.Clear();
  end
  else
  begin
    Self.tbNotasIEEmitente.AsString     := NotaManifesto.IEEmitente;
  end;

  Self.tbNotasNSU.AsString              := NotaManifesto.NSU;

  if trim(NotaManifesto.ValorNF.ToString).IsEmpty then
  begin
    Self.tbNotasValorNF.Clear();
  end
  else
  begin
    Self.tbNotasValorNF.AsFloat         := NotaManifesto.ValorNF;
  end;

  Self.tbNotasDataEmissao.AsDateTime    := NotaManifesto.DataEmissao;
  Self.tbNotasTipo.AsString             := NotaManifesto.Tipo;
  Self.tbNotasDigVal.AsString           := NotaManifesto.DigVal;
  Self.tbNotasnProt.AsString            := NotaManifesto.NProt;

  if trim(NotaManifesto.Situacao).IsEmpty then
  begin
    Self.tbNotasSituacao.Clear();
  end
  else
  begin
    Self.tbNotasSituacao.AsString        := NotaManifesto.Situacao;
  end;

  if trim(NotaManifesto.CSitNFe).IsEmpty then
  begin
    Self.tbNotasCSitNFe.Clear();
  end
  else
  begin
    Self.tbNotasCSitNFe.AsString        := NotaManifesto.CSitNFe;
  end;

  if trim(NotaManifesto.Evento).IsEmpty then
  begin
    Self.tbNotasEvento.Clear();
  end
  else
  begin
    Self.tbNotasEvento.AsString         := NotaManifesto.Evento;
  end;

  Self.tbNotasDataEvento.AsDateTime     := NotaManifesto.DataEvento;

  if trim(NotaManifesto.XMLNota).IsEmpty then
  begin
    Self.tbNotasXMLNota.Clear();
  end
  else
  begin
    Self.tbNotasXMLNota.AsString       := NotaManifesto.XMLNota;
  end;
end;

function TDmManifesto.ObterNota(ChaveAcesso : string): TNotaManifesto;
begin
  Result := nil;

    if tbNotas.Locate('ChaveAcesso', ChaveAcesso, []) then
    begin
      Result := TNotaManifesto.Create();
      Self.DataToNota(Result);
    end;
end;


function TDmManifesto.ObterUltimoNSU: string;
begin
  Result := '';

  Self.tbNotas.last;
  if Self.tbNotas.RecordCount > 1 then
    Result := IntToStr(Self.tbNotasNSU.AsInteger);

end;

end.
