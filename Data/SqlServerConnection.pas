unit SqlServerConnection;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TTransaction = class(TDataModule)
    uSqlConnection: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Transaction: TTransaction;

implementation

{$R *.dfm}

end.
