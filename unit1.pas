unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SQLite3Conn, SQLDB, DB, Forms, Controls, Graphics, Dialogs,
  Menus, LCLProc, LCLType, LazHelpHTML, UTF8Process, LCLIntf, ComCtrls,
  ExtCtrls, StdCtrls, Buttons, DBGrids, CheckLst, Spin, DBCtrls, ftpsend, About,
  Prefs, IniFiles, Sqlite3dyn, FileUtil, Clipbrd;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtnCloakLink: TBitBtn;
    Button_CopyLinkCodes: TButton;
    Button_CopyCookieCode: TButton;
    Button_FTPConnect: TButton;
    CheckBox_ForceCookie: TCheckBox;
    CheckBox_InclCookie: TCheckBox;
    CheckBox_SaveSessions: TCheckBox;
    CheckBox_GoogleTracking: TCheckBox;
    ComboBox_Extensions: TComboBox;
    ComboBox_Method: TComboBox;
    ComboBox_SpecialSettings: TComboBox;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBEdit_RedirectPage: TDBEdit;
    DBEdit_SubDirectory: TDBEdit;
    DBEdit_URL: TDBEdit;
    DBEdit_LinkText: TDBEdit;
    DBEdit_Title: TDBEdit;
    DBEdit_Altlink: TDBEdit;
    DBEdit_Afflink: TDBEdit;
    DBGrid_FTPSites: TDBGrid;
    DBGrid_Sessions: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox_FTPInfo: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    ImageList1: TImageList;
    ImageList_MainMenu: TImageList;
    Label1: TLabel;
    Label10: TLabel;
    lbl_RedirectPage: TLabel;
    lbl_URL: TLabel;
    lbl_LinkText: TLabel;
    lbl_Title: TLabel;
    lblAltlink: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label_TestAffLink: TLabel;
    Label_UploadComplete: TLabel;
    Label_UploadTo: TLabel;
    Label_ftpStatus: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ledit_SiteName: TLabeledEdit;
    ledit_FTP: TLabeledEdit;
    ledit_Username: TLabeledEdit;
    ledit_Password: TLabeledEdit;
    ledit_PublicFolder: TLabeledEdit;
    ledit_EventCategory: TLabeledEdit;
    MainMenu1: TMainMenu;
    Memo_LinkCodes: TMemo;
    Memo_FTPStatus: TMemo;
    MenuItemVisitGithub: TMenuItem;
    MenuItemEdit: TMenuItem;
    MenuItemPrefs: TMenuItem;
    MenuItemAbout: TMenuItem;
    MenuItemViewHelp: TMenuItem;
    MenuItemHelp: TMenuItem;
    PageControl1: TPageControl;
    RadioGroup1: TRadioGroup;
    Sbutton_AddRecordFTP: TSpeedButton;
    Sbutton_DeleteRecordFTP: TSpeedButton;
    Sbutton_EditRecordFTP: TSpeedButton;
    Sbutton_FirstRecord: TSpeedButton;
    Sbutton_FirstRecordFTP: TSpeedButton;
    Sbutton_LastRecordFTP: TSpeedButton;
    Sbutton_NextRecord: TSpeedButton;
    Sbutton_LastRecord: TSpeedButton;
    Sbutton_AddRecord: TSpeedButton;
    Sbutton_DeleteRecord: TSpeedButton;
    Sbutton_EditRecord: TSpeedButton;
    Sbutton_PriorRecordFTP: TSpeedButton;
    Sbutton_SaveSession: TSpeedButton;
    Sbutton_PriorRecord: TSpeedButton;
    Sbutton_SaveRecordFTP: TSpeedButton;
    Separator1: TMenuItem;
    Separator2: TMenuItem;
    SpinEdit1: TSpinEdit;
    SpinEdit_Port: TSpinEdit;
    SQLite3Connection1: TSQLite3Connection;
    SQLite3Connection2: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    SQLTransaction2: TSQLTransaction;
    StaticText1: TStaticText;
    StaticText_RecordAdded: TStaticText;
    StaticText_RedirectPageAdded: TStaticText;
    StaticText4: TStaticText;
    StaticTextPort: TStaticText;
    StaticText_RecordAddedFTP: TStaticText;
    StatusBar1: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Quit: TMenuItem;
    MenuItemFile: TMenuItem;
    iniSettings: TStringList;
    Timer_Cloak: TTimer;
    procedure BitBtnCloakLinkClick(Sender: TObject);
    procedure Button_CopyCookieCodeClick(Sender: TObject);
    procedure Button_CopyLinkCodesClick(Sender: TObject);
    procedure Button_FTPConnectClick(Sender: TObject);
    procedure CheckBox_GoogleTrackingChange(Sender: TObject);
    procedure ComboBox_MethodChange(Sender: TObject);
    procedure ComboBox_SpecialSettingsChange(Sender: TObject);
    procedure DBComboBox_MethodChange(Sender: TObject);
    procedure DBGrid_SessionsCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label_TestAffLinkClick(Sender: TObject);
    procedure Label_TestAffLinkMouseEnter(Sender: TObject);
    procedure Label_TestAffLinkMouseLeave(Sender: TObject);
    procedure ledit_FTPChange(Sender: TObject);
    procedure ledit_PasswordChange(Sender: TObject);
    procedure ledit_PublicFolderChange(Sender: TObject);
    procedure MenuItemAboutClick(Sender: TObject);
    procedure MenuItemPrefsClick(Sender: TObject);
    procedure MenuItemViewHelpClick(Sender: TObject);
    procedure MenuItemVisitGithubClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure QuitClick(Sender: TObject);
    procedure RadioButton_TargetBlankClick(Sender: TObject);
    procedure RadioButton_TargetNoneChange(Sender: TObject);
    procedure RadioButton_TargetTopChange(Sender: TObject);
    procedure RadioGroup1SelectionChanged(Sender: TObject);
    procedure Sbutton_AddRecordFTPMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Sbutton_AddRecordMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Sbutton_FirstRecordClick(Sender: TObject);
    procedure Sbutton_SaveRecordFTPMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SpinEdit1Change(Sender: TObject);
    procedure TabSheet2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TestAffiliateLink(test_afflink: String);
    procedure SQLQuery1FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure StartDatabase;
    procedure set_ComboBox_Method;
    procedure Timer_CloakTimer(Sender: TObject);
  private
    procedure CloakText(afflink: String);
    procedure DisableAdd_FTP;
    procedure EnableAdd_FTP;
    function FTPSend(LocalFile: string; remoteFile: string; RemoteDir: string
      ): boolean;
    procedure iniRead;
    procedure InsertFTPDB;
    procedure InsertSessionsDB;
    procedure LoadFTP_DB;
    procedure LoadSession(id: String);
    procedure LoadSession_DB;
    procedure turnOffTargetButtons;
    function ValidateFormFields: Boolean;
    procedure VisitGithub;
    procedure WriteFile(data: String);
    procedure writeJSFile(code2: String);
    function SetLinkCodeTargets: String;
    procedure ProcessLinkCodes;
    procedure turnOnTargetButtons;

  public
    test_afflink, afflink, prefix: String;
    fHost, fUserID, fPassword: String;
    javaCookie, _target, link: String;
    INI: TINIFile;
    INI_SECTION_PREFS, INI_SECTION_SESSIONS: String;
    AutoSaveSessions, GenEmbeddedCookie, ForceCookie: Bool;
    DefaultWaitTime, CloakMethod: Integer;
  const
    IniFile = 'ac.ini';
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItemViewHelpClick(Sender: TObject);
var
  URL: String;
