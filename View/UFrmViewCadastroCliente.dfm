object FrmViewCadastroCliente: TFrmViewCadastroCliente
  Left = 0
  Top = 0
  Caption = 'CADASTRO CLIENTE'
  ClientHeight = 421
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 360
    Width = 900
    Height = 61
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = -8
    object Button1: TButton
      Left = 24
      Top = 16
      Width = 75
      Height = 25
      Caption = 'INCLUIR'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 105
      Top = 16
      Width = 75
      Height = 25
      Caption = 'ALTERAR'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 186
      Top = 16
      Width = 75
      Height = 25
      Caption = 'CANCELAR'
      TabOrder = 2
    end
    object Button4: TButton
      Left = 267
      Top = 16
      Width = 75
      Height = 25
      Caption = 'GRAVAR'
      TabOrder = 3
    end
    object Button5: TButton
      Left = 348
      Top = 16
      Width = 75
      Height = 25
      Caption = 'EXCLUIR'
      TabOrder = 4
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 900
    Height = 360
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Listagem'
      ExplicitLeft = 0
      ExplicitTop = 22
      object DBGrid1: TDBGrid
        Left = 0
        Top = 65
        Width = 892
        Height = 267
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 892
        Height = 65
        Align = alTop
        TabOrder = 1
        ExplicitTop = -6
        object Button6: TButton
          Left = 263
          Top = 21
          Width = 77
          Height = 25
          Caption = 'PESQUISAR'
          TabOrder = 0
        end
        object LabeledEdit1: TLabeledEdit
          Left = 20
          Top = 23
          Width = 237
          Height = 21
          EditLabel.Width = 101
          EditLabel.Height = 13
          EditLabel.Caption = 'Digite para pesquisar'
          TabOrder = 1
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 22
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 892
        Height = 65
        Align = alTop
        Caption = 'Panel3'
        TabOrder = 0
      end
    end
  end
end