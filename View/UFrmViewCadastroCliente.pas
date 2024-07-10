unit UFrmViewCadastroCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Grids, DBGrids, ClienteController, uCliente,
  DB, ADODB;


type
  TFrmViewCadastroCliente = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    btnPesquisar: TButton;
    lbPesquisar: TLabeledEdit;
    dataSource: TDataSource;
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    clienteIn : TModelCliente;
    clienteController : TClienteController;
    procedure pesquisar;
  public
    { Public declarations }
  end;

var
  FrmViewCadastroCliente: TFrmViewCadastroCliente;

implementation

{$R *.dfm}

{ TFrmViewCadastroCliente }

procedure TFrmViewCadastroCliente.btnPesquisarClick(Sender: TObject);
begin
 pesquisar;
end;

procedure TFrmViewCadastroCliente.pesquisar;
var
  resultado: TADOQuery;
begin
    clienteController := TClienteController.Create;
    clienteIn := TModelCliente.Create;
    clienteIn.Nome := Trim(lbPesquisar.Text);
    resultado := clienteController.buscarCliente(clienteIn);
    dataSource.DataSet := resultado;
end;

end.
