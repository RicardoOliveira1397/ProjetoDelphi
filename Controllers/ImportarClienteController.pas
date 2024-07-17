unit ImportarClienteController;

interface

uses
  SysUtils, Classes, DB, ADODB, uCliente, uDataCliente, uBusinessCliente;

type
  TImportarClienteController = class
    private
    public
      function importarTXT(arquivo: TStringList) :TADOQuery;
  end;

implementation

{ TImportarClienteController }

function TImportarClienteController.importarTXT(
  arquivo: TStringList): TADOQuery;
begin

end;

end.
