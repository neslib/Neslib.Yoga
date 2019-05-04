unit TestGenJustifyContent;

// Generated from gentest/fixtures/YGJustifyContentTest.html

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestGenJustifyContent = class
  public
    [Test] procedure JustifyContentRowFlexStart;
    [Test] procedure JustifyContentRowFlexEnd;
    [Test] procedure JustifyContentRowCenter;
    [Test] procedure JustifyContentRowSpaceBetween;
    [Test] procedure JustifyContentRowSpaceAround;
    [Test] procedure JustifyContentColumnFlexStart;
    [Test] procedure JustifyContentColumnFlexEnd;
    [Test] procedure JustifyContentColumnCenter;
    [Test] procedure JustifyContentColumnSpaceBetween;
    [Test] procedure JustifyContentColumnSpaceAround;
    [Test] procedure JustifyContentRowMinWidthAndMargin;
    [Test] procedure JustifyContentRowMaxWidthAndMargin;
    [Test] procedure JustifyContentColumnMinHeightAndMargin;
    [Test] procedure JustifyContentColunnMaxHeightAndMargin;
    [Test] procedure JustifyContentColumnSpaceEvenly;
    [Test] procedure JustifyContentRowSpaceEvenly;
  end;

implementation

{ TTestGenJustifyContent }

procedure TTestGenJustifyContent.JustifyContentRowFlexStart;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 102;
  Root.Height := 102;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(20, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(92, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(82, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(72, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenJustifyContent.JustifyContentRowFlexEnd;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.JustifyContent := TYogaJustify.FlexEnd;
  Root.Width := 102;
  Root.Height := 102;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(72, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(82, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(92, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(20, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(10, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenJustifyContent.JustifyContentRowCenter;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.JustifyContent := TYogaJustify.Center;
  Root.Width := 102;
  Root.Height := 102;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(36, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(46, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(56, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(56, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(46, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(36, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenJustifyContent.JustifyContentRowSpaceBetween;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.JustifyContent := TYogaJustify.SpaceBetween;
  Root.Width := 102;
  Root.Height := 102;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(46, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(92, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(92, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(46, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenJustifyContent.JustifyContentRowSpaceAround;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.JustifyContent := TYogaJustify.SpaceAround;
  Root.Width := 102;
  Root.Height := 102;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Width := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(12, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(46, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(80, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(46, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(12, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(10, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(102, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenJustifyContent.JustifyContentColumnFlexStart;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 102;
  Root.Height := 102;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(10, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(20, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenJustifyContent.JustifyContentColumnFlexEnd;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.FlexEnd;
  Root.Width := 102;
  Root.Height := 102;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(72, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(82, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(92, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(72, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(82, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(92, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenJustifyContent.JustifyContentColumnCenter;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.Width := 102;
  Root.Height := 102;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(36, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(46, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(56, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(36, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(46, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(56, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenJustifyContent.JustifyContentColumnSpaceBetween;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.SpaceBetween;
  Root.Width := 102;
  Root.Height := 102;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(46, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(92, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(46, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(92, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenJustifyContent.JustifyContentColumnSpaceAround;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.SpaceAround;
  Root.Width := 102;
  Root.Height := 102;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(12, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(46, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(12, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(46, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(80, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenJustifyContent.JustifyContentRowMinWidthAndMargin;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.JustifyContent := TYogaJustify.Center;
  Root.MarginLeft := 100;
  Root.MinWidth := 50;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 20;
  RootChild0.Height := 20;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(100, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(50, Root.LayoutWidth);
  Assert.AreEqual<Single>(20, Root.LayoutHeight);
  Assert.AreEqual<Single>(15, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(100, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(50, Root.LayoutWidth);
  Assert.AreEqual<Single>(20, Root.LayoutHeight);
  Assert.AreEqual<Single>(15, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenJustifyContent.JustifyContentRowMaxWidthAndMargin;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.JustifyContent := TYogaJustify.Center;
  Root.MarginLeft := 100;
  Root.Width := 100;
  Root.MaxWidth := 80;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 20;
  RootChild0.Height := 20;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(100, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(80, Root.LayoutWidth);
  Assert.AreEqual<Single>(20, Root.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(100, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(80, Root.LayoutWidth);
  Assert.AreEqual<Single>(20, Root.LayoutHeight);
  Assert.AreEqual<Single>(30, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenJustifyContent.JustifyContentColumnMinHeightAndMargin;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.MarginTop := 100;
  Root.MinHeight := 50;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 20;
  RootChild0.Height := 20;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(100, Root.LayoutTop);
  Assert.AreEqual<Single>(20, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(15, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(100, Root.LayoutTop);
  Assert.AreEqual<Single>(20, Root.LayoutWidth);
  Assert.AreEqual<Single>(50, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(15, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenJustifyContent.JustifyContentColunnMaxHeightAndMargin;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.Center;
  Root.MarginTop := 100;
  Root.Height := 100;
  Root.MaxHeight := 80;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 20;
  RootChild0.Height := 20;
  Root.Insert(0, RootChild0);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(100, Root.LayoutTop);
  Assert.AreEqual<Single>(20, Root.LayoutWidth);
  Assert.AreEqual<Single>(80, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(100, Root.LayoutTop);
  Assert.AreEqual<Single>(20, Root.LayoutWidth);
  Assert.AreEqual<Single>(80, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(30, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(20, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(20, RootChild0.LayoutHeight);

  Root.Free;
end;

procedure TTestGenJustifyContent.JustifyContentColumnSpaceEvenly;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.JustifyContent := TYogaJustify.SpaceEvenly;
  Root.Width := 102;
  Root.Height := 102;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(18, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(46, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(74, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(18, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(46, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(74, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(102, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);

  Root.Free;
end;

procedure TTestGenJustifyContent.JustifyContentRowSpaceEvenly;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild1: TYogaNode;
  RootChild2: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.JustifyContent := TYogaJustify.SpaceEvenly;
  Root.Width := 102;
  Root.Height := 102;
  
  RootChild0 := TYogaNode.Create;
  RootChild0.Height := 10;
  Root.Insert(0, RootChild0);
  
  RootChild1 := TYogaNode.Create;
  RootChild1.Height := 10;
  Root.Insert(1, RootChild1);
  
  RootChild2 := TYogaNode.Create;
  RootChild2.Height := 10;
  Root.Insert(2, RootChild2);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(26, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(51, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(77, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(102, Root.LayoutWidth);
  Assert.AreEqual<Single>(102, Root.LayoutHeight);
  Assert.AreEqual<Single>(77, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(51, RootChild1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild1.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild1.LayoutHeight);
  Assert.AreEqual<Single>(26, RootChild2.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild2.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild2.LayoutWidth);
  Assert.AreEqual<Single>(10, RootChild2.LayoutHeight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestGenJustifyContent);

end.
