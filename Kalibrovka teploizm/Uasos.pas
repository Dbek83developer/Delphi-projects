unit Uasos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, XPMan, jpeg;

type
  Tmain = class(TForm)
    MainMenu1: TMainMenu;
    a1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Help1: TMenuItem;
    Button1: TButton;
    Image1: TImage;
    procedure N4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
   // procedure FormClose(Sender: TObject; var Action: TCloseAction);
  //  procedure Button2Click(Sender: TObject);
   // procedure bb_okClick(Sender: TObject);





  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  main: Tmain;
  min,max,a:real;
  p,buf:string;
implementation

uses datamoduleunit, sort, helpunit;

{$R *.dfm}

procedure Tmain.Help1Click(Sender: TObject);
begin
main.Hide;
help.showmodal;
end;

procedure Tmain.N4Click(Sender: TObject);
begin
close;
end;








procedure Tmain.Button1Click(Sender: TObject);
begin
   main.Hide;
   setka.ShowModal;
 end;




end.
