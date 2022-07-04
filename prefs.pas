unit Prefs;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, CheckLst,
  ExtCtrls, ComCtrls, Spin, IniFiles;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    CheckListBox1: TCheckListBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    RadioButtonFramed: TRadioButton;
    RadioButtonUnframed: TRadioButton;
    SpinEditPrefsSeconds: TSpinEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure iniRead;
    procedure WriteSettings;

  public
    iniPath: String;
    INI_SECTION_PREFS: String;
    INI: TIniFile;
  const
    IniFile = 'ac.ini';
  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

procedure TForm3.FormShow(Sender: TObject);
begin
    iniPath:= Application.Location;
    // HintsDisable:= '0';  // hints on by default (CheckBox_HintsDisable unchecked)
    INI_SECTION_PREFS:= 'PREFS';
    iniRead;

end;

procedure TForm3.Button1Click(Sender: TObject);
begin
     WriteSettings;
end;

procedure TForm3.iniRead();
var
  method: integer;
begin
    INI:= TINIFile.Create(iniPath + IniFile);
    method:= 0;
 // Put reading the INI file inside a try/finally block to prevent
 // memory leaks
    try
        // Read values from the INI file.
        CheckListBox1.Checked[0]:= INI.ReadBool(INI_SECTION_PREFS,'AutoSaveSessions',false);
        CheckListBox1.Checked[1]:= INI.ReadBool(INI_SECTION_PREFS,'GenerateEmbeddedCookie',false);
        CheckListBox1.Checked[2]:= INI.ReadBool(INI_SECTION_PREFS,'ForceRedirectCookie',false);
        SpinEditPrefsSeconds.Value:= INI.ReadInteger(INI_SECTION_PREFS,'DefaultWaitTime',0);
        method:= INI.ReadInteger(INI_SECTION_PREFS,'CloakMethod',0);
        if method = 0 then RadioButtonFramed.Checked:= true;
        if method = 1 then RadioButtonUnframed.Checked:= true;
    finally
        INI.Free;
     end;
end;

procedure TForm3.WriteSettings;
var
    method: Integer;
begin
    INI:= TINIFile.Create(iniPath + IniFile);
    method:= 0;
    if RadioButtonUnframed.Checked then method:= 1;
    INI.WriteBool(INI_SECTION_PREFS,'AutoSaveSessions',CheckListBox1.Checked[0]);
    INI.WriteBool(INI_SECTION_PREFS,'GenerateEmbeddedCookie',CheckListBox1.Checked[1]);
    INI.WriteBool(INI_SECTION_PREFS,'ForceRedirectCookie',CheckListBox1.Checked[2]);
    INI.WriteInteger(INI_SECTION_PREFS,'DefaultWaitTime',SpinEditPrefsSeconds.Value);
    INI.WriteInteger(INI_SECTION_PREFS,'CloakMethod', method);
end;

end.

