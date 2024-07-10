object FrmMainMenu: TFrmMainMenu
  Left = 0
  Top = 0
  Caption = 'M&M SISTEMAS'
  ClientHeight = 275
  ClientWidth = 737
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 672
    Top = 8
    object CADASTRO1: TMenuItem
      Caption = 'CADASTRO'
      object CLIENTE1: TMenuItem
        Caption = 'CLIENTE'
        OnClick = CLIENTE1Click
      end
    end
    object MOVIMENTO1: TMenuItem
      Caption = 'MOVIMENTO'
    end
    object RELATRIOS1: TMenuItem
      Caption = 'RELAT'#211'RIOS'
      object CLIENTES1: TMenuItem
        Caption = 'CLIENTES'
      end
    end
  end
end
