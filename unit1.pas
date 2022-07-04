unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SQLite3Conn, SQLDB, DB, Forms, Controls, Graphics, Dialogs,
  Menus, LCLProc, LCLType, LazHelpHTML, UTF8Process, LCLIntf, ComCtrls, ExtCtrls,
  StdCtrls, Buttons, DBGrids, CheckLst, Spin, ftpsend, About, Prefs, IniFiles,
  Sqlite3dyn, FileUtil;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtnCloakLink: TBitBtn;
    Button_CopyLinkCodes: TButton;
    Button_CopyCookieCode: TButton;
    Button_FTPConnect: TButton;
    CheckBox_SaveSessions: TCheckBox;
    CheckBox_GoogleTracking: TCheckBox;
    CheckListBox1: TCheckListBox;
    ComboBox_Extensions: TComboBox;
    ComboBox_SpecialSettings: TComboBox;
    ComboBox_Method: TComboBox;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid_FTPSites: TDBGrid;
    DBGrid_Sessions: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox_FTPInfo: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    ImageList1: TImageList;
    ImageList_MainMenu: TImageList;
    Label1: TLabel;
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
    ledit_afflink: TLabeledEdit;
    ledit_altlink: TLabeledEdit;
    ledit_Title: TLabeledEdit;
    ledit_LinkText: TLabeledEdit;
    ledit_WebsiteURL: TLabeledEdit;
    ledit_RedirectPage: TLabeledEdit;
    ledit_SubDirectory: TLabeledEdit;
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
    RadioButton_TargetBlank: TRadioButton;
    RadioButton_TargetTop: TRadioButton;
    RadioButton_TargetNone: TRadioButton;
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
    procedure BitBtnCloakLinkClick(Sender: TObject);
    procedure Button_FTPConnectClick(Sender: TObject);
    procedure CheckBox_GoogleTrackingChange(Sender: TObject);
    procedure ComboBox_MethodChange(Sender: TObject);
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
    procedure Sbutton_AddRecordFTPMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Sbutton_AddRecordMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Sbutton_SaveRecordFTPMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SpinEdit1Change(Sender: TObject);
    procedure TabSheet2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TestAffiliateLink(test_afflink: String);
    procedure SQLQuery1FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure StartDatabase;
  private
    procedure DisableAdd_FTP;
    procedure EnableAdd_FTP;
    function FTPSend(LocalFile: string; remoteFile: string; RemoteDir: string
      ): boolean;
    procedure iniRead;
    procedure InsertFTPDB;
    procedure InsertSessionsDB;
    procedure LoadFTP_DB;
    procedure VisitGithub;

  public
    test_afflink, afflink, prefix: String;
    fHost, fUserID, fPassword: String;
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
     if not FileExists('ac.ini') then
       ComboBox_Method.ItemIndex:=0;
     ComboBox_SpecialSettings.ItemIndex:=0;
     INI_SECTION_PREFS:= 'PREFS';
     INI_SECTION_SESSIONS:= 'Session_Settings';
     iniRead;
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
    INI:= TINIFile.Create(Application.Location + IniFile);
    try
        // Read values from the INI file.
        CheckBox_SaveSessions.Checked:= INI.ReadBool(INI_SECTION_PREFS,'AutoSaveSessions',true);
        CheckListBox1.Checked[0]:= INI.ReadBool(INI_SECTION_PREFS,'GenerateEmbeddedCookie',true);
        CheckListBox1.Checked[1]:= INI.ReadBool(INI_SECTION_PREFS,'ForceRedirectCookie',true);
        SpinEdit1.Value:= INI.ReadInteger(INI_SECTION_PREFS,'DefaultWaitTime',0);
        ComboBox_Method.ItemIndex:= INI.ReadInteger(INI_SECTION_PREFS,'CloakMethod',0);
    finally
        INI.Free;
     end;
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
var
  index: Integer;
begin
    index:= ComboBox_Method.ItemIndex;
    if index = 1 then
      begin
        ComboBox_Extensions.Clear;
        ComboBox_Extensions.AddItem('.php', ComboBox_Extensions);
        ComboBox_Extensions.AddItem('.asp', ComboBox_Extensions);
        ComboBox_Extensions.ItemIndex:=0;
        exit;
      end;
    if index = 0 then
      begin
        ComboBox_Extensions.Clear;
        ComboBox_Extensions.AddItem('.html', ComboBox_Extensions);
        ComboBox_Extensions.AddItem('.htm', ComboBox_Extensions);
        ComboBox_Extensions.AddItem('.php', ComboBox_Extensions);
        ComboBox_Extensions.AddItem('.asp', ComboBox_Extensions);
        ComboBox_Extensions.ItemIndex:=0;
      end;
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
     url:= ledit_WebsiteURL.Text;
     if url.Contains('http://') then prefix:= 'http://' else prefix:= 'https://';
     test_afflink:= prefix + ledit_FTP.Text + '/' + ledit_PublicFolder.Text;
     Label_UploadTo.Caption:= test_afflink;
end;

procedure TForm1.BitBtnCloakLinkClick(Sender: TObject);
var
   url: String;
begin
  url:= ledit_WebsiteURL.Text;
  if url.Contains('http://') then prefix:= 'http://'
  else prefix:= 'https://';
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
    {$IFNDEF DARWIN}  // Mac
       sqlite3dyn.SQLiteDefaultLibrary := './libsqlite3.so';
    {$ENDIF}
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

