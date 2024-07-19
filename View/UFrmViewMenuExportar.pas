unit UFrmViewMenuExportar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ClienteController, UEnumTipoArquivo, Libwin,
  ADODB, DB, uCliente, RpBase, RpSystem, RpDefine, RpRave, RpRender, RpRenderPDF,
  SqlServerConnection, RpCon, RpConDS;

type
  TViewMenuExportar = class(TForm)
    RadioGroup1: TRadioGroup;
    btnExportarArquivo: TButton;
    Panel1: TPanel;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    RvDataSetConnection1: TRvDataSetConnection;
    ADOQuery1: TADOQuery;
    procedure btnExportarArquivoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    clienteIn :TModelCliente;
    clienteController :TClienteController;

  public
    { Public declarations }
  end;

var
  ViewMenuExportar: TViewMenuExportar;

implementation

{$R *.dfm}

procedure TViewMenuExportar.btnExportarArquivoClick(Sender: TObject);
var
  qSQL :TADOQuery;
  itemIndex: Integer;
begin
  clienteController := TClienteController.Create;
  clienteIn := TModelCliente.Create;
  qSQL := clienteController.buscarCliente(clienteIn);
  itemIndex := RadioGroup1.ItemIndex;
  if itemIndex <> -1 then
    begin
      case itemIndex of
        0:
          libwin.imprimirPlanilha(qSQL, 'Relatorio', 'Testando');
        1:
          libwin.imprimirTXT(qSQL);
        2:
        begin
         // RvProject1.SetParam('Registro', '1');
         // RvProject1.SetParam('Nome', 'Ricardo');
         // RvProject1.SetParam('Telefone', '19989285457';

          RvSystem1.DefaultDest              := rdPreview;
          RvSystem1.SystemPreview.FormWidth  := 900;
          RvSystem1.SystemPreview.FormHeight := 700;
          RvSystem1.DoNativeOutput           := False;
          RvSystem1.SystemSetups             := RvSystem1.SystemSetups-[ssAllowSetup];

          RvProject1.Active := True;
          RvProject1.ExecuteReport('Report1');
        end;
      end;
    end;
end;

procedure TViewMenuExportar.FormCreate(Sender: TObject);
var
  enumValue: TEnumTipoArquivo;
begin
  RadioGroup1.Items.Clear;

 for enumValue := Low(TEnumTipoArquivo) to High(TEnumTipoArquivo) do
 begin
  RadioGroup1.Items.Add(TipoArquivoNomes[enumValue]);
 end;
end;

end.
