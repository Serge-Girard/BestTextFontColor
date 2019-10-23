program ProjectColorFont;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitColorFont in 'UnitColorFont.pas' {Form64};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm64, Form64);
  Application.Run;
end.
