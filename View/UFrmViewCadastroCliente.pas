unit UFrmViewCadastroCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Grids, DBGrids, ClienteController, uCliente,
  DB, ADODB, LIBWIN, UEnumTipoOperacao, UFrmViewMenuExportar;


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
    btnExportar: TButton;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    operacao: TEnumTipoOperacao;
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

procedure TFrmViewCadastroCliente.btnAlterarClick(Sender: TObject);
begin
  operacao := Atualizar;
  clienteController := TClienteController.Create;
  clienteIn := TModelCliente.Create;
  clienteIn.Id := resultado.FieldByName('Id').AsInteger;
  clienteIn.Nome := resultado.FieldByName('nome').AsString;
  clienteIn.Telefone := resultado.FieldByName('telefone').AsString;

  pgControlCadastroCliente.ActivePage := pgControlCadastroCliente.Pages[1];
  lbNome.Text := clienteIn.Nome;
  lbtelefone.Text := clienteIn.Telefone;
end;

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
  clienteController.gravarCadastroCliente(clienteIn, operacao);
end;

procedure TFrmViewCadastroCliente.btnIncluirClick(Sender: TObject);
begin
  operacao := Inserir;
  pgControlCadastroCliente.ActivePage := pgControlCadastroCliente.Pages[1];
end;

procedure TFrmViewCadastroCliente.btnPesquisarClick(Sender: TObject);
begin
 pesquisar;
end;

procedure TFrmViewCadastroCliente.btnExportarClick(Sender: TObject);
begin
  //LIBWIN.imprimirPlanilha(resultado, 'TESTE', 'Teste');
  ViewMenuExportar := TViewMenuExportar.Create(Self);
  ViewMenuExportar.ShowModal;
  ViewMenuExportar.Release;
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
      Columns[0].Title.Caption := 'Registro';
      Columns[1].Title.Caption := 'Nome Cliente';
      Columns[2].Title.Caption := 'Contato';

      Refresh;
      Update;
    end;
end;

end.
