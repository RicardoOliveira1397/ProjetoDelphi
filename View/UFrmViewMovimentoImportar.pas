Unit UFrmViewMovimentoImportar;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, DB, ADODB,
  ImportarClienteController, ClienteController, uCliente, Contnrs, ComObj,
  DBClient;

Type
  TViewImportar = Class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    btnImportar: TButton;
    DataSourceImportar: TDataSource;
    btmGravarImportar: TButton;
    Procedure btnImportarClick(Sender: TObject);
    Procedure btmGravarImportarClick(Sender: TObject);
  Private
    ListaObj: TObjectList;
    clienteController: TClienteController;
    importarController: TImportarClienteController;
    tmpDataSource: TDataSource;

    Function criarDataSource(ListaObj: TObjectList): TDataSource;
  Public
    { Public declarations }
  End;

Var
  ViewImportar: TViewImportar;

Implementation

{$R *.dfm}

Procedure TViewImportar.btmGravarImportarClick(Sender: TObject);
Begin
  If DBGrid1.DataSource.DataSet.RecordCount = 0 Then
    ShowMessage('Não há dados para importar!');

  Try
    clienteController := TClienteController.Create;
    clienteController.incluirListaCliente(ListaObj);
  Finally
  End;
End;

Procedure TViewImportar.btnImportarClick(Sender: TObject);
Var
  t: textfile;
  arquivotxt: TStringList;
Begin
  Try
    If OpenDialog1.Execute Then
    Begin
      Edit1.Text := OpenDialog1.FileName;
      AssignFile(t, OpenDialog1.FileName);
      reset(t);

      If SameText(ExtractFileExt(OpenDialog1.FileName), '.txt') Then
      Begin
        arquivotxt := TStringList.Create;
        Try
          arquivotxt.LoadFromFile(OpenDialog1.FileName);
          importarController := TImportarClienteController.Create;
          Try
            ListaObj := importarController.importarTXT(arquivotxt);

            tmpDataSource := criarDataSource(ListaObj);
            DBGrid1.DataSource := tmpDataSource;
          Finally
            importarController.Free;
          End;
        Finally
          arquivotxt.Free;
        End;
      End
      Else If SameText(ExtractFileExt(OpenDialog1.FileName), '.xlsx') Then
      Begin
        importarController := TImportarClienteController.Create;
        Try
          ListaObj := importarController.importarExcel(OpenDialog1.FileName);

          tmpDataSource := criarDataSource(ListaObj);
          DBGrid1.DataSource := tmpDataSource;
        Finally
          importarController.Free;
        End;
      End
      Else If SameText(ExtractFileExt(OpenDialog1.FileName), '.xml') Then
      Begin
        importarController := TImportarClienteController.Create;
        Try
          ListaObj := importarController.importarXml(OpenDialog1.FileName);

          tmpDataSource := criarDataSource(ListaObj);
          DBGrid1.DataSource := tmpDataSource;
        Finally
          importarController.Free;
        End;
      End
      Else
        ShowMessage('Arquivo inválido');
    End;
  Finally
    btmGravarImportar.Visible := True;
    CloseFile(t);
  End;
End;

Function TViewImportar.criarDataSource(ListaObj: TObjectList): TDataSource;
Var
  tmpClientDataSet: TClientDataSet;
  tmpDataSource: TDataSource;
  i: integer;
Begin
  tmpClientDataSet := TClientDataSet.Create(Self);
  tmpDataSource := TDataSource.Create(Self);
  tmpClientDataSet.FieldDefs.Add('Id', ftInteger);
  tmpClientDataSet.FieldDefs.Add('Nome', ftString, 50);
  tmpClientDataSet.FieldDefs.Add('Telefone', ftString, 20);
  tmpClientDataSet.CreateDataSet;

  For i := 0 To ListaObj.Count - 1 Do
  Begin
    tmpClientDataSet.Append;
    tmpClientDataSet.FieldByName('Id').AsInteger := TModelCliente(ListaObj[i]).Id;
    tmpClientDataSet.FieldByName('nome').AsString := TModelCliente(ListaObj[i]).Nome;
    tmpClientDataSet.FieldByName('telefone').AsString := TModelCliente(ListaObj[i]).Telefone;
    tmpClientDataSet.Post;
  End;

  tmpDataSource.DataSet := tmpClientDataSet;
  DBGrid1.DataSource := tmpDataSource;

  Result := tmpDataSource;
End;

End.

