unit helpunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

type
  Thelp = class(TForm)
    RichEdit1: TRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  help: Thelp;

implementation

uses Uasos;

{$R *.dfm}

procedure Thelp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Main.show;
end;



end.
