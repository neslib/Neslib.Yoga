unit TestComputedMargin;

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestComputedMargin = class
  public
    [Test] procedure ComputedLayoutMargin;
  end;

implementation

{ TTestComputedMargin }

procedure TTestComputedMargin.ComputedLayoutMargin;
var
  Root: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;
  Root.MarginStart := TYogaValue.Percent(10);

  Root.CalculateLayout(100, 100, TYogaDirection.LTR);

  Assert.AreEqual<Single>(10, Root.LayoutMarginLeft);
  Assert.AreEqual<Single>(0, Root.LayoutMarginRight);

  Root.CalculateLayout(100, 100, TYogaDirection.RTL);

  Assert.AreEqual<Single>(0, Root.LayoutMarginLeft);
  Assert.AreEqual<Single>(10, Root.LayoutMarginRight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestComputedMargin);

end.
