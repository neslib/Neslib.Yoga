unit TestGenPadding;

// Generated from gentest/fixtures/YGPaddingTest.html

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestGenPadding = class
  public
    [Test] procedure PaddingNoSize;
    [Test] procedure PaddingContainerMatchChild;
    [Test] procedure PaddingFlexChild;
    [Test] procedure PaddingStretchChild;
    [Test] procedure PaddingCenterChild;
    [Test] procedure ChildWithPaddingAlignEnd;
  end;

implementation

{ TTestGenPadding }

procedure TTestGenPadding.PaddingNoSize;
var
  Root: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.PaddingLeft := 10;
  Root.PaddingTop := 10;
  Root.PaddingRight := 10;
  Root.PaddingBottom := 10;
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(20, Root.LayoutWidth);
  Assert.AreEqual<Single>(20, Root.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(20, Root.LayoutWidth);
  Assert.AreEqual<Single>(20, Root.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPadding.PaddingContainerMatchChild;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.PaddingLeft := 10;
  Root.PaddingTop := 10;
  Root.PaddingRight := 10;
  Root.PaddingBottom := 10;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 10;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(30, Root.LayoutWidth);
  Assert.AreEqual<Single>(30, Root.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(30, Root.LayoutWidth);
  Assert.AreEqual<Single>(30, Root.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPadding.PaddingFlexChild;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.PaddingLeft := 10;
  Root.PaddingTop := 10;
  Root.PaddingRight := 10;
  Root.PaddingBottom := 10;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.Width := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPadding.PaddingStretchChild;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.PaddingLeft := 10;
  Root.PaddingTop := 10;
  Root.PaddingRight := 10;
  Root.PaddingBottom := 10;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPadding.PaddingCenterChild;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.AlignItems := TYogaAlign.Center;
  Root.PaddingStart := 10;
  Root.PaddingStop := 20;
  Root.PaddingBottom := 20;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 10;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(40, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(35, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(35, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenPadding.ChildWithPaddingAlignEnd;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.FlexEnd;
  Root.AlignItems := TYogaAlign.FlexEnd;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.PaddingLeft := 20;
  RootChild0.PaddingTop := 20;
  RootChild0.PaddingRight := 20;
  RootChild0.PaddingBottom := 20;
  RootChild0.Width := 100;
  RootChild0.Height := 100;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(100, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(100, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestGenPadding);

end.
