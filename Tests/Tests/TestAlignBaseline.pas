unit TestAlignBaseline;

interface

uses
  System.Types,
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestAlignBaseline = class
  private
    function DoMeasure1(const ANode: TYogaNode; const AWidth: Single;
      const AWidthMode: TYogaMeasureMode; const AHeight: Single;
      const AHeightMode: TYogaMeasureMode): TSizeF;
    function DoMeasure2(const ANode: TYogaNode; const AWidth: Single;
      const AWidthMode: TYogaMeasureMode; const AHeight: Single;
      const AHeightMode: TYogaMeasureMode): TSizeF;
    function DoBaseline(const ANode: TYogaNode; const AWidth,
      AHeight: Single): Single;
  public
    [Test] procedure AlignBaselineParentNotSpecified;
    [Test] procedure AlignBaselineWithNoParent;
    [Test] procedure AlignBaselineWithNoBaselineFuncAndNoParent;
  end;

implementation

{ TTestAlignBaseline }

procedure TTestAlignBaseline.AlignBaselineParentNotSpecified;
var
  Root, RootChild0, RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignContent := TYogaAlign.Stretch;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.Width := 340;
  Root.MaxHeight := 170;
  Root.MinHeight := 0;

  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 0;
  RootChild0.FlexShrink:= 1;
  RootChild0.OnMeasure := DoMeasure1;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 0;
  RootChild1.FlexShrink:= 1;
  RootChild1.OnMeasure := DoMeasure2;
  Root.Add(RootChild1);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(340, Root.LayoutWidth);
  Assert.AreEqual<Single>(126, Root.LayoutHeight);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(42, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(76, RootChild0.LayoutTop);

  Assert.AreEqual<Single>(42, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(279, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(126, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestAlignBaseline.AlignBaselineWithNoBaselineFuncAndNoParent;
var
  Root, RootChild0, RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.Width := 150;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height:= 80;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height:= 50;
  Root.Add(RootChild1);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(80, Root.LayoutHeight);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestAlignBaseline.AlignBaselineWithNoParent;
var
  Root, RootChild0, RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Baseline;
  Root.Width := 150;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height:= 50;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height:= 40;
  RootChild1.OnBaseline := DoBaseline;
  Root.Add(RootChild1);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(150, Root.LayoutWidth);
  Assert.AreEqual<Single>(70, Root.LayoutHeight);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);

  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(40, RootChild1.LayoutHeight);

  Root.Free;
end;

function TTestAlignBaseline.DoBaseline(const ANode: TYogaNode; const AWidth,
  AHeight: Single): Single;
begin
  Result := AHeight * 0.5;
end;

function TTestAlignBaseline.DoMeasure1(const ANode: TYogaNode;
  const AWidth: Single; const AWidthMode: TYogaMeasureMode;
  const AHeight: Single; const AHeightMode: TYogaMeasureMode): TSizeF;
begin
  Result := TSizeF.Create(42, 50);
end;

function TTestAlignBaseline.DoMeasure2(const ANode: TYogaNode;
  const AWidth: Single; const AWidthMode: TYogaMeasureMode;
  const AHeight: Single; const AHeightMode: TYogaMeasureMode): TSizeF;
begin
  Result := TSizeF.Create(279, 126);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestAlignBaseline);

end.
