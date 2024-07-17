program Clientes;

uses
  Forms,
  UFrmViewMain in 'View\UFrmViewMain.pas' {FrmMainMenu},
  ClienteController in 'Controllers\ClienteController.pas',
  SqlServerConnection in 'Data\SqlServerConnection.pas' {Transaction: TDataModule},
  UFrmViewCadastroCliente in 'View\UFrmViewCadastroCliente.pas' {FrmViewCadastroCliente},
  uCliente in 'Model\uCliente.pas',
  uDataCliente in 'Data\uDataCliente.pas' {DataCliente: TDataModule},
  uBusinessCliente in 'Business\uBusinessCliente.pas',
  LIBWIN in 'Util\LIBWIN.PAS',
  UEnumTipoOperacao in 'Enum\UEnumTipoOperacao.pas',
  UFrmViewMenuExportar in 'View\UFrmViewMenuExportar.pas' {ViewMenuExportar},
  UEnumTipoArquivo in 'Enum\UEnumTipoArquivo.pas',
  uReportCliente in 'Reports\uReportCliente.pas' {formReportCliente},
  UFrmViewMovimentoImportar in 'View\UFrmViewMovimentoImportar.pas' {ViewImportar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMainMenu, FrmMainMenu);
  Application.CreateForm(TTransaction, Transaction);
  Application.CreateForm(TFrmViewCadastroCliente, FrmViewCadastroCliente);
  Application.CreateForm(TDataCliente, DataCliente);
  Application.CreateForm(TViewMenuExportar, ViewMenuExportar);
  Application.CreateForm(TformReportCliente, formReportCliente);
  Application.CreateForm(TViewImportar, ViewImportar);
  Application.Run;
end.
