unit UFrmViewMovimentoImportar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, DB, ADODB;

type
  TViewImportar = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    btnImportar: TButton;
    DataSourceImportar: TDataSource;
    procedure btnImportarClick(Sender: TObject);
  private
    resultado :TADOQuery;
    procedure importarTXT(arquivo :TStringList);
  public
    { Public declarations }
  end;

var
  ViewImportar: TViewImportar;

implementation

{$R *.dfm}

procedure TViewImportar.btnImportarClick(Sender: TObject);
var
  t:textfile;
  arquivotxt:TStringList;
begin
 if OpenDialog1.Execute then
 begin
   Edit1.Text := OpenDialog1.FileName;
   AssignFile(t, OpenDialog1.FileName);
   reset(t);

   if SameText(ExtractFileExt(OpenDialog1.FileName), '.txt') then
    begin
      try
        arquivotxt := TStringList.Create;
        arquivotxt.LoadFromFile(Edit1.Text);
        importarTXT(arquivotxt);
        ShowMessage('Arquivo TXT selecionado!');
      finally
      arquivotxt.Free;
      end;
    end
   else if SameText(ExtractFileExt(OpenDialog1.FileName), '.xlsx') then
    begin
      ShowMessage('Arquivo Excel Selecionado');
    end
    else
    begin
      ShowMessage('Arquivo inválido');
    end;

 end;
 
end;

procedure TViewImportar.importarTXT(arquivo: TStringList);
var
  gravar, ler: Tstrings;
  i: integer;
begin
  gravar := TStringList.Create;
  ler := TStringList.Create;

  gravar.Delimiter := ';';
  gravar.StrictDelimiter := True;

  for i := 0 to Pred(ler.Count) do
  begin
    gravar.DelimitedText := ler.Strings[i];
  end;
    
end;

end.
