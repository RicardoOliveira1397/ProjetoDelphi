unit UFrmViewMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, UFrmViewCadastroCliente;

type
  TFrmMainMenu = class(TForm)
    MainMenu1: TMainMenu;
    CADASTRO1: TMenuItem;
    MOVIMENTO1: TMenuItem;
    RELATRIOS1: TMenuItem;
    CLIENTE1: TMenuItem;
    CLIENTES1: TMenuItem;
    procedure CLIENTE1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMainMenu: TFrmMainMenu;

implementation

{$R *.dfm}

procedure TFrmMainMenu.CLIENTE1Click(Sender: TObject);
begin
  FrmViewCadastroCliente := TFrmViewCadastroCliente.Create(Self);
  UFrmViewCadastroCliente.FrmViewCadastroCliente.ShowModal;
  UFrmViewCadastroCliente.FrmViewCadastroCliente.Release;

end;

end.
