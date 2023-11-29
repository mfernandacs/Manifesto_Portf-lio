unit Manifesto.Configuracao.Model;

interface

uses
  System.StrUtils, System.Generics.Collections, Winapi.Windows, System.Classes,
  System.SysUtils, Vcl.Forms, ACBrNFe, ACBrNFeDANFEFRDM,
  ACBrNFeDANFEClass, ACBrNFeDANFEFR, ACBrDFeSSL, ACBrDFeConfiguracoes, Blcksock,
  pcnConversao, pcnRetDistDFeInt;
type
  TManifestoConfiguracao = class
    private
      FGeralSalvar: Boolean;
      FGeralExibirErroSchema: Boolean;
      FGeralRetirarAcentos: Boolean;
      FArquivosPathSalvar: String;
      FArquivosPathSchemas: String;
      FArquivosSepararPorMes: Boolean;
      FArquivosPathNFe: String;
      FArquivosPathInu: String;
      FArquivosPathEvento: String;
      FArquivosSalvar: Boolean;
      FArquivosAdicionarLiteral: Boolean;
      FArquivosEmissaoPathNFe: Boolean;
      FArquivosSalvarEvento: Boolean;
      FArquivosSepararPorCNPJ: Boolean;
      FArquivosSepararPorModelo: Boolean;
      FArquivosDownloadDFePathDownload: String;
      FArquivosDownloadDFeSepararPorNome: Boolean;
      FWebServicesSalvar: Boolean;
      FWebServicesTimeOut: Integer;
      FWebServicesTentativas: Integer;
      FWebServicesIntervaloTentativas: Integer;
      FWebServicesAguardarConsultaRet: Integer;
      FCertificadosNumeroSerie: String;
      FWebServicesUF: String;
      FCertificadosArquivoPFX: String;
      FCertificadosSenha: String;
      FWebServicesAmbienteProducao: Boolean;
      FEmitenteUF: String;
      FEmitenteCNPJ: String;
      FEmitenteCodigo: Integer;
      FACBr: TACBrNFe;
      procedure ConfigurarSSL();
    public
      property GeralSalvar: Boolean read FGeralSalvar write FGeralSalvar;
      property GeralExibirErroSchema: Boolean read FGeralExibirErroSchema write FGeralExibirErroSchema;
      property GeralRetirarAcentos: Boolean read FGeralRetirarAcentos write FGeralRetirarAcentos;
      property ArquivosPathSalvar: String read FArquivosPathSalvar write FArquivosPathSalvar;
      property ArquivosPathSchemas: String read FArquivosPathSchemas write FArquivosPathSchemas;
      property ArquivosSepararPorMes: Boolean read FArquivosSepararPorMes write FArquivosSepararPorMes;
      property ArquivosPathNFe: String read FArquivosPathNFe write FArquivosPathNFe;
      property ArquivosPathInu: String read FArquivosPathInu write FArquivosPathInu;
      property ArquivosPathEvento: String read FArquivosPathEvento write FArquivosPathEvento;
      property ArquivosSalvar: Boolean read FArquivosSalvar write FArquivosSalvar;
      property ArquivosAdicionarLiteral: Boolean read FArquivosAdicionarLiteral write FArquivosAdicionarLiteral;
      property ArquivosEmissaoPathNFe: Boolean read FArquivosEmissaoPathNFe write FArquivosEmissaoPathNFe;
      property ArquivosSalvarEvento: Boolean read FArquivosSalvarEvento write FArquivosSalvarEvento;
      property ArquivosSepararPorCNPJ: Boolean read FArquivosSepararPorCNPJ write FArquivosSepararPorCNPJ;
      property ArquivosSepararPorModelo: Boolean read FArquivosSepararPorModelo write FArquivosSepararPorModelo;
      property ArquivosDownloadDFePathDownload: String read FArquivosDownloadDFePathDownload write FArquivosDownloadDFePathDownload;
      property ArquivosDownloadDFeSepararPorNome: Boolean read FArquivosDownloadDFeSepararPorNome write FArquivosDownloadDFeSepararPorNome;
      property WebServicesSalvar: Boolean read FWebServicesSalvar write FWebServicesSalvar;
      property WebServicesTimeOut: Integer read FWebServicesTimeOut write FWebServicesTimeOut;
      property WebServicesTentativas: Integer read FWebServicesTentativas write FWebServicesTentativas;
      property WebServicesIntervaloTentativas: Integer read FWebServicesIntervaloTentativas write FWebServicesIntervaloTentativas;
      property WebServicesAguardarConsultaRet: Integer read FWebServicesAguardarConsultaRet write FWebServicesAguardarConsultaRet;
      property CertificadosNumeroSerie: String read FCertificadosNumeroSerie write FCertificadosNumeroSerie;
      property WebServicesUF: String read FWebServicesUF write FWebServicesUF;
      property CertificadosArquivoPFX: String read FCertificadosArquivoPFX write FCertificadosArquivoPFX;
      property CertificadosSenha: String read FCertificadosSenha write FCertificadosSenha;
      property WebServicesAmbienteProducao: Boolean read FWebServicesAmbienteProducao write FWebServicesAmbienteProducao;
      property EmitenteUF: String read FEmitenteUF write FEmitenteUF;
      property EmitenteCNPJ: String read FEmitenteCNPJ write FEmitenteCNPJ;
      function GetEmitenteCodUF: Integer;
      property EmitenteCodUF: Integer read GetEmitenteCodUF;
      property EmitenteCodigo: Integer read FEmitenteCodigo write FEmitenteCodigo;
      property ACBr: TACBrNFe read FACBr write FACBr;

      procedure ConfigurarACBr();
      procedure ConfigurarEvento();
    protected
  end;

