unit UFrmViewMovimentoImportar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, DB, ADODB, ImportarClienteController,
  ClienteController, uCliente, Contnrs, ComObj, DBClient;

type
  TViewImportar = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    btnImportar: TButton;
    DataSourceImportar: TDataSource;
    btmGravarImportar: TButton;
    procedure btnImportarClick(Sender: TObject);
    procedure btmGravarImportarClick(Sender: TObject);
  private
    ListaObj :TObjectList;
    clienteController: TClienteController;
    importarController: TImportarClienteController;
    tmpDataSource :TDataSource;

    function criarDataSource(ListaObj :TObjectList) :TDataSource;
  public
    { Public declarations }
  end;

var
  ViewImportar: TViewImportar;

implementation

{$R *.dfm}

procedure TViewImportar.btmGravarImportarClick(Sender: TObject);
begin
  if DBGrid1.DataSource.DataSet.RecordCount = 0 then
    ShowMessage('N�o h� dados para importar!');

  try
    clienteController := TClienteController.Create;
    clienteController.incluirListaCliente(ListaObj);
  finally
  end;
end;

procedure TViewImportar.btnImportarClick(Sender: TObject);
var
  t: textfile;
  arquivotxt: TStringList;
begin
  try
    if OpenDialog1.Execute then
    begin
      Edit1.Text := OpenDialog1.FileName;
      AssignFile(t, OpenDialog1.FileName);
      reset(t);

      if SameText(ExtractFileExt(OpenDialog1.FileName), '.txt') then
      begin
        arquivotxt := TStringList.Create;
        try
          arquivotxt.LoadFromFile(OpenDialog1.FileName);
          importarController := TImportarClienteController.Create;
          try
            ListaObj := importarController.importarTXT(arquivotxt);

            tmpDataSource := criarDataSource(ListaObj);
            DBGrid1.DataSource := tmpDataSource;
          finally
            importarController.Free;
          end;
        finally
          arquivotxt.Free;
        end;
      end
      else if SameText(ExtractFileExt(OpenDialog1.FileName), '.xlsx') then
      begin
        importarController := TImportarClienteController.Create;
        try
          ListaObj := importarController.importarExcel(OpenDialog1.FileName);

          tmpDataSource := criarDataSource(ListaObj);
          DBGrid1.DataSource := tmpDataSource;
        finally
          importarController.Free;
        end;
      end
      else if SameText(ExtractFileExt(OpenDialog1.FileName), '.xml') then
      begin
        importarController := TImportarClienteController.Create;
        try
          ListaObj := importarController.importarXml(OpenDialog1.FileName);

          tmpDataSource := criarDataSource(ListaObj);
          DBGrid1.DataSource := tmpDataSource;
        finally
          importarController.Free;
        end;
      end
      else
        ShowMessage('Arquivo inv�lido');
    end;
  finally
    btmGravarImportar.Visible := True;
    CloseFile(t);
  end;
end;

function TViewImportar.criarDataSource(ListaObj: TObjectList): TDataSource;
var
  tmpClientDataSet :TClientDataSet;
  tmpDataSource :TDataSource;
  i :integer;
begin
      tmpClientDataSet := TClientDataSet.Create(Self);
      tmpDataSource := TDataSource.Create(Self);
      tmpClientDataSet.FieldDefs.Add('Id', ftInteger);
      tmpClientDataSet.FieldDefs.Add('Nome', ftString, 50);
      tmpClientDataSet.FieldDefs.Add('Telefone', ftString, 20);
      tmpClientDataSet.CreateDataSet;

      for i := 0 to ListaObj.Count - 1 do
        begin
          tmpClientDataSet.Append;
          tmpClientDataSet.FieldByName('Id').AsInteger := TModelCliente(ListaObj[i]).Id;
          tmpClientDataSet.FieldByName('nome').AsString := TModelCliente(ListaObj[i]).Nome;
          tmpClientDataSet.FieldByName('telefone').AsString := TModelCliente(ListaObj[i]).Telefone;
          tmpClientDataSet.Post;
        end;

        tmpDataSource.DataSet := tmpClientDataSet;
        DBGrid1.DataSource := tmpDataSource;

      Result := tmpDataSource;
end;

end.
