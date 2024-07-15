unit uDataCliente;

interface

uses
  SysUtils, Classes, DB, ADODB, SqlServerConnection, Dialogs, uCliente;

type
  TDataCliente = class(TDataModule)
    quBuscarCliente: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function buscarCliente() :TADOQuery;
    function buscarClienteByNome(nome :String) : TADOQuery;
    procedure excluirCliente(id :integer);
    procedure incluirCliente(ClienteIn :TModelCliente);
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
               'WHERE nome LIKE %:nome%';
               SQL.Add(txtSql);
               Parameters.ParamByName('nome').DataType := ftString;
               Parameters.ParamByName('nome').Value := nome;
               Open;
      end;
      Result := quBuscarCliente;
  finally
  end;
end;

procedure TDataCliente.excluirCliente(id: integer);
var
  txtSql :String;
begin
  try
    With quBuscarCliente do
      begin
        Close;
        SQL.Clear;
        txtSql := 'DELETE ' +
                  'FROM clientes ' +
                  'WHERE Id = :id';
                  SQL.Add(txtSql);
                  Parameters.ParamByName('id').DataType := ftInteger;
                  Parameters.ParamByName('id').Value := id;
                  ExecSQL;
      end;
    finally
    ShowMessage('Registro exclu�do com sucesso!');
  end;
end;

procedure TDataCliente.incluirCliente(ClienteIn: TModelCliente);
  var
    txtSql :String;
begin
  try
    With quBuscarCliente do
      begin
      Close;
      SQL.Clear;
        txtSql := 'INSERT INTO clientes ' +
                  '(nome, telefone) ' +
                  'VALUES' +
                  '(:nome, :telefone)';
                  SQL.Add(txtSql);
                  Parameters.ParamByName('nome').DataType := ftString;
                  Parameters.ParamByName('nome').Value := ClienteIn.Nome;
                  Parameters.ParamByName('telefone').DataType := ftString;
                  Parameters.ParamByName('telefone').Value := ClienteIn.Telefone;
                  ExecSQL;
      end;
  finally
    ShowMessage('Registro inserido com sucesso!');
  end;
end;

end.
