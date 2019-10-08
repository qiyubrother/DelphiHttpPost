unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    IdHTTP1: TIdHTTP;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  ParamList: TStringList;
  ss: TStringStream;
  url: string;
begin
  ss := TStringStream.Create('', TEncoding.UTF8);
  IdHTTP1 := TIdHTTP.Create();
  ParamList := TStringList.Create;
  try
    { 参数部分.根据实际情况替换. }
    ParamList.Add('LoginName=xx');
    ParamList.Add('Password=xx');
    ParamList.Add('SmsKind=808');
    ParamList.Add('ExpSmsId=888');
    url := 'http://xxxxxxxxxx/SmsService.asmx/SendEx';

    IdHTTP1.Post(url, ParamList, ss);
    Memo1.Text := ss.DataString;
  finally
    ss.Free;
    IdHTTP1.Free;
    ParamList.Free;
  end;
end;

end.
