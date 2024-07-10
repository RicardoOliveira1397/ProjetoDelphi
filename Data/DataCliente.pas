unit DataCliente;

interface

uses
   SysUtils, Classes, DB, ADODB, uCliente;

type
  TDataCliente = class
    private
    public
      function buscarCliente(Cliente : TModelCliente) : TADOQuery;

  end;

implementation

{ TDataCliente }

function TDataCliente.buscarCliente(Cliente: TModelCliente): TADOQuery;
begin
//
end;

end.
