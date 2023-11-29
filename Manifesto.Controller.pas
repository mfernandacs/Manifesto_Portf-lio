unit Manifesto.Controller;

interface
uses
  System.StrUtils, System.Generics.Collections, Winapi.Windows, System.Classes, System.SysUtils, Vcl.Forms, Winapi.Messages,
  Vcl.StdCtrls, Vcl.ExtCtrls, UniProvider, SQLiteUniProvider, Data.DB, DBAccess, Uni, MemDS, Vcl.Dialogs, Winapi.ActiveX,
  System.SyncObjs, System.IOUtils, Manifesto.Configuracao.Model, pcnConversao, pcnRetDistDFeInt,Manifesto.Model,
  Manifesto.Evento, Manifesto.Evento.Controller, Manifesto.DAO;

type
  TManifesto = class(TThread)
    private
      FNotaAtual: TNotaManifesto;
      FConfig: TManifestoConfiguracao;
      CodDest, CodUF: Integer;
      UltimoNSU: String;

      property NotaAtual: TNotaManifesto read FNotaAtual write FNotaAtual;

    public
      Parar: Boolean;

      property Config: TManifestoConfiguracao read FConfig write FConfig;

      constructor Create(ACreateSuspended: Boolean; ACertificado, ACNPJDestinatario: String; ACodDestinatario, ACodUFDestinatario: Integer); overload;
      destructor Destroy; override;
      procedure Execute; override;

      procedure SetConfig(AUltimoNSU: String; ACodDestinatario,
  ACodUFDestinatario: Integer);

    protected
      procedure BuscarNotas(AUltimoNSU: String; CodDestinatario, CodUFDestinatario: integer);
      function BaixarNota(AChaveAcesso, AXMLNota, ACNPJDest: String) : Boolean;
      procedure PopularNotaManifesto(ARetConsItem : TDocZipCollectionItem; AVersaoAplicativo : String);
  end;

var
  CriticalSection: TCriticalSection;

implementation
{ TManifesto }
{$D+}


procedure TManifesto.PopularNotaManifesto(ARetConsItem : TDocZipCollectionItem; AVersaoAplicativo : String);
var
  Tipo: String;
  resNFe, resEvento, procEvento : Boolean;
  EventoManifesto : TEventoManifesto;
