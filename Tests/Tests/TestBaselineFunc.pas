unit TestBaselineFunc;

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestBaselineFunc = class
  private
    FBaselineValue: Single;
    function DoBaseline(const ANode: TYogaNode; const AWidth,
      AHeight: Single): Single;
  public
    [Test] procedure AlignBaselineCustomerFunc;
  end;

implementation

{ TTestBaselineFunc }

procedure TTestBaselineFunc.AlignBaselineCustomerFunc;
var
  Root, RootChild0, RootChild1, RootChild1Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 20;
  Root.Add(RootChild1);

  FBaselineValue := 10;
  RootChild1Child0 := TYogaNode.Create;
  RootChild1Child0.Width := 50;
  RootChild1Child0.OnBaseline := DoBaseline;
  RootChild1Child0.Height := 20;
  RootChild1.Add(RootChild1Child0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(40, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1.LayoutHeight);

  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1Child0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1Child0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild1Child0.LayoutHeight);

  Root.Free;
end;

function TTestBaselineFunc.DoBaseline(const ANode: TYogaNode; const AWidth,
  AHeight: Single): Single;
begin
  Result := FBaselineValue;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestBaselineFunc);

end.
