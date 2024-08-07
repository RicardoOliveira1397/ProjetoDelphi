unit Libwin;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, ExtCtrls, IniFiles,
  DB, DBTables, Buttons, DBClient, SHDocVw, ActiveX,
  Math, Variants, ComObj, Shellapi, Winsock, Grids, DBGrids,
  IdHashMessageDigest, StrUtils, ADODB, IdCoderMIME;

Function trocaVirgula(Valor: string): String;
procedure imprimirPlanilha(instrucaoSQl: TADOQuery; title, tipo: String);
procedure imprimirTXT(instrucaoSQl: TADOQuery);

implementation

procedure imprimirPlanilha(instrucaoSQl: TADOQuery; title, tipo: String);
var
  Linha, Coluna: Integer;
  ValorCampo: String;
  Celula: Variant;
  MSExcel, ExcelBook, ExcelSheet: OleVariant;
begin
  MSExcel    := CreateOLEObject( 'Excel.Application' ); // Cria uma aplica��o do Excel
  ExcelBook  := MSExcel.WorkBooks.Add;                  // Adiciona uma pasta na planilha
  ExcelSheet := ExcelBook.WorkSheets.Add;
  ExcelSheet.Range['A1','H1'].Merge(EmptyParam);
  ExcelSheet.Cells[ 1,1 ].Font.Size      := 12;
  ExcelSheet.Cells[ 1,1 ].Interior.Color := $00ffcf9c;
  ExcelSheet.Cells[ 1,1 ].Font.Bold      := True;
  Celula       := ExcelSheet.Cells[ 1,1 ];
  Celula.Value := title;
  Linha := 3; // Dados s�o inseridos a partir desta linha
  Screen.Cursor := crHourGlass;

  instrucaoSQl.Open;

{gera a segunda linha com o nome das colunas do banco de dados}
  if (instrucaoSQl.RecordCount > 0) then begin
    for Coluna := 1 to instrucaoSQL.FieldCount do
    begin
      ValorCampo := instrucaoSQL.Fields[coluna - 1].DisplayLabel;
      MSExcel.cells[2,coluna] := ValorCampo; // Nome das colunas
      MSExcel.Cells[2,coluna].Font.Color := clWhite;
      MSExcel.Cells[2,coluna].Font.Bold := True;
      MSExcel.Cells[2,coluna].Interior.Color := clBlue;
    end;

{formata as c�lulas com o tipo e regras de acordo com o tipo de dados do banco de dados}
    For Coluna := 0 to (instrucaoSQl.FieldCount - 1) do
    begin
      MSExcel.Cells[Linha,Coluna + 1] := instrucaoSQl.Fields[Coluna].DisplayLabel;
      Case instrucaoSQl.Fields[Coluna].DataType Of
        ftDate    : MSExcel.Columns.Columns[ Coluna + 1 ].NumberFormat := 'dd/mm/aaaa';
        ftDateTime: MSExcel.Columns.Columns[ Coluna + 1 ].NumberFormat := 'dd/mm/aaaa';
        ftString  : MSExcel.Columns.Columns[ Coluna + 1 ].NumberFormat := '@';
        ftCurrency: MSExcel.Columns.Columns[ Coluna + 1 ].NumberFormat := '###0,00';
        ftFloat   : MSExcel.Columns.Columns[ Coluna + 1 ].NumberFormat := '###0';
        ftBCD     : MSExcel.Columns.Columns[ Coluna + 1 ].NumberFormat := '@';
        ftSmallint: MSExcel.Columns.Columns[ Coluna + 1 ].NumberFormat := '###0,00';
      end;
    end;

    instrucaoSQl.First;
    instrucaoSQl.DisableControls;
    try
      while not instrucaoSQl.Eof do
      begin
        try
          for Coluna := 0 to (instrucaoSQL.FieldCount - 1) do  begin
            if not VarIsEmpty(instrucaoSQl.Fields[coluna].Value) then
              MSExcel.Cells[Linha,Coluna + 1] := Trim(VarToStr(instrucaoSQl.Fields[Coluna].Value))
            else
              MSExcel.Cells[Linha,Coluna + 1] := instrucaoSQl.Fields[Coluna].Value;

          end;
          instrucaoSQl.Next;
          Inc(Linha);
        finally
        end;
      end;
    finally
      instrucaoSQl.EnableControls;
    end;
  end;
  MSExcel.Columns.AutoFit;  //ajusta o tamanho das colunas da planilha Excel
  MSExcel.Visible := True;  //inicia o excel no computador do cliente para visualizar a planilha
  Screen.Cursor := crDefault;
end;

Function trocaVirgula(Valor: string): String;
begin
  if (Trim(valor) <> EmptyStr) and
     (Trim(valor) <> '0')      then
     Result := trim(StringReplace(Valor,',','.',[rfReplaceall]))
  else
     Result := '0.00';
end;

procedure imprimirTXT(instrucaoSQl: TADOQuery);
var
  path: string;
  Arquivo: TStringList;
  Line: string;
begin
  path := GetCurrentDir + '\' + 'Exportar';
  try
    ForceDirectories(path);
  except
    on E: Exception do
      ShowMessage('Erro ao criar pasta');
  end;

  Arquivo := TStringList.Create;
  try
    // Percorre os registros da query
    instrucaoSQl.First;
    while not instrucaoSQl.Eof do
    begin
      Line := '';
      // Ajuste para garantir que cada campo tenha um tamanho m�nimo e alinhamento adequado
      Line := Format('%-10s %-50s %-40s', [instrucaoSQl.Fields[0].AsString, instrucaoSQl.Fields[1].AsString, instrucaoSQl.Fields[2].AsString]);
      Arquivo.Add(Line); // Adiciona a linha no arquivo texto
      instrucaoSQl.Next;
    end;
    // Salva o arquivo texto
    Arquivo.SaveToFile(path + '\' + 'texto.txt');
  finally
    Arquivo.Free;
  end;
end;

end.




