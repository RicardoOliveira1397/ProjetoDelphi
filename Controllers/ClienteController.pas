unit ClienteController;

interface

uses
  SysUtils, Classes, DB, ADODB, uCliente, uDataCliente, uBusinessCliente;

type
  TClienteController = class
    private
      {Private declarations}
      FBusinessCliente: TBusinessCliente;
    public
      {Public declarations}
      function buscarCliente(buscarClienteIn: TModelCliente) : TADOQuery;
      procedure excluirCliente(id: integer);
      procedure incluirCliente(ClienteIn: TModelCliente);
  end;

implementation

{ TController }

function TClienteController.buscarCliente(buscarClienteIn: TModelCliente): TADOQuery;
begin
  Result := FBusinessCliente.buscarCliente(buscarClienteIn);
end;

procedure TClienteController.excluirCliente(id: Integer);
begin
  uDataCliente.DataCliente.excluirCliente(id);
end;

procedure TClienteController.incluirCliente(ClienteIn: TModelCliente);
begin
  uDataCliente.DataCliente.incluirCliente(ClienteIn);
end;

end.
