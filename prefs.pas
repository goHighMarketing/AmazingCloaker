unit Prefs;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, CheckLst,
  ExtCtrls, ComCtrls, Spin;

type

  { TForm3 }

  TForm3 = class(TForm)
    CheckListBox1: TCheckListBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    RadioButtonFramed: TRadioButton;
    RadioButtonUnframed: TRadioButton;
    SpinEditPrefsSeconds: TSpinEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
  private

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

end.

