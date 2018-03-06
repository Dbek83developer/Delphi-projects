program ik;

uses
  Forms,
  Unit1 in 'Unit1.pas' {TM_RET},
  datamoduleunit in 'datamoduleunit.pas' {dm2: TDataModule},
  Uasos in 'Uasos.pas' {main},
  maindb in 'maindb.pas' {dbform},
  sort in 'sort.pas' {setka},
  bd in 'bd.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'IK 1.0.1';
  Application.CreateForm(Tmain, main);
  Application.CreateForm(TTM_RET, TM_RET);
  Application.CreateForm(Tdbform, dbform);
  Application.CreateForm(Tdm2, dm2);
  Application.CreateForm(Tforma, forma);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
