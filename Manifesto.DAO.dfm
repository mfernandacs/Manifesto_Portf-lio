object DmManifesto: TDmManifesto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 225
  Width = 289
  object DsNotas: TDataSource
    DataSet = tbNotas
    Left = 49
    Top = 65
  end
  object tbNotas: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 145
    Top = 65
    object tbNotasnumNota: TIntegerField
      FieldName = 'numNota'
    end
    object tbNotasNomeEmitente: TStringField
      FieldName = 'NomeEmitente'
    end
    object tbNotasValorNF: TFloatField
      FieldName = 'ValorNF'
    end
    object tbNotasDataEmissao: TDateField
      FieldName = 'DataEmissao'
    end
    object tbNotasCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tbNotasXML: TStringField
      FieldName = 'XML'
    end
    object tbNotasChaveAcesso: TStringField
      FieldName = 'ChaveAcesso'
      Size = 44
    end
    object tbNotasCodDestinatario: TIntegerField
      FieldName = 'CodDestinatario'
    end
    object tbNotasIEEmitente: TStringField
      FieldName = 'IEEmitente'
    end
    object tbNotasNSU: TIntegerField
      FieldName = 'NSU'
    end
    object tbNotasTipo: TStringField
      FieldName = 'Tipo'
    end
    object tbNotasdigVal: TStringField
      FieldName = 'digVal'
    end
    object tbNotasNProt: TStringField
      FieldName = 'NProt'
    end
    object tbNotasCSitNFe: TStringField
      FieldName = 'CSitNFe'
    end
    object tbNotasSituacao: TStringField
      FieldName = 'Situacao'
    end
    object tbNotasEvento: TStringField
      FieldName = 'Evento'
    end
    object tbNotasXMLNota: TStringField
      FieldName = 'XMLNota'
    end
    object tbNotasDataEvento: TDateField
      FieldName = 'DataEvento'
    end
    object tbNotasCNPJDestinatario: TStringField
      FieldName = 'CNPJDestinatario'
    end
    object tbNotasCNPJEmitente: TStringField
      FieldName = 'CNPJEmitente'
    end
  end
end
