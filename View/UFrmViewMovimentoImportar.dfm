object ViewImportar: TViewImportar
  Left = 0
  Top = 0
  Caption = 'IMPORTAR'
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitTop = -6
    object Edit1: TEdit
      Left = 16
      Top = 19
      Width = 241
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object btnImportar: TButton
      Left = 280
      Top = 17
      Width = 75
      Height = 25
      Caption = 'IMPORTAR'
      TabOrder = 1
      OnClick = btnImportarClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 57
    Width = 505
    Height = 174
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object OpenDialog1: TOpenDialog
    Title = 'TESTE'
    Left = 377
    Top = 15
  end
  object DataSourceImportar: TDataSource
    Left = 464
    Top = 16
  end
end
