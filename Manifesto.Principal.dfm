object FrmManifesto: TFrmManifesto
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Manifesto'
  ClientHeight = 573
  ClientWidth = 982
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  PrintScale = poPrintToFit
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PnlTop: TPanel
    Left = 0
    Top = 0
    Width = 982
    Height = 41
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '   Manifesto'
    Color = 1904913
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = 416
    ExplicitTop = 224
    ExplicitWidth = 185
    object btnSair: TSpeedButton
      Left = 939
      Top = 0
      Width = 43
      Height = 41
      Align = alRight
      Flat = True
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000A449A3A449A3
        A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449
        A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A4
        49A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3
        A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3FFFF
        FFA449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3FF
        FFFFA449A3A449A3A449A3A449A3A449A3A449A3A449A3FFFFFFFFFFFFFFFFFF
        A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3FFFFFFFFFFFFFFFF
        FFA449A3A449A3A449A3A449A3A449A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4
        49A3A449A3A449A3A449A3A449A3A449A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        A449A3A449A3A449A3A449A3A449A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA449
        A3A449A3A449A3A449A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA449A3A449A3A4
        49A3A449A3A449A3A449A3A449A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA449A3
        A449A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA449A3A449A3A449A3A449A3A449
        A3A449A3A449A3A449A3A449A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA449A3A449A3A449A3A449A3A449A3A449A3A449A3
        A449A3A449A3A449A3A449A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFA449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A4
        49A3A449A3A449A3A449A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA449A3
        A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449
        A3A449A3A449A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA449A3A449A3A4
        49A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA449A3A449A3A449
        A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA449A3A449A3A449A3
        A449A3A449A3A449A3A449A3A449A3A449A3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFA449A3A449A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA449A3A449A3A449A3A4
        49A3A449A3A449A3A449A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA449A3A449A3
        A449A3A449A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA449A3A449A3A449A3A449
        A3A449A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA449A3A449A3A449A3A449A3A4
        49A3A449A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA449A3A449A3A449A3A449A3
        A449A3FFFFFFFFFFFFFFFFFFA449A3A449A3A449A3A449A3A449A3A449A3A449
        A3A449A3FFFFFFFFFFFFFFFFFFA449A3A449A3A449A3A449A3A449A3A449A3A4
        49A3FFFFFFA449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3
        A449A3FFFFFFA449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449
        A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A4
        49A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3
        A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449
        A3A449A3A449A3A449A3}
      OnClick = btnSairClick
      ExplicitLeft = 760
      ExplicitTop = 1
      ExplicitHeight = 39
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 982
    Height = 532
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 5
    BorderWidth = 10
    Color = 1904913
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 35
    ExplicitWidth = 1044
    ExplicitHeight = 580
    object PnlBotoes: TPanel
      Left = 10
      Top = 10
      Width = 962
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      Color = 1904913
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 1026
      object BtnBuscar: TAdvGlowButton
        Left = 0
        Top = 0
        Width = 161
        Height = 32
        Margins.Left = 5
        Margins.Right = 5
        Align = alLeft
        AntiAlias = aaNone
        BorderStyle = bsNone
        Caption = 'Buscar Notas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14540253
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        FocusType = ftHot
        HotPicture.Data = {
          89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
          0D000000097048597300000B1300000B1301009A9C180000010449444154789C
          D5D3BF2E84411486F16F43D06914B45BA96CA3E70AE848D0AA286C4B247B21B4
          1292AD757B010ACDD612AD50A8C4BFF593618A8F30332B14DEFACD9339739E53
          55FF3298C3012EF1882B9C62058D61400D7430C03976B1866D74F18C1EA64A81
          1D3C60F3AB97A0850B9C61A264CC4180657A4DDC623F073C8C6366FF28C07083
          D154292C602F078BDD59EF994F95EEB151081C8FC0A554E91A5B85C0E9085C4C
          958267DD42E03A9E30992AAD46CF5A05E3F6715222752F7AD64CC08E70F75DE7
          43C2054469DF3C8BDB1CC34CBC987E84BDA05D95245C40CDB37AC29F1D47B1DB
          43414330123CC332163E2FE047D05C6AD09D6CB9340116AEECD7807F9E573DAA
          8295700057610000000049454E44AE426082}
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        OfficeHint.Title = 'This is an office hint'
        OfficeHint.Notes.Strings = (
          'More information about the tool on the ribbon here.')
        ParentFont = False
        Picture.Data = {
          89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
          0D000000097048597300000B1300000B1301009A9C180000010449444154789C
          D5D3BF2E84411486F16F43D06914B45BA96CA3E70AE848D0AA286C4B247B21B4
          1292AD757B010ACDD612AD50A8C4BFF593618A8F30332B14DEFACD9339739E53
          55FF3298C3012EF1882B9C62058D61400D7430C03976B1866D74F18C1EA64A81
          1D3C60F3AB97A0850B9C61A264CC4180657A4DDC623F073C8C6366FF28C07083
          D154292C602F078BDD59EF994F95EEB151081C8FC0A554E91A5B85C0E9085C4C
          958267DD42E03A9E30992AAD46CF5A05E3F6715222752F7AD64CC08E70F75DE7
          43C2054469DF3C8BDB1CC34CBC987E84BDA05D95245C40CDB37AC29F1D47B1DB
          43414330123CC332163E2FE047D05C6AD09D6CB9340116AEECD7807F9E573DAA
          8295700057610000000049454E44AE426082}
        Rounded = False
        Transparent = True
        TabOrder = 0
        OnClick = BtnBuscarClick
        Appearance.BorderColorHot = 2563100
        Appearance.BorderColorDown = 14925219
        Appearance.BorderColorChecked = 15914434
        Appearance.BorderColorDisabled = 16250613
        Appearance.ColorTo = clNone
        Appearance.ColorChecked = 15914434
        Appearance.ColorCheckedTo = clNone
        Appearance.ColorDisabled = clNone
        Appearance.ColorDisabledTo = clNone
        Appearance.ColorDown = 14925219
        Appearance.ColorDownTo = clNone
        Appearance.ColorHot = 2563100
        Appearance.ColorHotTo = clNone
        Appearance.ColorMirror = clWhite
        Appearance.ColorMirrorTo = clNone
        Appearance.ColorMirrorHot = 2563100
        Appearance.ColorMirrorHotTo = 522656796
        Appearance.ColorMirrorDown = 14925219
        Appearance.ColorMirrorDownTo = clNone
        Appearance.ColorMirrorChecked = 15914434
        Appearance.ColorMirrorCheckedTo = clNone
        Appearance.ColorMirrorDisabled = clNone
        Appearance.ColorMirrorDisabledTo = clNone
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
        Appearance.TextColorHot = clWhite
        MaxButtonSizeState = bsLabel
      end
      object BtnEvento: TAdvGlowButton
        Left = 161
        Top = 0
        Width = 155
        Height = 32
        Margins.Left = 5
        Margins.Right = 5
        Align = alLeft
        AntiAlias = aaNone
        BorderStyle = bsNone
        Caption = 'Enviar Evento '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14540253
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        FocusType = ftHot
        HotPicture.Data = {
          89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
          0D000000097048597300000B1300000B1301009A9C18000000D449444154789C
          EDD3314B82511487F11B412416D910B4087D8444688A163F40042D2EADEFD857
          70B7D955C5D9D5D13E44B434341504D1D0D650FEE2C55B93F1FAE21D1C7AD673
          78CEF973EF09E19FB220C3712AD985399D14B23D3CE119FB298483B8DD790A59
          0B338C52C8AA78C42B0E52087B31EA6551E326B60B7ACEF085F132936F628CD3
          3FEA153CE00D87CB081B78C107DA0BEADD18F5AA50F6038E701F5FF0F7B3E204
          9F9884B2A08669DCA68F1DDCE11DF5D2C21C6C6118A5F925E4646155701DE3DF
          62636561984B9BD84D225B0BBE013551F01B67BF713D0000000049454E44AE42
          6082}
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        OfficeHint.Title = 'This is an office hint'
        OfficeHint.Notes.Strings = (
          'More information about the tool on the ribbon here.')
        ParentFont = False
        Picture.Data = {
          89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
          0D000000097048597300000B1300000B1301009A9C18000000D449444154789C
          EDD3314B82511487F11B412416D910B4087D8444688A163F40042D2EADEFD857
          70B7D955C5D9D5D13E44B434341504D1D0D650FEE2C55B93F1FAE21D1C7AD673
          78CEF973EF09E19FB220C3712AD985399D14B23D3CE119FB298483B8DD790A59
          0B338C52C8AA78C42B0E52087B31EA6551E326B60B7ACEF085F132936F628CD3
          3FEA153CE00D87CB081B78C107DA0BEADD18F5AA50F6038E701F5FF0F7B3E204
          9F9884B2A08669DCA68F1DDCE11DF5D2C21C6C6118A5F925E4646155701DE3DF
          62636561984B9BD84D225B0BBE013551F01B67BF713D0000000049454E44AE42
          6082}
        Rounded = False
        Transparent = True
        TabOrder = 1
        OnClick = BtnEventoClick
        Appearance.BorderColorHot = 2563100
        Appearance.BorderColorDown = 14925219
        Appearance.BorderColorChecked = 15914434
        Appearance.BorderColorDisabled = 16250613
        Appearance.ColorTo = clNone
        Appearance.ColorChecked = 15914434
        Appearance.ColorCheckedTo = clNone
        Appearance.ColorDisabled = clNone
        Appearance.ColorDisabledTo = clNone
        Appearance.ColorDown = 14925219
        Appearance.ColorDownTo = clNone
        Appearance.ColorHot = 2563100
        Appearance.ColorHotTo = 2563100
        Appearance.ColorMirror = clWhite
        Appearance.ColorMirrorTo = clNone
        Appearance.ColorMirrorHot = 2563100
        Appearance.ColorMirrorHotTo = 2563100
        Appearance.ColorMirrorDown = 14925219
        Appearance.ColorMirrorDownTo = clNone
        Appearance.ColorMirrorChecked = 15914434
        Appearance.ColorMirrorCheckedTo = clNone
        Appearance.ColorMirrorDisabled = clNone
        Appearance.ColorMirrorDisabledTo = clNone
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
        MaxButtonSizeState = bsLabel
        ExplicitTop = -4
      end
    end
    object DBGrid1: TDBGrid
      Left = 10
      Top = 48
      Width = 951
      Height = 465
      Color = 2563100
      DataSource = DmManifesto.DsNotas
      FixedColor = 2563100
      GradientEndColor = clWhite
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'numNota'
          Title.Caption = 'Num. Nota'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeEmitente'
          Title.Caption = 'Nome Emitente'
          Width = 177
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNPJEmitente'
          Title.Caption = 'CNPJ Emitente'
          Width = 111
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorNF'
          Title.Caption = 'Valor Nota Fiscal'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ChaveAcesso'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DataEmissao'
          Title.Caption = 'Data Emiss'#227'o'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Evento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNPJDestinatario'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'XML'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NProt'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Situacao'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NSU'
          Visible = True
        end>
    end
  end
  object tmrBuscarNotas: TTimer
    Enabled = False
    Interval = 5000
    Left = 789
    Top = 28
  end
end
