object FrmViewCadastroCliente: TFrmViewCadastroCliente
  Left = 0
  Top = 0
  Caption = 'CADASTRO CLIENTE'
  ClientHeight = 300
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 239
    Width = 900
    Height = 61
    Align = alBottom
    TabOrder = 0
    object btnIncluir: TButton
      Left = 24
      Top = 16
      Width = 75
      Height = 25
      Caption = 'INCLUIR'
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TButton
      Left = 105
      Top = 16
      Width = 75
      Height = 25
      Caption = 'ALTERAR'
      Enabled = False
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnCancelar: TButton
      Left = 186
      Top = 16
      Width = 75
      Height = 25
      Caption = 'CANCELAR'
      Enabled = False
      TabOrder = 2
    end
    object btnGravar: TButton
      Left = 267
      Top = 16
      Width = 75
      Height = 25
      Caption = 'GRAVAR'
      Enabled = False
      TabOrder = 3
      OnClick = btnGravarClick
    end
    object btnExcluir: TButton
      Left = 348
      Top = 16
      Width = 75
      Height = 25
      Caption = 'EXCLUIR'
      Enabled = False
      TabOrder = 4
      OnClick = btnExcluirClick
    end
  end
  object pgControlCadastroCliente: TPageControl
    Left = 0
    Top = 0
    Width = 900
    Height = 239
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Pesquisa'
      object dbGrid: TDBGrid
        Left = 0
        Top = 65
        Width = 892
        Height = 146
        Align = alClient
        DataSource = dataSource
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
        object btnPesquisar: TButton
          Left = 263
          Top = 21
          Width = 77
          Height = 25
          Caption = 'PESQUISAR'
          TabOrder = 0
          OnClick = btnPesquisarClick
        end
        object lbPesquisar: TLabeledEdit
          Left = 20
          Top = 23
          Width = 237
          Height = 21
          EditLabel.Width = 101
          EditLabel.Height = 13
          EditLabel.Caption = 'Digite para pesquisar'
          TabOrder = 1
        end
        object btnExportar: TButton
          Left = 346
          Top = 21
          Width = 75
          Height = 25
          Caption = 'EXPORTAR'
          TabOrder = 2
          Visible = False
          OnClick = btnExportarClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object pnlCadastro: TPanel
        Left = 0
        Top = 0
        Width = 892
        Height = 211
        Align = alClient
        TabOrder = 0
        object lbNome: TLabeledEdit
          Left = 20
          Top = 24
          Width = 253
          Height = 21
          EditLabel.Width = 27
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome'
          TabOrder = 0
        end
        object lbtelefone: TLabeledEdit
          Left = 20
          Top = 80
          Width = 149
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = 'Telefone'
          TabOrder = 1
        end
      end
    end
  end
  object dataSource: TDataSource
    OnDataChange = dataSourceDataChange
    Left = 856
    Top = 29
  end
end