begin
  try

    if Assigned(Self.NotaAtual) then
    begin
      Self.NotaAtual := nil;
      Self.NotaAtual := TNotaManifesto.Create();
    end
    else
    begin;
      Self.NotaAtual := TNotaManifesto.Create();
    end;

    resNFe := ARetConsItem.resDFe.chDFe.IsEmpty;
    resEvento := ARetConsItem.resEvento.chDFe.IsEmpty;
    procEvento := ARetConsItem.procEvento.chDFe.IsEmpty;

    if not(resNFe) AND (resEvento) AND (procEvento) then
    begin
      Self.NotaAtual.ChaveAcesso := ARetConsItem.resDFe.chDFe;
      Tipo := 'resNFe';//Nota fiscal
    end;
    if not(resEvento) AND (resNFe) AND (procEvento) then
    begin
      Self.NotaAtual.ChaveAcesso := ARetConsItem.resEvento.chDFe;
      Tipo := 'resEvento';//Evento
    end;
    if not(procEvento) AND (resNFe) AND (resEvento) then
    begin
      Self.NotaAtual.ChaveAcesso := ARetConsItem.procEvento.chDFe;
      Tipo := 'procEvento';//Evento
    end;

    if (Self.NotaAtual.ChaveAcesso.Trim().Equals('')) OR (assigned(DmManifesto.ObterNota(Self.NotaAtual.ChaveAcesso))) then
    begin
      Exit();
    end;

    Self.NotaAtual.NSU := ARetConsItem.NSU;

    if Tipo = 'resNFe' then
    begin
      Self.NotaAtual.XML              := ARetConsItem.XML;
      Self.NotaAtual.NumNota          := StrToInt(Copy(ARetConsItem.resDFe.chDFe, 26, 9));
      Self.NotaAtual.CodDestinatario  := Self.CodDest;
      Self.NotaAtual.CNPJDestinatario := Self.Config.EmitenteCNPJ;
      Self.NotaAtual.NomeEmitente     := ARetConsItem.resDFe.xNome;
      Self.NotaAtual.CNPJEmitente     := ARetConsItem.resDFe.CNPJCPF;
      Self.NotaAtual.IEEmitente       := ARetConsItem.resDFe.IE;
      Self.NotaAtual.DataEmissao      := ARetConsItem.resDFe.dhEmi;
      Self.NotaAtual.DigVal           := ARetConsItem.resDFe.digVal;
      Self.NotaAtual.NProt            := ARetConsItem.resDFe.nProt;
      Self.NotaAtual.CSitNFe          := SituacaoDFeToStr(ARetConsItem.resDFe.cSitDFe);
      Self.NotaAtual.ValorNF          := ARetConsItem.resDFe.vNF;
      Self.NotaAtual.Tipo             := Tipo;

      if Self.NotaAtual.CSitNFe = '1' then
      begin
        Self.NotaAtual.Situacao := 'AUTORIZADA';
      end;
      if Self.NotaAtual.CSitNFe = '2' then
      begin
        Self.NotaAtual.Situacao := 'DENEGADA';
      end;
      if Self.NotaAtual.CSitNFe = '3' then
      begin
        Self.NotaAtual.Situacao := 'CANCELADA';
      end;

      DmManifesto.InserirNota(Self.NotaAtual);

    end
    else if Tipo = 'resEvento' then
    begin
      Self.NotaAtual.XML              := ARetConsItem.XML;
      Self.NotaAtual.NumNota          := StrToInt(Copy(ARetConsItem.resEvento.chDFe, 26, 9));
      Self.NotaAtual.CodDestinatario  := Self.CodDest;
      Self.NotaAtual.CNPJDestinatario := Self.Config.EmitenteCNPJ;
      Self.NotaAtual.Tipo             := Tipo;
      Self.NotaAtual.CNPJEmitente     := ARetConsItem.resEvento.CNPJCPF;
      Self.NotaAtual.DataEvento       := ARetConsItem.resEvento.dhEvento;
      Self.NotaAtual.Evento           := ARetConsItem.resEvento.xEvento;
      Self.NotaAtual.NProt            := ARetConsItem.resEvento.nProt;

    end
    else if Tipo = 'procEvento' then
    begin
      Self.NotaAtual.XML              := ARetConsItem.XML;
      Self.NotaAtual.NumNota          := StrToInt(Copy(ARetConsItem.procEvento.chDFe, 26, 9));
      Self.NotaAtual.CodDestinatario  := Self.CodDest;
      Self.NotaAtual.CNPJDestinatario := Self.Config.EmitenteCNPJ;
      Self.NotaAtual.Tipo             := Tipo;
      Self.NotaAtual.CNPJEmitente     := ARetConsItem.procEvento.CNPJ;
      Self.NotaAtual.DataEvento       := ARetConsItem.procEvento.dhEvento;
      Self.NotaAtual.Evento           := ARetConsItem.procEvento.detEvento.descEvento;
      Self.NotaAtual.NProt            := ARetConsItem.procEvento.detEvento.nProt;

    end;
  finally
    FreeAndNil(Self.FNotaAtual);
  end;
end;


function TManifesto.BaixarNota(AChaveAcesso, AXMLNota, ACNPJDest: String) : Boolean;
var
  path: String;
  ArquivoXML: TStringList;
begin
  result := false;
  path := ExtractFilePath(Application.ExeName) +'Arquivos\'+ AChaveAcesso +'.xml';

  if not(FileExists(path)) then
  begin
    ArquivoXML := TStringList.Create();
    try
      ArquivoXML.Text := AXMLNota;
      ArquivoXML.SaveToFile(path);

    except
      on E : Exception do
      begin
        MessageDlg(E.Message, mtInformation, [mbOK], 0);
       end;
    end;
  end
  else
  begin
      path := 'Arquivos\' + AChaveAcesso + '.xml';

      result := true;
      exit();
  end;
