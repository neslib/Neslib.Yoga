unit TestComputedPadding;

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestComputedPadding = class
  public
    [Test] procedure ComputedLayoutPadding;
  end;

implementation

{ TTestComputedPadding }

procedure TTestComputedPadding.ComputedLayoutPadding;
var
  Root: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;
  Root.PaddingStart := TYogaValue.Percent(10);

  Root.CalculateLayout(100, 100, TYogaDirection.LTR);

  Assert.AreEqual<Single>(10, Root.LayoutPaddingLeft);
  Assert.AreEqual<Single>(0, Root.LayoutPaddingRight);

  Root.CalculateLayout(100, 100, TYogaDirection.RTL);

  Assert.AreEqual<Single>(0, Root.LayoutPaddingLeft);
  Assert.AreEqual<Single>(10, Root.LayoutPaddingRight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestComputedPadding);

end.