implementation

{ TGManifestoConfiguracao }

procedure TManifestoConfiguracao.ConfigurarACBr;
begin
  Self.ACBr := TACBrNFe.Create(nil);
  Self.ACBr.Configuracoes.Geral.Salvar           := Self.GeralSalvar;
  Self.ACBr.Configuracoes.Geral.ExibirErroSchema := Self.GeralExibirErroSchema;
  Self.ACBr.Configuracoes.Geral.RetirarAcentos   := Self.GeralRetirarAcentos;

  Self.ACBr.Configuracoes.Arquivos.PathSalvar                 := ExtractFilePath(Application.ExeName) +'Arquivos\';
  Self.ACBr.Configuracoes.Arquivos.PathSchemas                := Self.ArquivosPathSchemas;
  Self.ACBr.Configuracoes.Arquivos.SepararPorMes              := Self.ArquivosSepararPorMes;
  Self.ACBr.Configuracoes.Arquivos.PathNFe                    := ExtractFilePath(Application.ExeName) +'Arquivos\';
  Self.ACBr.Configuracoes.Arquivos.PathInu                    := Self.ArquivosPathInu;
  Self.ACBr.Configuracoes.Arquivos.PathEvento                 := ExtractFilePath(Application.ExeName) +'Arquivos\';
  Self.ACBr.Configuracoes.Arquivos.Salvar                     := True;
  Self.ACBr.Configuracoes.Arquivos.AdicionarLiteral           := Self.ArquivosAdicionarLiteral;
  Self.ACBr.Configuracoes.Arquivos.EmissaoPathNFe             := Self.ArquivosEmissaoPathNFe;
  Self.ACBr.Configuracoes.Arquivos.SalvarEvento               := Self.ArquivosSalvarEvento;
  Self.ACBr.Configuracoes.Arquivos.SepararPorCNPJ             := Self.ArquivosSepararPorCNPJ;
  Self.ACBr.Configuracoes.Arquivos.SepararPorModelo           := Self.ArquivosSepararPorModelo;
  Self.ACBr.Configuracoes.Arquivos.DownloadDFe.PathDownload   := ExtractFilePath(Application.ExeName) +'Arquivos\';
  Self.ACBr.Configuracoes.Arquivos.DownloadDFe.SepararPorNome := Self.ArquivosDownloadDFeSepararPorNome;

  Self.ACBr.Configuracoes.WebServices.Salvar              := Self.WebServicesSalvar;
  Self.ACBr.Configuracoes.WebServices.SSLType             := TSSLType.LT_TLSv1_2;

  Self.ACBr.Configuracoes.WebServices.TimeOut             := 10000;
  Self.ACBr.Configuracoes.WebServices.Tentativas          := 3;
  Self.ACBr.Configuracoes.WebServices.IntervaloTentativas := 2000;
  Self.ACBr.Configuracoes.WebServices.AguardarCoNSUltaRet := 2000;

  Self.ConfigurarSSL();

  Self.ACBr.Configuracoes.WebServices.UF := Self.WebServicesUF;

  Self.ACBr.Configuracoes.Certificados.NumeroSerie := Self.CertificadosNumeroSerie;
  Self.ACBr.Configuracoes.Certificados.ArquivoPFX  := Self.CertificadosArquivoPFX;
  Self.ACBr.Configuracoes.Certificados.Senha       := 'ms1997';
  Self.ACBr.Configuracoes.WebServices.Ambiente     := taProducao;