begin
    URL:='AmazingCloaker_help.pdf';
    OpenDocument(URL);
end;

procedure TForm1.MenuItemVisitGithubClick(Sender: TObject);
begin
       VisitGithub();
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
       if PageControl1.ActivePageIndex = 1 then
          LoadFTP_DB();
         //ShowMessage('FTP Tab is Open');
end;

procedure TForm1.QuitClick(Sender: TObject);
begin
      Form1.Close;
end;

procedure TForm1.RadioButton_TargetBlankClick(Sender: TObject);
begin
     _target:= SetLinkCodeTargets;
end;

procedure TForm1.RadioButton_TargetNoneChange(Sender: TObject);
begin
  _target:= SetLinkCodeTargets;
end;

procedure TForm1.RadioButton_TargetTopChange(Sender: TObject);
begin
  _target:= SetLinkCodeTargets;
end;

procedure TForm1.RadioGroup1SelectionChanged(Sender: TObject);
begin
  _target:= SetLinkCodeTargets;
  {
     if isConsole then writeLn('target rg = Target');
     if RadioGroup1.ItemIndex = 0 then
     begin
          _target:= ' target="_blank"';
          processLinkcodes;
          exit;
     end;
     if RadioGroup1.ItemIndex = 1 then
     begin
          _target:= ' target="_top"';
          processLinkcodes;
          exit;
     end;
     if RadioGroup1.ItemIndex = 2 then
     begin
          _target:= ''; //SetLinkCodeTargets;
          processLinkcodes;
          exit;
     end; }
end;

procedure TForm1.Sbutton_AddRecordFTPMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    EnableAdd_FTP();
end;

procedure TForm1.Sbutton_AddRecordMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     // EnableAdd_Session();
end;

procedure TForm1.Sbutton_FirstRecordClick(Sender: TObject);
begin
     LoadSession_DB;
end;

procedure TForm1.Sbutton_SaveRecordFTPMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
      InsertFTPDB();
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
      if SpinEdit1.Value < 0 then SpinEdit1.Value:=0;
end;

procedure TForm1.TabSheet2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
       DisableAdd_FTP();
end;

procedure TForm1.MenuItemAboutClick(Sender: TObject);
var
  LocalFile, remoteFile, RemoteDir: string;
begin
 {  //  TestAffiliateLink('https://www.ribitus.com/search');
      LocalFile:= 'AmazingCloaker_help.pdf';
      remoteFile:= 'AmazingCloaker_help.pdf';
      RemoteDir:= 'ribitus.com';
      FTPSend(LocalFile, remoteFile, RemoteDir);    }
      About.Form2.Show;
end;

procedure TForm1.MenuItemPrefsClick(Sender: TObject);
begin
     Prefs.Form3.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     Sbutton_SaveRecordFTP.Enabled:= false;
     Sbutton_SaveSession.Enabled:= false;
     ledit_SiteName.Enabled:= false;
     ledit_FTP.Enabled:= false;
     ledit_PublicFolder.Enabled:= false;
     StaticTextPort.Enabled:= false;
     SpinEdit_Port.Enabled:= false;
     ledit_Username.Enabled:= false;
     ledit_Password.Enabled:= false;
     if not FileExists(IniFile) then
       ComboBox_Method.ItemIndex:=0;
     ComboBox_SpecialSettings.ItemIndex:=0;
     ComboBox_Extensions.ItemIndex:=0;
     INI_SECTION_PREFS:= 'PREFS';
     INI_SECTION_SESSIONS:= 'Session_Settings';
     iniRead;
     LoadSession_DB;
     set_ComboBox_Method;
     _target:= '';
     javaCookie:= '';
     RadioGroup1.ItemIndex:=0;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
     if CheckBox_GoogleTracking.Checked then
       begin
         ledit_EventCategory.Enabled:= true;
         exit;
       end;
     if not CheckBox_GoogleTracking.Checked then
       begin
         ledit_EventCategory.Enabled:= false;
         exit;
       end;
     afflink:= '';
     test_afflink:= '';
     prefix:= 'https://';
end;

