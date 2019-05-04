unit TestGenMargin;

// Generated from gentest/fixtures/YGMarginTest.html

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestGenMargin = class
  public
    [Test] procedure MarginStart;
    [Test] procedure MarginTop;
    [Test] procedure MarginEnd;
    [Test] procedure MarginBottom;
    [Test] procedure MarginAndFlexRow;
    [Test] procedure MarginAndFlexColumn;
    [Test] procedure MarginAndStretchRow;
    [Test] procedure MarginAndStretchColumn;
    [Test] procedure MarginWithSiblingRow;
    [Test] procedure MarginWithSiblingColumn;
    [Test] procedure MarginAutoBottom;
    [Test] procedure MarginAutoTop;
    [Test] procedure MarginAutoBottomAndTop;
    [Test] procedure MarginAutoBottomAndTopJustifyCenter;
    [Test] procedure MarginAutoMutipleChildrenColumn;
    [Test] procedure MarginAutoMutipleChildrenRow;
    [Test] procedure MarginAutoLeftAndRightColumn;
    [Test] procedure MarginAutoLeftAndRight;
    [Test] procedure MarginAutoStartAndEndColumn;
    [Test] procedure MarginAutoStartAndEnd;
    [Test] procedure MarginAutoLeftAndRightColumnAndCenter;
    [Test] procedure MarginAutoLeft;
    [Test] procedure MarginAutoRight;
    [Test] procedure MarginAutoLeftAndRightStrech;
    [Test] procedure MarginAutoTopAndBottomStrech;
    [Test] procedure MarginShouldNotBePartOfMaxHeight;
    [Test] procedure MarginShouldNotBePartOfMaxWidth;
    [Test] procedure MarginAutoLeftRightChildBiggerThanParent;
    [Test] procedure MarginAutoLeftChildBiggerThanParent;
    [Test] procedure MarginFixLeftAutoRightChildBiggerThanParent;
    [Test] procedure MarginAutoLeftFixRightChildBiggerThanParent;
    [Test] procedure MarginAutoTopStretchingChild;
    [Test] procedure MarginAutoLeftStretchingChild;
  end;

implementation

{ TTestGenMargin }

