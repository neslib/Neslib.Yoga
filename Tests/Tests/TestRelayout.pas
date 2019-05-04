unit TestRelayout;

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestRelayout = class
  public
    [Test] procedure RecalculateResolvedDimensionOnChange;
  end;

implementation

{ TTestRelayout }

procedure TTestRelayout.RecalculateResolvedDimensionOnChange;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;

  RootChild0 := TYogaNode.Create;
  RootChild0.MinHeight := 10;
  RootChild0.MaxHeight := 10;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  RootChild0.MinHeight := YOGA_UNDEFINED;
  Root.CalculateLayout(TYogaDirection.LTR);
  Assert.AreEqual<Single>(0, RootChild0.LayoutHeight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestRelayout);

end.