procedure TForm1.iniRead();
begin
    INI:= TINIFile.Create(IniFile);
    try
        // Read values from the INI file.
        CheckBox_SaveSessions.Checked:= INI.ReadBool(INI_SECTION_PREFS,'AutoSaveSessions',false);
        CheckBox_InclCookie.Checked:= INI.ReadBool(INI_SECTION_PREFS,'GenerateEmbeddedCookie',false);
        CheckBox_ForceCookie.Checked:= INI.ReadBool(INI_SECTION_PREFS,'ForceRedirectCookie',false);
        SpinEdit1.Value:= INI.ReadInteger(INI_SECTION_PREFS,'DefaultWaitTime',0);
        ComboBox_Method.ItemIndex:= INI.ReadInteger(INI_SECTION_PREFS,'CloakMethod',0);
    finally
        INI.Free;
     end;
end;

procedure TForm1.LoadSession_DB();
begin
    StartDatabase;
     Try
       SQLQuery1.Close;
      //Use casting (Text to Varchar) in the sql query to avoid "Memo" displaying in the dbgrid for an existing Db with Text fields in the table.
      // Otherwise, when creating the db, use VARCHAR instead of TEXT when creating the fields.
     // SQLQuery1.SQL.Text:= 'SELECT CAST( "Sessions" as VARCHAR) as "Sessions", "SessionId" FROM "AffLink"';
      SQLQuery1.SQL.Text:= 'SELECT * FROM "Sessions"';
      SQLite3Connection1.Connected:= True;
      SQLTransaction1.Active:= True;
      DataSource1.DataSet:= SQLQuery1;
      DBGrid_Sessions.DataSource:= DataSource1;
      SQLQuery1.Open;
      {$IFDEF WINDOWS}
         StatusBar1.Panels.Items[1].Text:='Yay! Database loaded!';
      {$ELSE}
         StatusBar1.Panels.Items[1].Text:='Yay! Database loaded!';
         If Isconsole then writeLn('Yay! Database loaded!');
      {$ENDIF}
      except
          //   ShowMessage('Database ac.db Could not be Loaded');
     end;

     ComboBox_SpecialSettings.ItemIndex:= 0;
     set_ComboBox_Method;

     // Hide SOME DATA-GRID COLUMNS
     DBGrid_Sessions.Options := DBGrid_Sessions.Options - [dgIndicator];  // remove indicator
     DBGrid_Sessions.Columns.Items[8].Visible:= false;
     DBGrid_Sessions.Columns.Items[9].Visible:= false;
     DBGrid_Sessions.Columns.Items[10].Visible:= false;
     DBGrid_Sessions.Columns.Items[11].Visible:= false;
     DBGrid_Sessions.Columns.Items[12].Visible:= false;
     DBGrid_Sessions.Columns.Items[13].Visible:= false;
     DBGrid_Sessions.Columns.Items[14].Visible:= false;
     DBGrid_Sessions.Columns.Items[15].Visible:= false;
     DBGrid_Sessions.Columns.Items[16].Visible:= false;

end;

procedure TForm1.LoadSession(id: String);
var
  method, extension, special: longint;
begin
    Try
      SQLQuery1.Close;
      SQLQuery1.SQL.Text:= 'SELECT * FROM "Sessions" WHERE id=' + QuotedStr(id);
      SQLite3Connection1.Connected:= True;
      SQLTransaction1.Active:= True;
      DataSource1.DataSet:= SQLQuery1;
      DBGrid_Sessions.DataSource:= DataSource1;
      SQLQuery1.Open;
      {$IFDEF WINDOWS}
         StatusBar1.Panels.Items[1].Text:='Yay! Database loaded!';
      {$ELSE}
         StatusBar1.Panels.Items[1].Text:='Yay! Database loaded!';
         If Isconsole then writeLn('Yay! Database loaded from dbGrid!');
      {$ENDIF}
    except
          //   ShowMessage('Database ac.db Could not be Loaded');
    end;
     DBEdit_Afflink.DataField:= 'AffLink';
     DBEdit_Altlink.DataField:= 'AltLink';
     DBEdit_Title.DataField:= 'Title';
     DBEdit_LinkText.DataField:= 'LinkText';
     DBEdit_URL.DataField:= 'URL';
     DBEdit_SubDirectory.DataField:= 'Subfolder';
     DBEdit_RedirectPage.DataField:= 'NamePage';
     extension:= StrToInt(DBGrid_Sessions.Columns.Items[8].Field.Text);
     ComboBox_Extensions.ItemIndex:= extension;
     ComboBox_Method.ItemIndex:= StrToInt(DBGrid_Sessions.Columns.Items[9].Field.Text);
     ComboBox_SpecialSettings.ItemIndex:= StrToInt(DBGrid_Sessions.Columns.Items[10].Field.Text);
     CheckBox_InclCookie.Checked:= StrToBool(DBGrid_Sessions.Columns.Items[11].Field.Text);
     CheckBox_ForceCookie.Checked:= StrToBool(DBGrid_Sessions.Columns.Items[12].Field.Text);
     SpinEdit1.Text:= DBGrid_Sessions.Columns.Items[13].Field.Text;
     CheckBox_GoogleTracking.Checked:= StrToBool(DBGrid_Sessions.Columns.Items[14].Field.Text);
     ledit_EventCategory.Text:= DBGrid_Sessions.Columns.Items[16].Field.Text;
  //   special:= StrToInt(DBComboBox_SpecialSettings.Text);
  //   DBComboBox_SpecialSettings.ItemIndex:= special;
     set_ComboBox_Method;
     if (extension = 3) and (ComboBox_Method.ItemIndex = 1) then ComboBox_Extensions.ItemIndex:= 1; //set to .asp if Method Un-Framed
     // Hide SOME DATA-GRID COLUMNS
     DBGrid_Sessions.Options := DBGrid_Sessions.Options - [dgIndicator];  // remove indicator
     DBGrid_Sessions.Columns.Items[8].Visible:= false;
     DBGrid_Sessions.Columns.Items[9].Visible:= false;
     DBGrid_Sessions.Columns.Items[10].Visible:= false;
     DBGrid_Sessions.Columns.Items[11].Visible:= false;
     DBGrid_Sessions.Columns.Items[12].Visible:= false;
     DBGrid_Sessions.Columns.Items[13].Visible:= false;
     DBGrid_Sessions.Columns.Items[14].Visible:= false;
     DBGrid_Sessions.Columns.Items[15].Visible:= false;
     DBGrid_Sessions.Columns.Items[16].Visible:= false;
