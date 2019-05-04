unit TestEdge;

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestEdge = class
  public
    [Test] procedure StartOverrides;
    [Test] procedure EndOverrides;
    [Test] procedure HorizontalOverridden;
    [Test] procedure VerticalOverridden;
    [Test] procedure HorizontalOverridesAll;
    [Test] procedure VerticalOverridesAll;
    [Test] procedure AllOverridden;
  end;

implementation

{ TTestEdge }

procedure TTestEdge.AllOverridden;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Column;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MarginLeft := 10;
  RootChild0.MarginTop := 10;
  RootChild0.MarginRight := 10;
  RootChild0.MarginBottom := 10;
  RootChild0.Margin := 20;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutRight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutBottom);

  Root.Free;
end;

procedure TTestEdge.EndOverrides;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MarginStop := 10;
  RootChild0.MarginLeft := 20;
  RootChild0.MarginRight := 20;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);
  Assert.AreEqual<Single>(20, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutRight);

  Root.CalculateLayout(TYogaDirection.RTL);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild0.LayoutRight);

  Root.Free;
end;

procedure TTestEdge.HorizontalOverridden;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MarginHorizontal := 10;
  RootChild0.MarginLeft := 20;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);
  Assert.AreEqual<Single>(20, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutRight);

  Root.Free;
end;

procedure TTestEdge.HorizontalOverridesAll;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Column;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MarginHorizontal := 10;
  RootChild0.Margin := 20;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutRight);
  Assert.AreEqual<Single>(20, RootChild0.LayoutBottom);

  Root.Free;
end;

procedure TTestEdge.StartOverrides;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MarginStart := 10;
  RootChild0.MarginLeft := 20;
  RootChild0.MarginRight := 20;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild0.LayoutRight);

  Root.CalculateLayout(TYogaDirection.RTL);
  Assert.AreEqual<Single>(20, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutRight);

  Root.Free;
end;

procedure TTestEdge.VerticalOverridden;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Column;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MarginVertical := 10;
  RootChild0.MarginTop := 20;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);
  Assert.AreEqual<Single>(20, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutBottom);

  Root.Free;
end;

procedure TTestEdge.VerticalOverridesAll;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Column;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MarginVertical := 10;
  RootChild0.Margin := 20;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);
  Assert.AreEqual<Single>(20, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutRight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutBottom);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestEdge);

end.
