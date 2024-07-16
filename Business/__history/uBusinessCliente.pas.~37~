unit uBusinessCliente;

interface

uses
  SysUtils, Classes, DB, ADODB, uCliente, uDataCliente, UEnumTipoOperacao;

Type
  TBusinessCliente = Class
    private
    public
      function buscarCliente(buscarClienteIn : TModelCliente) : TADOQuery;
      procedure gravarCadastroCliente(ClienteIn: TModelCliente; operacao: TEnumTipoOperacao);
      procedure excluirCliente(id :Integer);
      procedure incluirCliente(clienteIn: TModelCliente);
  End;

implementation

{ TBusinessCliente }

function TBusinessCliente.buscarCliente(buscarClienteIn: TModelCliente): TADOQuery;
begin
  if Trim(buscarClienteIn.Nome) <> '' then
    begin
      Result := uDataCliente.DataCliente.buscarClienteByNome(buscarClienteIn.Nome);
    end
  else
    begin
      Result := uDataCliente.DataCliente.buscarCliente();
  end;
end;

procedure TBusinessCliente.excluirCliente(id: Integer);
begin
  excluirCliente(id);
end;

procedure TBusinessCliente.gravarCadastroCliente(ClienteIn: TModelCliente;
  operacao: TEnumTipoOperacao);
begin
  case operacao of
    Inserir:
      uDataCliente.DataCliente.incluirCliente(ClienteIn);
    Excluir:
      uDataCliente.DataCliente.alterarCliente(ClienteIn);
  end;
end;

procedure TBusinessCliente.incluirCliente(clienteIn: TModelCliente);
begin
  uDataCliente.DataCliente.incluirCliente(clienteIn);
end;

end.
