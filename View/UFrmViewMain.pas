unit UFrmViewMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TFrmMainMenu = class(TForm)
    MainMenu1: TMainMenu;
    CADASTRO1: TMenuItem;
    MOVIMENTO1: TMenuItem;
    RELATRIOS1: TMenuItem;
    CLIENTE1: TMenuItem;
    CLIENTES1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMainMenu: TFrmMainMenu;

implementation

{$R *.dfm}

end.
