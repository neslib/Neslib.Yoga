unit TestInfiniteHeight;

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestInfiniteHeight = class
  public
    [Test] procedure PercentAbsolutePositionInfiniteHeight;
  end;

implementation

{ TTestInfiniteHeight }

procedure TTestInfiniteHeight.PercentAbsolutePositionInfiniteHeight;
var
  Root, RootChild0, RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 300;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 300;
  RootChild0.Height := 300;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.PositionType := TYogaPositionType.Absolute;
  RootChild1.Left := TYogaValue.Percent(20);
  RootChild1.Top := TYogaValue.Percent(20);
  RootChild1.Width := TYogaValue.Percent(20);
  RootChild1.Height := TYogaValue.Percent(20);
  Root.Add(RootChild1);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(300, Root.LayoutWidth);
  Assert.AreEqual<Single>(300, Root.LayoutHeight);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(300, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(300, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(60, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(60, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild1.LayoutHeight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestInfiniteHeight);

end.
