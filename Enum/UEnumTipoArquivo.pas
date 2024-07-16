unit UEnumTipoArquivo;

interface

uses
  SysUtils, Classes, DB;

type
  TEnumTipoArquivo = (
    Excel = 1,
    TXT = 2,
    Report = 3
  );

const
  TipoArquivoNomes: array[TEnumTipoArquivo] of string = ('Excel','TXT','Report');

implementation

end.
