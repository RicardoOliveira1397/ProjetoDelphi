unit UFrmViewCadastroCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Grids, DBGrids, ClienteController, uCliente,
  DB, ADODB;


type
  TFrmViewCadastroCliente = class(TForm)
    Panel1: TPanel;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnCancelar: TButton;
    btnGravar: TButton;
    btnExcluir: TButton;
    pgControlCadastroCliente: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dbGrid: TDBGrid;
    Panel2: TPanel;
    pnlCadastro: TPanel;
    btnPesquisar: TButton;
    lbPesquisar: TLabeledEdit;
    dataSource: TDataSource;
    lbNome: TLabeledEdit;
    lbtelefone: TLabeledEdit;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
    resultado: TADOQuery;
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

procedure TFrmViewCadastroCliente.btnExcluirClick(Sender: TObject);
begin
  clienteController := TClienteController.Create;
  clienteIn := TModelCliente.Create;
  clienteIn.Id := resultado.FieldByName('Id').AsInteger;
  clienteController.excluirCliente(clienteIn.Id);
end;

procedure TFrmViewCadastroCliente.btnGravarClick(Sender: TObject);
begin
  clienteController := TClienteController.Create;
  clienteIn := TModelCliente.Create;
  clienteIn.Nome := lbNome.Text;
  clienteIn.Telefone := lbTelefone.Text;
  clienteController.incluirCliente(clienteIn);
end;

procedure TFrmViewCadastroCliente.btnIncluirClick(Sender: TObject);
begin
  pgControlCadastroCliente.ActivePage := pgControlCadastroCliente.Pages[1];
end;

procedure TFrmViewCadastroCliente.btnPesquisarClick(Sender: TObject);
begin
 pesquisar;
end;

procedure TFrmViewCadastroCliente.pesquisar;
begin
    clienteController := TClienteController.Create;
    clienteIn := TModelCliente.Create;
    clienteIn.Nome := Trim(lbPesquisar.Text);
    resultado := clienteController.buscarCliente(clienteIn);
    dataSource.DataSet := resultado;

    With dbGrid do
    begin

    end;
end;

end.
