unit UnitColorFont;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, FMX.Colors, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo;

type
  TForm64 = class(TForm)
    RectangleTest: TRectangle;
    TextTest: TText;
    CouleurFond: TComboColorBox;
    BindingsList1: TBindingsList;
    LinkControlToPropertyFillColor: TLinkControlToProperty;
    CouleurTexte: TComboColorBox;
    LinkControlToPropertyColor: TLinkControlToProperty;
    Delta: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure CouleurFondChange(Sender: TObject);
    procedure DeltaTracking(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form64: TForm64;

implementation

{$R *.fmx}
uses System.UIConsts, System.Math;

procedure TForm64.CouleurFondChange(Sender: TObject);

function TextColor(const BackGround: TAlphaColor; const Delta: Single = 0.3;
  const TextColor : TAlphaColor = TAlphacolorRec.Black;
  const ReverseColor: TAlphaColor = TAlphacolorRec.White): TAlphaColor;
var H,S,L : single;
    D,TextS,TextL : single;

begin
  D:=Delta;
  if D>0.5 then D:=0.5;
  if D<0 then D:=0;

  // Couleur Texte
  RGBToHSL(TextColor,H,TextS,TextL);

  RGBtoHSL(BackGround,H, S, L);
  if (L>Max(D+TextL,0))
  OR ((S>D/2+TextS) AND (S<D/2-TextS))
    then result:=TextColor
    else Result:=ReverseColor;
end;

begin
 TextTest.TextSettings.FontColor:=TextColor(RectangleTest.Fill.Color,Delta.Value/100,CouleurTexte.Color);
end;

procedure TForm64.DeltaTracking(Sender: TObject);
begin
CouleurFondChange(Sender)
end;

end.