end;

procedure TForm1.LoadFTP_DB();
begin
      Try
       SQLQuery2.Close;
      //Use casting (Text to Varchar) in the sql query to avoid "Memo" displaying in the dbgrid for an existing Db with Text fields in the table.
      // Otherwise, when creating the db, use VARCHAR instead of TEXT when creating the fields.
     // SQLQuery1.SQL.Text:= 'SELECT CAST( "Sessions" as VARCHAR) as "Sessions", "SessionId" FROM "AffLink"';
      SQLQuery2.SQL.Text:= 'SELECT * FROM "FTP"';
      SQLite3Connection2.Connected:= True;
      SQLTransaction1.Active:= True;
      DataSource2.DataSet:= SQLQuery2;
      DBGrid_FTPSites.DataSource:= DataSource2;
      SQLQuery2.Open;
      {$IFDEF WINDOWS}
         StatusBar1.Panels.Items[1].Text:='Yay! Database loaded!';
      {$ELSE}
       //  StatusBar1.Panels.Items[0].Text:='Yay! Database loaded!';
         If Isconsole then writeLn('Yay! Database loaded!');
      {$ENDIF}
      except
           //  ShowMessage('Database ac.db Could not be Loaded');
     end;
end;

procedure TForm1.Label_TestAffLinkClick(Sender: TObject);
begin
     if test_afflink > '' then
       TestAffiliateLink(test_afflink);
end;

procedure TForm1.Label_TestAffLinkMouseEnter(Sender: TObject);
begin
      Label_TestAffLink.Cursor:=crHandPoint;
end;

procedure TForm1.Label_TestAffLinkMouseLeave(Sender: TObject);
begin
      Label_TestAffLink.Cursor:=crDefault;
end;

procedure TForm1.ledit_FTPChange(Sender: TObject);
begin

end;

procedure TForm1.ledit_PasswordChange(Sender: TObject);
begin

end;

procedure TForm1.ledit_PublicFolderChange(Sender: TObject);
begin

end;

procedure TForm1.CheckBox_GoogleTrackingChange(Sender: TObject);
begin
     if CheckBox_GoogleTracking.Checked then
       begin
         ledit_EventCategory.Enabled:= true;
         exit;
       end;
     if not CheckBox_GoogleTracking.Checked then
       begin
         ledit_EventCategory.Enabled:= false;
         exit;
       end;
end;

procedure TForm1.ComboBox_MethodChange(Sender: TObject);
begin
       set_ComboBox_Method;
end;

procedure TForm1.ComboBox_SpecialSettingsChange(Sender: TObject);
begin
    if ComboBox_SpecialSettings.ItemIndex = 2 then
       turnOffTargetButtons
    else
       turnOnTargetButtons;
end;

procedure TForm1.DBComboBox_MethodChange(Sender: TObject);
begin
      set_ComboBox_Method;
end;

procedure TForm1.DBGrid_SessionsCellClick(Column: TColumn);
var
  id: String;
begin
    if DBGrid_Sessions.SelectedColumn.FieldName = 'id' then
    begin
        id:= DBGrid_Sessions.Columns.Items[0].Field.Text;
        LoadSession(id);
    end;

end;


procedure TForm1.set_ComboBox_Method();
var
  index: String;
begin
   index:= ComboBox_Method.Text;
if index = 'Framed' then
  begin
    ComboBox_Extensions.Clear;
    ComboBox_Extensions.AddItem('.html', ComboBox_Extensions);
    ComboBox_Extensions.AddItem('.htm', ComboBox_Extensions);
    ComboBox_Extensions.AddItem('.php', ComboBox_Extensions);
    ComboBox_Extensions.AddItem('.asp', ComboBox_Extensions);
    ComboBox_Extensions.ItemIndex:=0;
    ComboBox_Extensions.Refresh;
    exit;
    end;
if index = 'Un-Framed' then
  begin
    // ShowMessage(ComboBox_Method.Text);
    ComboBox_Extensions.Clear;
    ComboBox_Extensions.AddItem('.php', ComboBox_Extensions);
    ComboBox_Extensions.AddItem('.asp', ComboBox_Extensions);
    ComboBox_Extensions.Refresh;
    ComboBox_Extensions.ItemIndex:=0;
    exit;
  end;
end;

procedure TForm1.Timer_CloakTimer(Sender: TObject);
begin
       StaticText_RedirectPageAdded.Visible:=false;
       Timer_Cloak.Enabled:=false;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     SQLQuery1.Close;
     SQLTransaction1.Active:= False;
     SQLite3Connection1.Connected:= False;
end;

procedure TForm1.Button_FTPConnectClick(Sender: TObject);
var
   url: String;
begin
     if ledit_FTP.Text = '' then exit;
     url:= DBEdit_URL.Text;
     if url.Contains('http://') then prefix:= 'http://' else prefix:= 'https://';
     test_afflink:= prefix + ledit_FTP.Text + '/' + ledit_PublicFolder.Text;
     Label_UploadTo.Caption:= test_afflink;
end;

procedure TForm1.BitBtnCloakLinkClick(Sender: TObject);
var
   url: String;
