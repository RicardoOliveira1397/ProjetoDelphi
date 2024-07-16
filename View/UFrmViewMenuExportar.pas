unit UFrmViewMenuExportar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ClienteController, UEnumTipoArquivo;

type
  TViewMenuExportar = class(TForm)
    RadioGroup1: TRadioGroup;
    btnExportarArquivo: TButton;
    Panel1: TPanel;
    procedure btnExportarArquivoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    clienteController :TClienteController;
    enumTipoArquivo :TEnumTipoArquivo;
  public
    { Public declarations }
  end;

var
  ViewMenuExportar: TViewMenuExportar;

implementation

{$R *.dfm}

procedure TViewMenuExportar.btnExportarArquivoClick(Sender: TObject);
begin
  clienteController := TClienteController.Create;
  clienteController.exportarArquivoCliente();
end;

procedure TViewMenuExportar.FormCreate(Sender: TObject);
begin
 enumTipoArquivo := TEnumTipoArquivo;
    
end;

end.
