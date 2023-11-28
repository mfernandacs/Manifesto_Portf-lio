unit Manifesto.Evento.Controller;

interface

uses
  System.StrUtils,
  System.Generics.Collections,
  Winapi.Windows,
  System.Classes,
  System.SysUtils,
  Vcl.Forms,
  Winapi.Messages,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  UniProvider,
  SQLiteUniProvider,
  Data.DB,
  DBAccess,
  Uni,
  MemDS,
  ACBrnfe,
  ACBrNFeDANFEFRDM,
  ACBrNFeDANFEClass,
  ACBrNFeDANFEFR,
  Vcl.Dialogs,
  Winapi.ActiveX,
  System.SyncObjs,
  System.IOUtils,
  Blcksock,
  Manifesto.Configuracao.Model,
  pcnConversao,
  pcnRetDistDFeInt,
  ACBrDFeSSL,
  ACBrDFeConfiguracoes,
  Manifesto.Model;

type
  TEventoManifesto = class
    private
      ManifestoConfig: TManifestoConfiguracao;
      FNotaAtual: TNotaManifesto;

    public
      function EnviarEvento(ACodEvento, ACodUF: Integer; AChaveAcesso, ACNPJ, AJust: String): Boolean;
      function BaixarXML(ACodUF: Integer; ACNPJ, AChaveAcesso: String): Boolean;
      constructor Create(AManifestoConfiguracao: TManifestoConfiguracao); overload;
      constructor Create(ACertificado, ACNPJDestinatario: String); overload;

      var
        XMLNota: String;
        Importar: Boolean;

  end;

implementation

function TEventoManifesto.BaixarXML(ACodUF: Integer; ACNPJ, AChaveAcesso: String): Boolean;
var
  ArquivoXML: String;
  ListXML : TStringList;
begin
  ArquivoXML  := 'Arquivos\'+ AChaveAcesso +'-nfe.xml';
  try
    if Self.ManifestoConfig.ACBr.DistribuicaoDFePorChaveNFe(ACodUF, ACNPJ, AChaveAcesso) then
    begin
      if ArquivoXML <> '' then
      begin
        Self.ManifestoConfig.ACBr.NotasFiscais.LoadFromFile(ArquivoXML);
//        ArquivoXML := Self.ManifestoConfig.ACBr.NotasFiscais.Items[0].XML;
        Result := True;
      end;
    end;
    if DirectoryExists( ManifestoConfig.ACBr.Configuracoes.Arquivos.DownloadDFe.PathDownload ) then
    begin
      if FileExists(ArquivoXML) then
      begin
        ListXML := TStringList.Create;
        try
          ListXML.LoadFromFile(ArquivoXML);
          MessageDlg('Operação realizada com sucesso, arquivo xml copiado para os locais configurados.', mtInformation, [mbOK], 0);
          Result := True;
          Exit;
        finally
          ListXML.Free;
        end;
      end;
      Self.XMLNota := ArquivoXML;
      Result := True;
    end;
  except
    try
      ArquivoXML  := 'Arquivos\'+ AChaveAcesso +'.xml';
      if Self.ManifestoConfig.ACBr.DistribuicaoDFePorChaveNFe(ACodUF, ACNPJ, AChaveAcesso) then
      begin
        if ArquivoXML <> '' then
        begin
          Self.ManifestoConfig.ACBr.NotasFiscais.LoadFromFile(ArquivoXML);
          ArquivoXML := Self.ManifestoConfig.ACBr.NotasFiscais.Items[0].XML;
          Result := True;
        end;
      end;
      if DirectoryExists( ManifestoConfig.ACBr.Configuracoes.Arquivos.DownloadDFe.PathDownload ) then
      begin
        if FileExists(ArquivoXML) then
        begin
          ListXML := TStringList.Create;
          try
            ListXML.LoadFromFile(ArquivoXML);
            MessageDlg('Operação realizada com sucesso, arquivo xml copiado para os locais configurados.', mtInformation, [mbOK], 0);
            Result := True;
            Exit;
          finally
            ListXML.Free;
          end;
        end;
        Self.XMLNota := ArquivoXML;
        Result := True;
      end;
    except
      on E: Exception do
      begin
        if Self.ManifestoConfig.ACBr.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 137 then
        begin
          MessageDlg('Falha no download: Documento não encontrado. Tente novamente mais tarde.', mtError, [mbOK], 0);
        end
        else
        begin
          MessageDlg('Erro no Download do XML. ' +  sLineBreak + sLineBreak  +  E.Message, mtError, [mbOK], 0);
        end;
        Result := false;
      end;
    end;
  end;
