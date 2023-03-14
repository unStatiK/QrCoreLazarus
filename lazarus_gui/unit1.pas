unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  CTypes, SysUtils, Forms, StdCtrls, ExtCtrls, SynHighlighterPerl, LCLType;

type
  libRef = type pointer;

  DLLfunc = function(a: libRef): Integer; cdecl;
  DLLVersionFunc = function(a: libRef): PChar; cdecl;
  DLLGetNumberFunc = function(a: libRef): Integer; cdecl;
  DLLSetNumberFunc = procedure(a: libRef; num: Integer); cdecl;
  DLLGetStrFunc = function(a: libRef): PChar; cdecl;
  DLLSetStrFunc = procedure(a: libRef; str: PChar); cdecl;
  DLLNewInstanceFunc = function: libRef; cdecl;
  DLLGetShortNameFunc = function(a: libRef): ShortString; cdecl;

  DLLHellloStrFunc = function: PChar; cdecl;

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    procedure FormActivate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  dllInstance: THandle;
  externalFunc: DLLFunc;
  externalVersionFunc: DLLVersionFunc;
  externalGetNumberFunc: DLLGetNumberFunc;
  externalSetNumberFunc: DLLSetNumberFunc;
  externalGetStrFunc: DLLGetStrFunc;
  externalSetStrFunc: DLLSetStrFunc;
  externalNewInstanceFunc: DLLNewInstanceFunc;
  externalGetShortNameFunc: DLLGetShortNameFunc;

  externalHelloStrFunc: DLLHellloStrFunc;
  helloStr: PChar;

  libRefInstance: libRef;
  exportNumber: Integer;
  exportStr: PChar;
  qtVersion: PChar;
  shortName: ShortString;
  fooStr: PChar;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormActivate(Sender: TObject);
begin
  dllInstance:= LoadLibrary('tinyUserLib.dll');
  externalFunc:= DLLFunc(GetProcAddress(dllInstance, 'call_foo'));
  externalVersionFunc:= DLLVersionFunc(GetProcAddress(dllInstance, 'get_version'));
  externalGetNumberFunc:= DLLGetNumberFunc(GetProcAddress(dllInstance, 'get_number'));
  externalSetNumberFunc:= DLLSetNumberFunc(GetProcAddress(dllInstance, 'set_number'));
  externalNewInstanceFunc:= DLLNewInstanceFunc(GetProcAddress(dllInstance, 'new_instance'));
  externalGetStrFunc:= DLLGetStrFunc(GetProcAddress(dllInstance, 'get_str'));
  externalSetStrFunc:= DLLSetStrFunc(GetProcAddress(dllInstance, 'set_str'));
  externalGetShortNameFunc:= DLLGetShortNameFunc(GetProcAddress(dllInstance, 'get_short_name'));

  libRefInstance:= externalNewInstanceFunc();

  // get value from foo function and convert to PChar
  fooStr:= PChar(IntToStr(externalFunc(libRefInstance)));

  // push number
  exportNumber:= 42;
  Panel3.Caption:= IntToStr(exportNumber);
  externalSetNumberFunc(libRefInstance, exportNumber);
  Panel1.Caption:= IntToStr(externalGetNumberFunc(libRefInstance));

  //push string
  exportStr:= 'hello';
  Panel4.Caption:= exportStr;
  externalSetStrFunc(libRefInstance, exportStr);
  Panel2.Caption:= externalGetStrFunc(libRefInstance);

  qtVersion:= externalVersionFunc(libRefInstance);
  Panel5.Caption:= qtVersion;

  Application.MessageBox(fooStr, 'Reply', MB_ICONINFORMATION);
end;

end.

