unit TestDirtyMarking;

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestDirtyMarking = class
  public
    [Test] procedure DirtyPropagation;
    [Test] procedure DirtyPropagationOnlyIfPropChanged;
    [Test] procedure DirtyMarkAllChildrenAsDirtyWhenDisplayChanges;
    [Test] procedure DirtyNodeOnlyIfChildrenAreActuallyRemoved;
    [Test] procedure DirtyNodeOnlyIfUndefinedValuesGetsSetToUndefined;
  end;

implementation

{ TTestDirtyMarking }

procedure TTestDirtyMarking.DirtyMarkAllChildrenAsDirtyWhenDisplayChanges;
var
  Root, Child0, Child1, Child1Child0, Child1Child0Child0: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Height := 100;

  Child0 := TYogaNode.Create;
  Child0.FlexGrow := 1;

  Child1 := TYogaNode.Create;
  Child1.FlexGrow := 1;

  Child1Child0 := TYogaNode.Create;

  Child1Child0Child0 := TYogaNode.Create;
  Child1Child0Child0.Width := 8;
  Child1Child0Child0.Height := 16;

  Child1Child0.Add(Child1Child0Child0);

  Child1.Add(Child1Child0);

  Root.Add(Child0);
  Root.Add(Child1);

  Child0.Display := TYogaDisplay.Flex;
  Child1.Display := TYogaDisplay.None;
  Root.CalculateLayout(TYogaDirection.LTR);
  Assert.AreEqual<Single>(0, Child1Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, Child1Child0Child0.LayoutHeight);

  Child0.Display := TYogaDisplay.None;
  Child1.Display := TYogaDisplay.Flex;
  Root.CalculateLayout(TYogaDirection.LTR);
  Assert.AreEqual<Single>(8, Child1Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(16, Child1Child0Child0.LayoutHeight);

  Child0.Display := TYogaDisplay.Flex;
  Child1.Display := TYogaDisplay.None;
  Root.CalculateLayout(TYogaDirection.LTR);
  Assert.AreEqual<Single>(0, Child1Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, Child1Child0Child0.LayoutHeight);

  Child0.Display := TYogaDisplay.None;
  Child1.Display := TYogaDisplay.Flex;
  Root.CalculateLayout(TYogaDirection.LTR);
  Assert.AreEqual<Single>(8, Child1Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(16, Child1Child0Child0.LayoutHeight);

  Root.Free;
end;

procedure TTestDirtyMarking.DirtyNodeOnlyIfChildrenAreActuallyRemoved;
var
  Root, Child0, Child1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 50;
  Root.Height := 50;

  Child0 := TYogaNode.Create;
  Child0.Width := 50;
  Child0.Height := 25;
  Root.Add(Child0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Child1 := TYogaNode.Create;
  Root.Remove(Child1);
  Assert.IsFalse(Root.IsDirty);
  Child1.Free;

  Root.Remove(Child0);
  Assert.IsTrue(Root.IsDirty);

  Root.Free;
end;

procedure TTestDirtyMarking.DirtyNodeOnlyIfUndefinedValuesGetsSetToUndefined;
var
  Root: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.Width := 50;
  Root.Height := 50;
  Root.MinWidth := TYogaValue.Undefined;

  Root.CalculateLayout(TYogaDirection.LTR);
  Assert.IsFalse(Root.IsDirty);

  Root.MinWidth := TYogaValue.Undefined;
  Assert.IsFalse(Root.IsDirty);

  Root.Free;
end;

procedure TTestDirtyMarking.DirtyPropagation;
var
  Root, RootChild0, RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 20;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 20;
  Root.Add(RootChild1);

  Root.CalculateLayout(TYogaDirection.LTR);

  RootChild0.Width := 20;

  Assert.IsTrue(RootChild0.IsDirty);
  Assert.IsFalse(RootChild1.IsDirty);
  Assert.IsTrue(Root.IsDirty);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.IsFalse(RootChild0.IsDirty);
  Assert.IsFalse(RootChild1.IsDirty);
  Assert.IsFalse(Root.IsDirty);

  Root.Free;
end;

procedure TTestDirtyMarking.DirtyPropagationOnlyIfPropChanged;
var
  Root, RootChild0, RootChild1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignItems := TYogaAlign.FlexStart;
  Root.Width := 100;
  Root.Height := 100;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 50;
  RootChild0.Height := 20;
  Root.Add(RootChild0);

  RootChild1 := TYogaNode.Create;
  RootChild1.Width := 50;
  RootChild1.Height := 20;
  Root.Add(RootChild1);

  Root.CalculateLayout(TYogaDirection.LTR);

  RootChild0.Width := 50;

  Assert.IsFalse(RootChild0.IsDirty);
  Assert.IsFalse(RootChild1.IsDirty);
  Assert.IsFalse(Root.IsDirty);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestDirtyMarking);

end.