end;

constructor TEventoManifesto.Create(ACertificado, ACNPJDestinatario: String);
begin
  Self.ManifestoConfig := TManifestoConfiguracao.Create();
  Self.ManifestoConfig.CertificadosNumeroSerie := ACertificado;
  Self.ManifestoConfig.emitenteCNPJ            := ACNPJDestinatario;
  Self.ManifestoConfig.ConfigurarACBr();
end;

constructor TEventoManifesto.Create(AManifestoConfiguracao: TManifestoConfiguracao);
begin
  Self.ManifestoConfig := AManifestoConfiguracao;
end;

function TEventoManifesto.EnviarEvento(ACodEvento, ACodUF: Integer;
  AChaveAcesso, ACNPJ, AJust: String): Boolean;
const
  cs_Random_Lote = 999999;
var
  LoteManifesto, RetornoStat: Integer;
  ArquivoXML : String;
  ListXML : TStringList;

begin
  Result := False;
  RetornoStat := 0;

  ArquivoXML := 'NFe\'+ AChaveAcesso +'.xml';

  LoteManifesto := Random(cs_Random_Lote);
  Self.ManifestoConfig.ACBr.EventoNFe.Evento.Clear();

  with Self.ManifestoConfig.ACBr.EventoNFe.Evento.Add do
  begin
    case ACodEvento of
      0:
        InfEvento.tpEvento := teManifDestConfirmacao;
      1:
      begin
        InfEvento.tpEvento := teManifDestOperNaoRealizada;
        InfEvento.detEvento.xJust := AJust;
      end;
      2:
        InfEvento.tpEvento := teManifDestDesconhecimento;
      3:
        InfEvento.tpEvento := teManifDestCiencia;
    end;

    InfEvento.cOrgao := ACodUF;
    InfEvento.chNFe := AChaveAcesso;
    InfEvento.CNPJ := ACNPJ;
    InfEvento.dhEvento := Now;
  end;

  try
    try
      Self.ManifestoConfig.ACBr.EnviarEvento(LoteManifesto);
      if Self.ManifestoConfig.ACBr.WebServices.EnvEvento.EventoRetorno.retEvento.Count <> -1 then
      begin
        RetornoStat := Self.ManifestoConfig.ACBr.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat;
        if (RetornoStat = 137) or (RetornoStat = 573) then
        begin
          Result := True;
          Exit;
        end;
      end;
      if RetornoStat = 657 then
      begin
        Self.ManifestoConfig.ACBr.EventoNFe.Evento.Items[0].InfEvento.cOrgao := ManifestoConfig.ACBr.WebServices.EnvEvento.EventoRetorno.cOrgao;
        Result := Self.ManifestoConfig.ACBr.EnviarEvento(LoteManifesto);
        RetornoStat := Self.ManifestoConfig.ACBr.WebServices.EnvEvento.cStat;
      end;
      if ( RetornoStat <> 573 ) and ( RetornoStat <> 128 ) then
      begin
        MessageDlg('Retorno: ' + Self.ManifestoConfig.ACBr.WebServices.EnvEvento.EventoRetorno.
          retEvento.Items[0].RetInfEvento.xMotivo, mtInformation, [mbOK], 0);
      end;
      Result := True;

    except
      on E: Exception do
      begin
        MessageDlg('Erro ao enviar Manifestação ' + sLineBreak + E.Message, mtInformation, [mbOK], 0);
      end;
    end;
  finally
  end;
end;

end.
