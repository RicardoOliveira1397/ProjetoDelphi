unit ClienteController;

interface

uses
  SysUtils, Classes, DB, ADODB, uCliente, uDataCliente, uBusinessCliente, uEnumTipoOperacao;

type
  TClienteController = class
    private
      {Private declarations}
      clienteBusiness :TBusinessCliente;
    public
      {Public declarations}
      function buscarCliente(buscarClienteIn: TModelCliente) : TADOQuery;
      procedure excluirCliente(id: integer);
      procedure incluirCliente(ClienteIn: TModelCliente);
      procedure gravarCadastroCliente(ClienteIn: TModelCliente; operacao: TEnumTipoOperacao);
  end;

implementation

{ TController }

function TClienteController.buscarCliente(buscarClienteIn: TModelCliente): TADOQuery;
begin
  Result := clienteBusiness.buscarCliente(buscarClienteIn);
end;

procedure TClienteController.excluirCliente(id: Integer);
begin
  clienteBusiness.excluirCliente(id);
end;

procedure TClienteController.gravarCadastroCliente(ClienteIn: TModelCliente;
  operacao: TEnumTipoOperacao);
begin
  clienteBusiness.gravarCadastroCliente(ClienteIn, operacao);
end;

procedure TClienteController.incluirCliente(ClienteIn: TModelCliente);
begin
  clienteBusiness.incluirCliente(ClienteIn);
end;

end.
