unit uDataCliente;

interface

uses
  SysUtils, Classes, DB, ADODB, SqlServerConnection;

type
  TDataCliente = class(TDataModule)
    quBuscarCliente: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function buscarCliente() :TADOQuery;
    function buscarClienteByNome(nome :String) : TADOQuery;
  end;

var
  DataCliente: TDataCliente;

implementation

{$R *.dfm}

{ TDataCliente }

function TDataCliente.buscarCliente: TADOQuery;
var
  txtSql :String;
begin
  Try
    With quBuscarCliente do
      begin
        Close;
        SQL.Clear;
        Txtsql := ' SELECT Id, nome, telefone ' +
                  'FROM clientes';
        SQL.Add(txtSql);
        Open;
      end;
      Result :=  quBuscarCliente;
      Finally
  end;
end;

function TDataCliente.buscarClienteByNome(nome: String): TADOQuery;
var
  txtSql :String;
begin
  try
    With quBuscarCliente do
      begin
        Close;
        SQL.Clear;
        txtSql := 'SELECT Id, nome, telefone' +
               'FROM clientes' +
               'WHERE nome LIKE %' + QuotedStr(nome) + '%';
               SQL.Add(txtSql);
               Open;
      end;
      Result := quBuscarCliente;
  finally
  end;
end;

end.
