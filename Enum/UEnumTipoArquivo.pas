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
  Contagem = Ord(High(TEnumTipoArquivo));

implementation

end.
