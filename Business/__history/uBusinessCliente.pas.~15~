unit uBusinessCliente;

interface

uses
  SysUtils, Classes, DB, ADODB, uCliente, uDataCliente;

Type
  TBusinessCliente = Class
    private
    public
      function buscarCliente(buscarClienteIn : TModelCliente) : TADOQuery;
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

end.
