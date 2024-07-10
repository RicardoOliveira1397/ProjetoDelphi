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
  end;

implementation

{ TController }

function TClienteController.buscarCliente(buscarClienteIn: TModelCliente): TADOQuery;
begin
  Result := FBusinessCliente.buscarCliente(buscarClienteIn);
end;

end.
