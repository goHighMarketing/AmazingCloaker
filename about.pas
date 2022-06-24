unit About;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  fileinfo, winpeimagereader, {need this for reading exe info}
  elfreader, {needed for reading ELF executables}
  machoreader; {needed for reading MACH-O executables}

type

  { TForm2 }

  TForm2 = class(TForm)
    Image1: TImage;
    LabelCopyLeft: TLabel;
    LabelVersion: TLabel;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormShow(Sender: TObject);
    var
  FileVerInfo: TFileVersionInfo;
  str: String;
begin
  str:= 'MIT License'  +  sLineBreak +

'Copyright (c) 2008-' + FormatDateTime('YYYY',Now) + ' goHighMarketing'  +  sLineBreak  +  sLineBreak +

'Permission is hereby granted, free of charge, to any person obtaining a copy ' +
'of this software and associated documentation files (the "Software"), to deal ' +
'in the Software without restriction, including without limitation the rights ' +
'to use, copy, modify, merge, publish, distribute, sublicense, and/or sell ' +
'copies of the Software, and to permit persons to whom the Software is ' +
'furnished to do so, subject to the following conditions: ' +  sLineBreak  +  sLineBreak +

'The above copyright notice and this permission notice shall be included in all ' +
'copies or substantial portions of the Software. ' +  sLineBreak  +  sLineBreak +

'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR ' +
'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, ' +
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE ' +
'AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER ' +
'LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, ' +
'OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE ' +
'SOFTWARE. ';

  FileVerInfo:=TFileVersionInfo.Create(nil);
  try
    FileVerInfo.ReadFileInfo;
    LabelVersion.Caption:='Version: '+FileVerInfo.VersionStrings.Values['FileVersion'] + ' by Jack Keifer';
    LabelCopyLeft.Caption:= 'MIT License Copyright (c) 2008-' + FormatDateTime('YYYY',Now) + ' goHighMarketing';
    Memo1.Text:= str;
  finally
    FileVerInfo.Free;
  end;
end;

end.

