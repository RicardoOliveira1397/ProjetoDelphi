object ViewMenuExportar: TViewMenuExportar
  Left = 0
  Top = 0
  Caption = 'EXPORTAR'
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    AlignWithMargins = True
    Left = 50
    Top = 3
    Width = 405
    Height = 184
    Margins.Left = 50
    Margins.Right = 50
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 45
    ExplicitTop = 6
  end
  object Panel1: TPanel
    Left = 0
    Top = 190
    Width = 505
    Height = 41
    Align = alBottom
    TabOrder = 2
  end
  object btnExportarArquivo: TButton
    Left = 136
    Top = 196
    Width = 201
    Height = 25
    Caption = 'EXPORTAR'
    TabOrder = 1
    OnClick = btnExportarArquivoClick
  end
end
