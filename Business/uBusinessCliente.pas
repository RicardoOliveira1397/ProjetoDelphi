Unit uBusinessCliente;

Interface

Uses
  SysUtils, Classes, DB, ADODB, Contnrs, uCliente, uDataCliente,
  UEnumTipoOperacao, ComObj, Dialogs, Variants, strUtils, XMLDoc, XMLIntf;

Type
  TBusinessCliente = Class
  Private
  Public
    Function buscarCliente(buscarClienteIn: TModelCliente): TADOQuery;
    Procedure gravarCadastroCliente(ClienteIn: TModelCliente; operacao: TEnumTipoOperacao);
    Procedure excluirCliente(id: Integer);
    Procedure incluirCliente(clienteIn: TModelCliente);
    Procedure incluirListaCliente(listaCliente: TObjectList);
    Function importarTXT(arquivo: TStringList): TObjectList;
    Function importarExcel(arquivo: String): TObjectList;
    Function importarXml(arquivo: String): TObjectList;
  End;

Implementation

{ TBusinessCliente }

Function TBusinessCliente.buscarCliente(buscarClienteIn: TModelCliente): TADOQuery;
Begin
  If Trim(buscarClienteIn.Nome) <> '' Then
  Begin
    Result := uDataCliente.DataCliente.buscarClienteByNome(buscarClienteIn.Nome);
  End
  Else
  Begin
    Result := uDataCliente.DataCliente.buscarCliente();
  End;
End;

Procedure TBusinessCliente.excluirCliente(id: Integer);
Begin
  uDataCliente.DataCliente.excluirCliente(id);
End;

Procedure TBusinessCliente.gravarCadastroCliente(ClienteIn: TModelCliente; operacao: TEnumTipoOperacao);
Begin
  Case operacao Of
    Inserir:
      uDataCliente.DataCliente.incluirCliente(ClienteIn);
    Excluir:
      uDataCliente.DataCliente.alterarCliente(ClienteIn);
  End;
End;

Function TBusinessCliente.importarExcel(arquivo: String): TObjectList;
Var
  Excel, Planilha: OleVariant;
  Linha: integer;
  Cliente: TModelCliente;
  ListaObjetos: TObjectList;
Begin
  Try
    Excel := CreateOleObject('Excel.Application');
    Excel.Workbooks.Open(arquivo);
    ListaObjetos := TObjectList.Create;
    Planilha := Excel.Workbooks[1].Sheets[1];

    For Linha := 3 To Planilha.UsedRange.Rows.Count Do
    Begin
      Cliente := TModelCliente.Create;

      Cliente.Id := Planilha.Cells[Linha, 1].Text;
      Cliente.Nome := Planilha.Cells[Linha, 2].Text;
      Cliente.Telefone := Planilha.Cells[Linha, 3].Text;

      ListaObjetos.Add(Cliente);
    End;
    Result := ListaObjetos;
  Finally
    Excel.Quit; // Fecha o Excel após o término do processamento
    Excel := Unassigned; // Libera a referência para o objeto Excel
  End;
End;

Function TBusinessCliente.importarTXT(arquivo: TStringList): TObjectList;
Var
  linha, id, nome, telefone: String;
  i: Integer;
  Cliente: TModelCliente;
  Lista: TObjectList;
Begin
  Lista := TObjectList.Create;
  For i := 0 To arquivo.Count - 1 Do
  Begin
    Cliente := TModelCliente.Create;
    linha := arquivo[i];

    id := Trim(Copy(linha, 0, 11));
    nome := Copy(linha, 11, 51);
    telefone := Copy(linha, 62, 30);

    Cliente.Id := StrToInt(id);
    Cliente.Nome := nome;
    Cliente.Telefone := telefone;
    Lista.Add(Cliente);
  End;
  Result := Lista;
End;

Function TBusinessCliente.importarXml(arquivo: String): TObjectList;
Var
  Xml: IXMLDocument;
  RootNode, ClienteNode, ChildNode: IXMLNode;
  i: integer;
  Cliente: TModelCliente;
  ListaCliente: TObjectList;
Begin
  If Not FileExists(arquivo) Then
    ShowMessage('Arquivo nao encontrado');

  Xml := TXMLDocument.Create(nil);
  Xml.LoadFromFile(arquivo);
  Xml.Active := True;
  ListaCliente := TObjectList.Create;

  RootNode := Xml.DocumentElement;

  For i := 0 To RootNode.ChildNodes.Count - 1 Do
  Begin
    Cliente := TModelCliente.Create;
    ClienteNode := RootNode.ChildNodes[i];

    ChildNode := ClienteNode.ChildNodes.FindNode('ID');
    If Assigned(ChildNode) Then
      Cliente.Id := StrToInt(ChildNode.Text);

    ChildNode := ClienteNode.ChildNodes.FindNode('Nome');
    If Assigned(ChildNode) Then
      Cliente.Nome := ChildNode.Text;

    ChildNode := ClienteNode.ChildNodes.FindNode('Telefone');
    If Assigned(ChildNode) Then
      Cliente.Telefone := ChildNode.Text;

    ListaCliente.Add(Cliente);
  End;

  Result := ListaCliente;
End;

Procedure TBusinessCliente.incluirCliente(clienteIn: TModelCliente);
Begin
  uDataCliente.DataCliente.incluirCliente(clienteIn);
End;

Procedure TBusinessCliente.incluirListaCliente(listaCliente: TObjectList);
Begin
  uDataCliente.DataCliente.incluirListaCliente(listaCliente);
End;

End.