end;

procedure TManifesto.BuscarNotas(AUltimoNSU: String; CodDestinatario, CodUFDestinatario: integer);
var
  StatusConsulta : Integer;
  RetCabecalho : TRetDistDFeInt;
  RetConsItem : TDocZipCollectionItem;
  I: Integer;
begin
  StatusConsulta := 0;
  Application.ProcessMessages();
  repeat
    if (Self.Parar) or (Self.Terminated) or (Self.Suspended) then
      Break;

    if (StatusConsulta = 137) then
    begin
      Self.Parar := True;
      Exit();
    end;
    try
      Self.Config.ACBr.DistribuicaoDFePorUltNSU(CodUFDestinatario, Self.Config.emitenteCNPJ, AUltimoNSU);

      StatusConsulta := Self.Config.ACBr.WebServices.DistribuicaoDFe.retDistDFeInt.cStat;
      Self.UltimoNSU := Self.Config.ACBr.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU;

      Application.ProcessMessages();
      for I := 0 to Self.Config.ACBr.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Count - 1 do
      begin
        RetCabecalho := Self.Config.ACBr.WebServices.DistribuicaoDFe.retDistDFeInt;
        RetConsItem := Self.Config.ACBr.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[I];
        Application.ProcessMessages();
        Self.PopularNotaManifesto(RetConsItem, RetCabecalho.VerAplic);
      end;
    except on E: Exception do
      begin
        Exit();
      end;
    end;
    TThread.Sleep(10);
    Application.ProcessMessages();
    TThread.Sleep(10);
  until(StatusConsulta = 137);
  Self.Parar := True;
end;

constructor TManifesto.Create(ACreateSuspended: Boolean; ACertificado, ACNPJDestinatario: String; ACodDestinatario, ACodUFDestinatario: Integer);
begin
  inherited
  Create(ACreateSuspended);
  Self.Parar           := False;
  Self.FreeOnTerminate := True;
  Self.Priority        := tpNormal;
  Self.Config := TManifestoConfiguracao.Create();
  Self.Config.CertificadosNumeroSerie := ACertificado;
  Self.Config.emitenteCNPJ            := ACNPJDestinatario;
  Self.CodDest                        := ACodDestinatario;
  Self.CodUF                          := ACodUFDestinatario;
  Self.Config.ConfigurarACBr();
  Application.ProcessMessages();
  Self.Config.WebServicesAmbienteProducao := True;
//  Self.Config.WebServicesAmbienteProducao := False;
  Self.Config.ACBr.Configuracoes.Certificados.NumeroSerie := ACertificado;
end;

destructor TManifesto.Destroy;
begin
  Terminate;
  WaitFor;
  inherited;
end;

procedure TManifesto.Execute;
begin
  inherited;
  CoInitialize(nil);
  try
    Application.ProcessMessages;
    while (not Self.Terminated) do
    begin
      if (Self.Terminated) or (Self.Parar) then
        Exit();
      CriticalSection.Enter;
      Application.ProcessMessages;
      try
        Application.ProcessMessages;
        Self.BuscarNotas(Self.UltimoNSU, Self.CodDest, Self.CodUF);
        Application.ProcessMessages;
      finally
        CriticalSection.Leave;
      end;
    end;
  finally
    CoUninitialize;
  end;
end;

procedure TManifesto.SetConfig(AUltimoNSU: String; ACodDestinatario,
  ACodUFDestinatario: Integer);
begin
  Self.UltimoNSU    := AUltimoNSU;
  Self.CodDest      := ACodDestinatario;
  Self.CodUF        := ACodUFDestinatario;
end;

initialization

CriticalSection := TCriticalSection.Create;

finalization

CriticalSection.Free;


end.
