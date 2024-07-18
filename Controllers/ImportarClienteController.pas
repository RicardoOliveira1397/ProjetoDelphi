unit ImportarClienteController;

interface

uses
  SysUtils, Classes, DB, ADODB, uCliente, uDataCliente, uBusinessCliente, Contnrs;

type
  TImportarClienteController = class
    private
    uBusinessCliente :TBusinessCliente;
    public
      function importarTXT(arquivo: TStringList) :TObjectList;
      function importarExcel(arquivo: String) :TObjectList;
      function importarXml(arquivo :String) :TObjectList;
  end;

implementation

{ TImportarClienteController }

function TImportarClienteController.importarExcel(arquivo: String) :TObjectList;
begin
  Result := uBusinessCliente.importarExcel(arquivo);
end;

function TImportarClienteController.importarTXT(arquivo: TStringList) :TObjectList;
begin
  Result := uBusinessCliente.importarTXT(arquivo);
end;

function TImportarClienteController.importarXml(arquivo: String): TObjectList;
begin
 Result := uBusinessCliente.importarXml(arquivo);
end;

end.
