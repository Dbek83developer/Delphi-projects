program Kalibrovka;

uses
  Forms,
  sort in 'sort.pas' {setka},
  Uasos in 'Uasos.pas' {main},
  datamoduleunit in 'datamoduleunit.pas' {dm2: TDataModule},
  helpunit in 'helpunit.pas' {help};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'MNK ESAN"';
  Application.CreateForm(Tmain, main);
  Application.CreateForm(Tsetka, setka);
  Application.CreateForm(Tdm2, dm2);
  Application.CreateForm(Thelp, help);
  Application.Run;
end.
