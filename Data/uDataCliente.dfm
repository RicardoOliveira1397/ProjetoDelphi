object DataCliente: TDataCliente
  OldCreateOrder = False
  Height = 144
  Width = 367
  object quBuscarCliente: TADOQuery
    Connection = Transaction.uSqlConnection
    Parameters = <>
    Left = 56
    Top = 48
  end
  object quImportar: TADOQuery
    Connection = Transaction.uSqlConnection
    Parameters = <>
    Left = 216
    Top = 48
  end
end
