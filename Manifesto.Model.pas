unit Manifesto.Model;

interface


type
  TNotaManifesto = class

  private
    FCodigo: Integer;
    FXML: String;
    FChaveAcesso: String;
    FNumNota: Integer;
    FCodDestinatario: Integer;
    FCNPJDestinatario: String;
    FNomeEmitente: String;
    FCNPJEmitente: String;
    FIEEmitente: String;
    FNSU: String;
    FValorNF: Double;
    FDataEmissao: TDateTime;
    FTipo: String;
    FDigVal: String;
    FNProt: String;
    FCSitNFe: String;
    FSituacao: String;
    FEvento: String;
    FDataEvento: TDateTime;
    FXMLNota: String;


  public
    property Codigo: Integer read FCodigo write FCodigo;
    property XML: String read FXML write FXML;
    property ChaveAcesso: String read FChaveAcesso write FChaveAcesso;
    property NumNota: Integer read FNumNota write FNumNota;
    property CodDestinatario: Integer read FCodDestinatario write FCodDestinatario;
    property CNPJDestinatario: String read FCNPJDestinatario write FCNPJDestinatario;
    property NomeEmitente: String read FNomeEmitente write FNomeEmitente;
    property CNPJEmitente: String read FCNPJEmitente write FCNPJEmitente;
    property IEEmitente: String read FIEEmitente write FIEEmitente;
    property NSU: String read FNSU write FNSU;
    property ValorNF: Double read FValorNF write FValorNF;
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    property Tipo: String read FTipo write FTipo;
    property DigVal: String read FDigVal write FDigVal;
    property NProt: String read FNProt write FNProt;
    property CSitNFe: String read FCSitNFe write FCSitNFe;
    property Situacao: String read FSituacao write FSituacao;
    property Evento: String read FEvento write FEvento;
    property DataEvento: TDateTime read FDataEvento write FDataEvento;
    property XMLNota: String read FXMLNota write FXMLNota;

  end;

implementation

end.