begin
  if ValidateFormFields = false then exit;
  Memo_LinkCodes.Clear;
  url:= DBEdit_URL.Text;
  if url.Contains('http://') then prefix:= 'http://'
  else prefix:= 'https://';
  afflink:= DBEdit_Afflink.Text;
  CloakText(afflink);
  Application.ProcessMessages;
  StaticText_RedirectPageAdded.Visible:=true;
  Timer_Cloak.Interval:=5000;
  Timer_Cloak.Enabled:=true;
end;

procedure TForm1.Button_CopyCookieCodeClick(Sender: TObject);
begin
     Clipboard.AsText:= javaCookie;
end;

procedure TForm1.Button_CopyLinkCodesClick(Sender: TObject);
begin
     Clipboard.AsText:= Memo_LinkCodes.Text;
end;

function TForm1.ValidateFormFields():Boolean;
var
   res: Boolean;
   altlink, wurl: String;
begin
     res:= true;
     afflink:= DBEdit_Afflink.Text;
     altlink:= DBEdit_Altlink.Text;
     wurl:= DBEdit_URL.Text;
     if DBEdit_Afflink.Text = '' then
       begin
       ShowMessage('Please enter Affiliate Link');
       DBEdit_Afflink.SetFocus;
       result:= false;
       exit;
       end;
     if (not afflink.StartsWith('http')) and (not afflink.StartsWith('https')) then
       begin
       ShowMessage('Invalid Affiliate Link' + sLineBreak +'Make sure it contains http:// or https://');
       DBEdit_Afflink.SetFocus;
       result:= false;
       exit;
       end;
     if (not altlink.StartsWith('http')) and (not altlink.StartsWith('https')) then
       begin
       ShowMessage('Invalid Alternate Link' + sLineBreak +'Make sure it contains http:// or https://');
       DBEdit_Altlink.SetFocus;
       result:= false;
       exit;
       end;
     if DBEdit_LinkText.Text = '' then
       begin
       ShowMessage('Please add Some Link Text');
       DBEdit_LinkText.SetFocus;
       result:= false;
       exit;
       end;
     if DBEdit_URL.Text = '' then
       begin
       ShowMessage('Please add Your Website URL');
       DBEdit_URL.SetFocus;
       result:= false;
       exit;
       end;
     if (not wurl.StartsWith('http')) and (not wurl.StartsWith('https')) then
       begin
       ShowMessage('Invalid Website Link' + sLineBreak +'Make sure it contains http:// or https://');
       DBEdit_URL.SetFocus;
       result:= false;
       exit;
       end;
     if DBEdit_RedirectPage.Text = '' then
       begin
       ShowMessage('Please Name Your Redirect Page');
       DBEdit_RedirectPage.SetFocus;
       result:= false;
       exit;
       end;
     result:= res;
end;

procedure TForm1.ProcessLinkCodes();
var
   outgoingLink, code3, visLinkTxt: String;
   index: integer;