//  Self.ACBr.Configuracoes.WebServices.Ambiente := taHomologacao;
end;

procedure TManifestoConfiguracao.ConfigurarEvento;
begin
  Self.ACBr.Configuracoes.Geral.SSLLib := libWinCrypt;
end;

procedure TManifestoConfiguracao.ConfigurarSSL;
var
  Caminho: String;
begin
  Self.ACBr.SSL.SSLType       := TSSLType(5);
  Self.ACBr.SSL.SSLCryptLib   := TSSLCryptLib(3);
  Self.ACBr.SSL.SSLHttpLib    := TSSLHttpLib(2);
  Self.ACBr.SSL.SSLXmlSignLib := TSSLXmlSignLib(4);
end;

function TManifestoConfiguracao.GetEmitenteCodUF: Integer;
begin
  Self.EmitenteUF := Self.EmitenteUF.ToUpper();

  if Self.EmitenteUF = 'RO' then Result := 11 else
  if Self.EmitenteUF = 'AC' then Result := 12 else
  if Self.EmitenteUF = 'AM' then Result := 13 else
  if Self.EmitenteUF = 'RR' then Result := 14 else
  if Self.EmitenteUF = 'PA' then Result := 15 else
  if Self.EmitenteUF = 'AP' then Result := 16 else
  if Self.EmitenteUF = 'TO' then Result := 17 else
  if Self.EmitenteUF = 'MA' then Result := 21 else
  if Self.EmitenteUF = 'PI' then Result := 22 else
  if Self.EmitenteUF = 'CE' then Result := 23 else
  if Self.EmitenteUF = 'RN' then Result := 24 else
  if Self.EmitenteUF = 'PB' then Result := 25 else
  if Self.EmitenteUF = 'PE' then Result := 26 else
  if Self.EmitenteUF = 'AL' then Result := 27 else
  if Self.EmitenteUF = 'SE' then Result := 28 else
  if Self.EmitenteUF = 'BA' then Result := 29 else
  if Self.EmitenteUF = 'MG' then Result := 31 else
  if Self.EmitenteUF = 'ES' then Result := 32 else
  if Self.EmitenteUF = 'RJ' then Result := 33 else
  if Self.EmitenteUF = 'SP' then Result := 35 else
  if Self.EmitenteUF = 'PR' then Result := 41 else
  if Self.EmitenteUF = 'SC' then Result := 42 else
  if Self.EmitenteUF = 'RS' then Result := 43 else
  if Self.EmitenteUF = 'MS' then Result := 50 else
  if Self.EmitenteUF = 'MT' then Result := 51 else
  if Self.EmitenteUF = 'GO' then Result := 52 else
  if Self.EmitenteUF = 'DF' then Result := 53 else Result := 0;
end;

end.
