program Clientes;

uses
  Forms,
  UFrmViewMain in 'View\UFrmViewMain.pas' {FrmMainMenu},
  ClienteController in 'Controllers\ClienteController.pas',
  SqlServerConnection in 'Data\SqlServerConnection.pas' {DataModule1: TDataModule},
  UFrmViewCadastroCliente in 'View\UFrmViewCadastroCliente.pas' {FrmViewCadastroCliente},
  uCliente in 'Model\uCliente.pas',
  DataCliente in 'Data\DataCliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMainMenu, FrmMainMenu);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFrmViewCadastroCliente, FrmViewCadastroCliente);
  Application.Run;
end.