begin
    Memo_LinkCodes.Clear;
     visLinkTxt:= DBEdit_LinkText.Text;
     if isConsole then writeln('_target = ' + _target);
     if CheckBox_GoogleTracking.Checked then
     begin
        if RadioGroup1.ItemIndex = 2 then //Target None checked
           outgoingLink:= ' onClick="that=this;_gaq.push([''_trackEvent'',''' + ledit_EventCategory.Text + ''',''clicks'',this.href]);" '
        else
            outgoingLink:= ' onClick="that=this;_gaq.push([''_trackEvent'',''' + ledit_EventCategory.Text + ''',''clicks'',that.href]);setTimeout(function() { location.href=that.href }, 200);return false;" '
     end else
         outgoingLink:= '';
      javaCookie:= sLineBreak + '<script type="text/javascript" src="' + DBEdit_URL.Text + '/js/' + DBEdit_RedirectPage.Text + '.js"></script>';
      index:= ComboBox_SpecialSettings.ItemIndex;
         Case index of
           1: if CheckBox_InclCookie.Checked or CheckBox_ForceCookie.Checked then
                 code3:= '<a href="' + link + '"' + outgoingLink + _target + '> insert your img tag here </a>' + javaCookie
               else
                 code3:= '<a href="' + link + '"' + outgoingLink + _target + '> insert your img tag here </a>';
           2: code3:= link;
               else
                 if CheckBox_InclCookie.Checked or CheckBox_ForceCookie.Checked then
                    code3:= '<a href="' + link + '"' + outgoingLink + _target + '>' + visLinkTxt + '</a>' + javaCookie
                 else
                    code3:= '<a href="' + link + '"' + outgoingLink + _target + '>' + visLinkTxt + '</a>';
         end;
      Application.ProcessMessages;
      Memo_LinkCodes.Lines.AddText(code3);
end;

function TForm1.SetLinkCodeTargets():String;
begin
  if ComboBox_SpecialSettings.ItemIndex = 2 then
  begin
       RadioGroup1.ItemIndex:= 2;  // target="_none" is selected
       turnOffTargetButtons;
       _target:= '';
       result:= _target;
       exit;
  end;
  if isConsole then writeln('2 _target = ' + _target);

  if RadioGroup1.Enabled = false then
  begin
    turnOnTargetButtons
  end else begin
    if RadioGroup1.ItemIndex = 0 then
    begin
        _target:= ' target="_blank"';
        ProcessLinkCodes;
        result:= _target;
        exit;
    end;

    if RadioGroup1.ItemIndex = 1 then
    begin
        _target:= ' target="_top"';
        ProcessLinkCodes;
        result:= _target;
        exit;
    end;

    if RadioGroup1.ItemIndex = 2 then
    begin
      _target:= '';
      ProcessLinkCodes;
      result:= _target;
      exit;
    end;

  end;
  result:= _target;
end;

procedure TForm1.turnOffTargetButtons();
begin
     RadioGroup1.Enabled:= false;
end;

procedure TForm1.turnOnTargetButtons();
begin
     RadioGroup1.Enabled:= true;
end;

procedure TForm1.CloakText(afflink: String);
var
   x,i: integer;
   cloakedStr, data, encoded_js, encoded_cookie, code1, code2, code1a, timeout, cookieData, subfolder: String;
begin
    if afflink = '' then exit;
    cloakedStr:= '';
    encoded_js:= '';
    encoded_cookie:= '';
    timeout:= IntToStr(SpinEdit1.Value);
    cookieData:= '<img src="' + afflink + '" height="1" width="1" border="0">';
    subfolder:= DBEdit_SubDirectory.Text + '/';
    if subfolder = '' then
        link:= DBEdit_URL.Text + subfolder
    else
        link:= DBEdit_URL.Text + '/' + subfolder;
    if DBEdit_AltLink.Text = '' then
        afflink:= DBEdit_AffLink.Text;
    if DBEdit_AltLink.Text > '' then
        afflink:= DBEdit_AltLink.Text;
    // Encode Affiliate Link and Javascript
    for x:= 1 to length(afflink) do
    begin
       cloakedStr:= cloakedStr + '&#' + ord(afflink[x]).ToString() + ';';
       encoded_js:= encoded_js + '&#' + ord(afflink[x]).ToString() + ';';
    end;
    // Encode Cookie Code
    for i:= 1 to length(afflink) do
    begin
       encoded_cookie:= encoded_cookie + '#' + ord(cookieData[x]).ToString() + ';';
    end;
    code1:= '";setTimeout("timed_Redir()", ' + timeout + '*1000 );}function timed_Redir(){checkCookie("ac");}ye_days = 1;function bake(days){var today = new Date();var exp = new Date(today.getTime() + days*24*60*60*1000);return  exp.toGMTString();}function checkCookie(cookieName){    var begin = document.cookie.indexOf(cookieName);if (begin == -1){document.cookie = "ac_info=true; expires=" + bake(ye_days);window.location.href=afflink;} else {return false;}}' + DBEdit_RedirectPage.Text + '();';
    code1a:= 'setTimeout("timed_Redir()", ' + timeout + '*1000 );function timed_Redir(){checkCookie("ac");}ye_days = 1;function bake(days){var today = new Date();var exp = new Date(today.getTime() + days*24*60*60*1000);return  exp.toGMTString();}function checkCookie(cookieName){    var begin = document.cookie.indexOf(cookieName);if (begin == -1){document.cookie = "ac_info=true; expires=" + bake(ye_days);' + DBEdit_RedirectPage.Text + '();} else {return false;}}';

    if CheckBox_ForceCookie.Checked then
            code2:= 'function ' + DBEdit_RedirectPage.Text + '() {code="' + encoded_cookie + '";document.write(unescape(code.replace(/#/g,"%")));' + 'afflink="' + afflink + code1
    else
            code2:= 'function ' + DBEdit_RedirectPage.Text + '() {code="' + encoded_cookie + '";document.write(unescape(code.replace(/#/g,"%")));}' + code1a;
    if (CheckBox_InclCookie.Checked) or (CheckBox_ForceCookie.Checked ) then
            writeJSFile(code2);
    _target:= SetLinkCodeTargets;
    ProcessLinkCodes;
    // Un-Framed and .php selected
        if (ComboBox_Method.ItemIndex = 1) and (ComboBox_Extensions.Items.ValueFromIndex[ComboBox_Extensions.ItemIndex] = '.php') then
        begin
          data:= '<?php' + sLineBreak + 'header("Location: ' + afflink + '");' + sLineBreak + 'exit;' + sLineBreak + '?>';
          WriteFile(data);
          exit;
        end;

        // Un-Framed and .asp selected
        if (ComboBox_Method.ItemIndex = 1) and (ComboBox_Extensions.Items.ValueFromIndex[ComboBox_Extensions.ItemIndex] = '.asp') then
        begin
          data:= '<%' + sLineBreak + 'Response.Redirect "' + afflink + '"' + sLineBreak + '%>';
          WriteFile(data);
          exit;
        end;

        // Framed and .php selected
        if (ComboBox_Method.ItemIndex = 0) and (ComboBox_Extensions.Items.ValueFromIndex[ComboBox_Extensions.ItemIndex] = '.php') then
        begin
          data:= '<? php' + sLineBreak + '?>' + sLineBreak + '<!-- #### This is protected page source and you are in an unauthorized view.  You must close this window now. #### -->' +
          sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+
          sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+
          sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+
          '<HTML><HEAD><script>window.status=" ";</script><title>' + DBEdit_Title.Text + '</title>' + sLineBreak +
          '<frameset rows="0,*\" cols="*" frameborder=0 framespacing=0> ' + encoded_js + sLineBreak + '<frame src=""><frame src="' + cloakedStr + '"></frameset><noframes><body bgcolor="#FFFFFF" text="#000000"></body></noframes></HEAD></HTML>';
          WriteFile(data);
          exit;
        end;

        // Framed and .asp selected
        if (ComboBox_Method.ItemIndex = 0) and (ComboBox_Extensions.Items.ValueFromIndex[ComboBox_Extensions.ItemIndex] = '.asp') then
        begin
          data:= ' <%' + sLineBreak + '%>' + sLineBreak + '<!-- #### This is protected page source and you are in an unauthorized view.  You must close this window now. #### -->' +
          sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+
          sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+
          sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+
          '<HTML><HEAD><script>window.status=" ";</script><title>' + DBEdit_Title.Text + '</title>' + sLineBreak + '<frameset rows="0,*" cols="*" frameborder=0 framespacing=0> ' + encoded_js + sLineBreak +
          '<frame src=""><frame src="' + afflink + '"></frameset><noframes><body bgcolor="#FFFFFF" text="#000000"></body></noframes></HEAD></HTML>';
          WriteFile(data);
          exit;
        end;
    // Framed and .html selected
    if (ComboBox_Method.ItemIndex = 0) and (ComboBox_Extensions.Items.ValueFromIndex[ComboBox_Extensions.ItemIndex] = '.html') then
      begin
          data:= '';
          data:= '<!-- #### This is protected page source and you are in an unauthorized view.  You must close this window now. #### -->' +
          sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+
          sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+
          sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+
          '<HTML><HEAD><script>window.status=" "' +
          '</script><title>' + DBEdit_Title.Text + '</title>' + sLineBreak + '<frameset rows="0,*" cols="*" frameborder=0 framespacing=0>'+ encoded_js + sLineBreak + '<frame src=""><frame src="' + cloakedStr + '">' +
          '</frameset><noframes><body bgcolor="#FFFFFF" text="#000000"></body></noframes></HEAD></HTML>';
          WriteFile(data);
          exit;
      end;
    // Framed and .htm selected
    if (ComboBox_Method.ItemIndex = 0) and (ComboBox_Extensions.Items.ValueFromIndex[ComboBox_Extensions.ItemIndex] = '.htm') then
      begin
          data:= '';
          data:= '<!-- #### This is protected page source and you are in an unauthorized view.  You must close this window now. #### -->' +
          sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+
          sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+
          sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+sLineBreak+
          '<HTML><HEAD><script>window.status=" "' +
          '</script><title>' + DBEdit_Title.Text + '</title>' + sLineBreak + '<frameset rows="0,*" cols="*" frameborder=0 framespacing=0>'+ encoded_js + sLineBreak + '<frame src=""><frame src="' + cloakedStr + '">' +
          '</frameset><noframes><body bgcolor="#FFFFFF" text="#000000"></body></noframes></HEAD></HTML>';
          WriteFile(data);
          exit;
      end;
end;

procedure TForm1.WriteFile(data: String);
var
   yeFile: Text;
   filename: String;
begin
  filename:= DBEdit_RedirectPage.Text + ComboBox_Extensions.Text;
  AssignFile(yeFile, filename);
  Rewrite(yeFile);
  WriteLn(yeFile, data);
  CloseFile(yeFile);
end;

procedure TForm1.writeJSFile(code2: String);
var
   jsFile: Text;
   filename: String;
begin
  filename:= DBEdit_RedirectPage.Text + '.js';
  AssignFile(jsFile, filename);
  Rewrite(jsFile);
  WriteLn(jsFile, code2);
  CloseFile(jsFile);
end;

procedure TForm1.TestAffiliateLink(test_afflink: String);
var
  v: THTMLBrowserHelpViewer;
  BrowserPath, BrowserParams: string;
  p: LongInt;
  URL: String;
  BrowserProcess: TProcessUTF8;
begin
  if test_afflink = '' then exit;
  v:=THTMLBrowserHelpViewer.Create(nil);
  try
    v.FindDefaultBrowser(BrowserPath,BrowserParams);
    debugln(['Path=',BrowserPath,' Params=',BrowserParams]);

    p:=System.Pos('%s', BrowserParams);
    System.Delete(BrowserParams,p,2);
    System.Insert(test_afflink,BrowserParams,p);

    // start browser
    BrowserProcess:=TProcessUTF8.Create(nil);
    try
      BrowserProcess.ParseCmdLine(BrowserPath+' '+BrowserParams);
      BrowserProcess.Execute;
    finally
      BrowserProcess.Free;
    end;
  finally
    v.Free;
  end;
end;

procedure TForm1.VisitGithub();
var
  v: THTMLBrowserHelpViewer;
  BrowserPath, BrowserParams: string;
  p: LongInt;
  URL: String;
  BrowserProcess: TProcessUTF8;
begin
  URL:='https://github.com/goHighMarketing/AmazingCloaker';
  v:=THTMLBrowserHelpViewer.Create(nil);
  try
    v.FindDefaultBrowser(BrowserPath,BrowserParams);
    debugln(['Path=',BrowserPath,' Params=',BrowserParams]);

    p:=System.Pos('%s', BrowserParams);
    System.Delete(BrowserParams,p,2);
    System.Insert(URL,BrowserParams,p);

    // start browser
    BrowserProcess:=TProcessUTF8.Create(nil);
    try
      BrowserProcess.ParseCmdLine(BrowserPath+' '+BrowserParams);
      BrowserProcess.Execute;
    finally
      BrowserProcess.Free;
    end;
  finally
    v.Free;
  end;
end;

procedure TForm1.EnableAdd_FTP();
begin
     Sbutton_SaveRecordFTP.Enabled:= true;
     ledit_SiteName.Enabled:= true;
     ledit_FTP.Enabled:= true;
     ledit_PublicFolder.Enabled:= true;
     StaticTextPort.Enabled:= true;
     SpinEdit_Port.Enabled:= true;
     ledit_Username.Enabled:= true;
     ledit_Password.Enabled:= true;
end;

procedure TForm1.DisableAdd_FTP();
begin
     Sbutton_SaveRecordFTP.Enabled:= false;
     ledit_SiteName.Enabled:= false;
     ledit_FTP.Enabled:= false;
     ledit_PublicFolder.Enabled:= false;
     StaticTextPort.Enabled:= false;
     SpinEdit_Port.Enabled:= false;
     ledit_Username.Enabled:= false;
     ledit_Password.Enabled:= false;
     LoadFTP_DB();
end;

procedure TForm1.StartDatabase;
var
   createTables:boolean;
begin
  {$IFDEF UNIX}  // Linux
       sqlite3dyn.SQLiteDefaultLibrary := 'libsqlite3.so';
  {$ENDIF}
  {$IFNDEF DARWIN}  // Mac
       sqlite3dyn.SQLiteDefaultLibrary := 'libsqlite3.so';
  {$ENDIF}

  {$IFDEF WINDOWS} // Windows
       sqlite3dyn.SQLiteDefaultLibrary := 'sqlite3.dll';
  {$ENDIF}

  SQLite3Connection1.DatabaseName:= Application.Location + 'ac.db';

//  if not DirectoryExists(GetAppConfigDir(false)) then  // Check if config directory exists
//    MkDir(GetAppConfigDir(false));                // if not: create it

  createTables := not FileExists(SQLite3Connection1.DatabaseName); // no file = create new tables

  SQLite3Connection1.Open;
  SQLTransaction1.Active:=true;

  if createTables then
    begin
      SQLite3Connection1.ExecuteDirect('CREATE TABLE "Sessions"('+
                    ' "id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,'+
                    ' "AffLink" Varchar,'+
                    ' "AltLink" Varchar,'+
                    ' "LinkText" Varchar,'+
                    ' "Title" Varchar,'+
                    ' "URL" Varchar,'+
                    ' "Subfolder" Varchar,'+
                    ' "NamePage" Varchar,'+
                    ' "Extension" Varchar,'+
                    ' "Method" Varchar,'+
                    ' "Special" Varchar,'+
                    ' "IncludeCookie" Varchar,'+
                    ' "SuperCookie" Varchar,'+
                    ' "Timeout" Varchar,'+
                    ' "GATracking" Varchar,'+
                    ' "WordPress" Varchar,'+
                    ' "GACategory" Varchar);');

      SQLite3Connection1.ExecuteDirect('CREATE TABLE "FTP"('+
                    ' "FTPId" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,'+
                    ' "SiteName" Varchar,'+
                    ' "HostName" Varchar,'+
                    ' "PubFolder" Varchar,'+
                    ' "Port" Varchar,'+
                    ' "Username" Varchar,'+
                    ' "Password" Varchar);');

      SQLTransaction1.Commit;
    end;

end;

procedure TForm1.InsertFTPDB();
var
  sitename, ftp, publicFolder, port, username, password: String;
  begin
    SQLQuery2.close;
    SQLQuery2.SQL.clear;
    sitename:= ledit_SiteName.Text;
    ftp:= ledit_FTP.Text;
    publicFolder:= ledit_PublicFolder.Text;
    port:= SpinEdit_Port.Text;
    username:= ledit_Username.Text;
    password:= ledit_Password.Text;
    if sitename = '' then begin Application.MessageBox('Input Error: You forgot to Enter a Site Name', 'Empty Field Site Name', MB_ICONWARNING); ledit_SiteName.SetFocus; exit; end;
    if ftp = '' then begin Application.MessageBox('Input Error: You forgot to Enter an FTP Address', 'Empty Field Host Address', MB_ICONWARNING); ledit_FTP.SetFocus; exit; end;
    if username = '' then begin Application.MessageBox('Input Error: You forgot to Enter a User Name', 'Empty Field User Name', MB_ICONWARNING); ledit_Username.SetFocus; exit; end;
    if password = '' then begin Application.MessageBox('Input Error: You forgot to Enter a Password', 'Empty Field Password', MB_ICONWARNING); ledit_Password.SetFocus; exit; end;
    SQLQuery2.close;
    SQLQuery2.SQL.Add('INSERT INTO FTP (SiteName, HostName, PubFolder, Port, Username, Password)VALUES(:SITENME,:HOSTNME, :PUBFOLDER, :PORT, :USERNME, :PASSWD)');   //inserts data into the deck table
    SQLQuery2.Params.ParamByName('SITENME').AsString:=sitename;   //inserts a friendly site name
    SQLQuery2.Params.ParamByName('HOSTNME').AsString:=ftp;    // inserts the ftp host address
    SQLQuery2.Params.ParamByName('PUBFOLDER').AsString:=publicFolder;    //inserts the public folder name
    SQLQuery2.Params.ParamByName('PORT').AsString:=port;       //inserts the port
    SQLQuery2.Params.ParamByName('USERNME').AsString:=username;    //inserts the user name
    SQLQuery2.Params.ParamByName('PASSWD').AsString:=password;   // inserts the password
    SQLQuery2.execSQL;
    SQLTransaction2.Commit;
    SQLTransaction2.action:= caCommit;
    SQLite3Connection2.Open;
    SQLTransaction2.Active:=true;
    DisableAdd_FTP();
  end;

procedure TForm1.InsertSessionsDB;
begin

end;


function TForm1.FTPSend(LocalFile : string; remoteFile : string; RemoteDir : string) : boolean;
//===========================================================================
//     **********************************************************************
//     * Send a file to the FTP server                                      *
//     **********************************************************************
//---------------------------------------------------------------------------
var
   rc : boolean;
   FTPClient: TFTPSend;
begin
   // Create the FTP Client object and set the FTP parameters
   FTPClient := TFTPSend.Create;
   with FTPClient do begin
      TargetPort  := cFtpProtocol;
      TargetHost := fHost;  // these were properties set somewhere else
      UserName := fUserID;
      Password := fPassword;
      //-----------------------------------------------------------------------
      // bail out if the FTP connect fails
      if not LogIn then exit;
      //------------------------------------------------------------------------

      // Set filename to FTP
      DirectFileName := LocalFile;
      DirectFile := True;
      //------------------------------------------------------------------------

      // change directory if requested
      if RemoteDir <> '' then ChangeWorkingDir(RemoteDir);
      //------------------------------------------------------------------------

      // STOR file to FTP server.
      rc := StoreFile(RemoteFile,false);
      //------------------------------------------------------------------------

      // close the connection
      LogOut;
      //------------------------------------------------------------------------
      // free the FTP client object
      free;
      //------------------------------------------------------------------------
   end;
   Result := rc;
//===========================================================================
end;

procedure TForm1.SQLQuery1FilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
 // Accept := Pos(UpperCase(Edit1.Text), UpperCase(DataSet.FieldByName('Sessions').AsString)) > 0;
end;

end.