procedure TTestGenMargin.MarginStart;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginStart := 10;
  RootChild0.Width := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginTop;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginTop := 10;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginEnd;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.JustifyContent := TYogaJustify.FlexEnd;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginStop := 10;
  RootChild0.Width := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginBottom;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.FlexEnd;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginBottom := 10;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAndFlexRow;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MarginStart := 10;
  RootChild0.MarginStop := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAndFlexColumn;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MarginTop := 10;
  RootChild0.MarginBottom := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAndStretchRow;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MarginTop := 10;
  RootChild0.MarginBottom := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(80, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAndStretchColumn;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MarginStart := 10;
  RootChild0.MarginStop := 10;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(80, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginWithSiblingRow;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MarginStop := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(45, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(55, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(45, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(55, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(45, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(45, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginWithSiblingColumn;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 100;
  Root.Height := 100;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.MarginBottom := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.FlexGrow := 1;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(45, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(55, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(45, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(100, Root.LayoutWidth);
  Assert.AreEqual<Single>(100, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(45, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(55, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(45, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoBottom;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginBottom := TYogaValue.Auto();
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(150, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(150, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoTop;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginTop := TYogaValue.Auto();
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(100, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(150, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(100, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(150, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoBottomAndTop;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginTop := TYogaValue.Auto();
  RootChild0.MarginBottom := TYogaValue.Auto();
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(150, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(150, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoBottomAndTopJustifyCenter;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginTop := TYogaValue.Auto();
  RootChild0.MarginBottom := TYogaValue.Auto();
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(150, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(150, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(150, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(150, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoMutipleChildrenColumn;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginTop := TYogaValue.Auto();
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.MarginTop := TYogaValue.Auto();
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  RootChild2.Height := 50;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(25, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(100, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(150, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(25, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(100, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(150, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoMutipleChildrenRow;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginRight := TYogaValue.Auto();
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.MarginRight := TYogaValue.Auto();
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 50;
  RootChild2.Height := 50;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(75, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(75, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(150, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(75, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(125, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(75, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(75, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(75, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoLeftAndRightColumn;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginLeft := TYogaValue.Auto();
  RootChild0.MarginRight := TYogaValue.Auto();
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(75, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(150, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(75, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(75, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(75, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoLeftAndRight;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginLeft := TYogaValue.Auto();
  RootChild0.MarginRight := TYogaValue.Auto();
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(150, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoStartAndEndColumn;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginStart := TYogaValue.Auto();
  RootChild0.MarginStop := TYogaValue.Auto();
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(75, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(150, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(75, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(75, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(75, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoStartAndEnd;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginStart := TYogaValue.Auto();
  RootChild0.MarginStop := TYogaValue.Auto();
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(150, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoLeftAndRightColumnAndCenter;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginLeft := TYogaValue.Auto();
  RootChild0.MarginRight := TYogaValue.Auto();
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoLeft;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginLeft := TYogaValue.Auto();
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(150, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(150, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoRight;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginRight := TYogaValue.Auto();
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoLeftAndRightStrech;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginLeft := TYogaValue.Auto();
  RootChild0.MarginRight := TYogaValue.Auto();
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(50, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(150, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoTopAndBottomStrech;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginTop := TYogaValue.Auto();
  RootChild0.MarginBottom := TYogaValue.Auto();
  RootChild0.Width := 50;
  RootChild0.Height := 50;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(150, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(150, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(50, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(150, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(150, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginShouldNotBePartOfMaxHeight;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 250;
  Root.Height := 250;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginTop := 20;
  RootChild0.Width := 100;
  RootChild0.Height := 100;
  RootChild0.MaxHeight := 100;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(250, Root.LayoutWidth);
  Assert.AreEqual<Single>(250, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(250, Root.LayoutWidth);
  Assert.AreEqual<Single>(250, Root.LayoutHeight);
  Assert.AreEqual<Single>(150, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginShouldNotBePartOfMaxWidth;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 250;
  Root.Height := 250;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginLeft := 20;
  RootChild0.Width := 100;
  RootChild0.MaxWidth := 100;
  RootChild0.Height := 100;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(250, Root.LayoutWidth);
  Assert.AreEqual<Single>(250, Root.LayoutHeight);
  Assert.AreEqual<Single>(20, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(250, Root.LayoutWidth);
  Assert.AreEqual<Single>(250, Root.LayoutHeight);
  Assert.AreEqual<Single>(150, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoLeftRightChildBiggerThanParent;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.Width := 52;
  Root.Height := 52;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginLeft := TYogaValue.Auto();
  RootChild0.MarginRight := TYogaValue.Auto();
  RootChild0.Width := 72;
  RootChild0.Height := 72;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);
  Assert.AreEqual<Single>(-20, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoLeftChildBiggerThanParent;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.Width := 52;
  Root.Height := 52;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginLeft := TYogaValue.Auto();
  RootChild0.Width := 72;
  RootChild0.Height := 72;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);
  Assert.AreEqual<Single>(-20, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginFixLeftAutoRightChildBiggerThanParent;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.Width := 52;
  Root.Height := 52;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginLeft := 10;
  RootChild0.MarginRight := TYogaValue.Auto();
  RootChild0.Width := 72;
  RootChild0.Height := 72;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);
  Assert.AreEqual<Single>(-20, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoLeftFixRightChildBiggerThanParent;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.Width := 52;
  Root.Height := 52;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.MarginLeft := TYogaValue.Auto();
  RootChild0.MarginRight := 10;
  RootChild0.Width := 72;
  RootChild0.Height := 72;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(52, Root.LayoutWidth);
  Assert.AreEqual<Single>(52, Root.LayoutHeight);
  Assert.AreEqual<Single>(-30, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(-10, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoTopStretchingChild;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexShrink := 1;
  RootChild0.FlexBasis := TYogaValue.Percent(0);
  RootChild0.MarginTop := TYogaValue.Auto();
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(150, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(150, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(100, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(150, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(150, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

procedure TTestGenMargin.MarginAutoLeftStretchingChild;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.Center;
  Root.Width := 200;
  Root.Height := 200;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.FlexGrow := 1;
  RootChild0.FlexShrink := 1;
  RootChild0.FlexBasis := TYogaValue.Percent(0);
  RootChild0.MarginLeft := TYogaValue.Auto();
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 50;
  Root.Insert(1, RootChild1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(200, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(150, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(150, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(200, Root.LayoutWidth);
  Assert.AreEqual<Single>(200, Root.LayoutHeight);
  Assert.AreEqual<Single>(200, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(150, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(75, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(150, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(50, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(50, RootChild1.LayoutHeight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestGenMargin);

end.
