unit ClienteController;

interface

uses
  SysUtils, Classes, DB, ADODB, uCliente;

type
  TClienteController = class
    private
      {Private declarations}
    public
      {Public declarations}
      function buscarCliente(Cliente : TModelCliente) : TADOQuery;
  end;

implementation

{ TController }

function TClienteController.buscarCliente(Cliente: TModelCliente): TADOQuery;
begin
//
end;

end.