unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private éŒ¾ }
  public
    { Public éŒ¾ }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  SR: TStreamReader;
  SW: TStreamWriter;
  Enc: TEncoding;
begin
  Enc := TEncoding.GetEncoding(932);
  SR := TStreamReader.Create('test.txt', Enc, False, 128);
  SW := TStreamWriter.Create('test2.txt', false, Enc);

  while Not SR.EndOfStream do
    SW.WriteLine(SR.ReadLine);

  FreeAndNil(SW);
  FreeAndNil(SR);
  FreeAndNil(Enc);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Chars: TCharArray;
  AChars: TBytes;

  Len: Integer;
  Len2: Integer;
begin
  SetLength(AChars, 3);
  AChars[0] := $82;
  AChars[1] := $A0;
  AChars[2] := $82;

  Len := MultiByteToWideChar(932, 0, PAnsiChar(AChars), 3, Nil, 0);
  SetLength(Chars, Len);
  MultiByteToWideChar(932, 0, PAnsiChar(AChars), 3, PChar(Chars), Len);
  Len2 := WideCharToMultiByte(932, 0, PChar(Chars), Len, Nil, 0, Nil, Nil);

  ShowMessage('[0]=>' + IntToHex(Integer(Chars[0]), 4) + #13#10'[1]=>' + IntToHex(Integer(Chars[1]), 4)
    + #13#10+ Format('M2W CharCount=%d'#13#10'W2M ByteCount=%d', [Len, Len2]));
end;

end.
