unit TestHadOverflow;

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestHadOverflow = class
  private
    FRoot: TYogaNode;
  public
    [Setup] procedure Setup;
    [Teardown] procedure Teardown;
    [Test] procedure ChildrenOverflowNoWrapAndNoFlexChildren;
    [Test] procedure SpacingOverflowNoWrapAndNoFlexChildren;
    [Test] procedure NoOverflowNoWrapAndNoFlexChildren;
    [Test] procedure HasOverflowGetsResetIfNotLongerValid;
    [Test] procedure SpacingOverflowInNestedNodes;
  end;

implementation

{ TTestHadOverflow }

procedure TTestHadOverflow.ChildrenOverflowNoWrapAndNoFlexChildren;
var
  Child0, Child1: TYogaNode;
begin
  Child0 := TYogaNode.Create;
  Child0.Width := 80;
  Child0.Height := 40;
  Child0.MarginTop := 10;
  Child0.MarginBottom := 15;
  FRoot.Add(Child0);

  Child1 := TYogaNode.Create;
  Child1.Width := 80;
  Child1.Height := 40;
  Child1.MarginBottom := 5;
  FRoot.Add(Child1);

  FRoot.CalculateLayout(200, 100, TYogaDirection.LTR);

  Assert.IsTrue(FRoot.LayoutHadOverflow);
end;

procedure TTestHadOverflow.HasOverflowGetsResetIfNotLongerValid;
var
  Child0, Child1: TYogaNode;
begin
  Child0 := TYogaNode.Create;
  Child0.Width := 80;
  Child0.Height := 40;
  Child0.MarginTop := 10;
  Child0.MarginBottom := 10;
  FRoot.Add(Child0);

  Child1 := TYogaNode.Create;
  Child1.Width := 80;
  Child1.Height := 40;
  Child1.MarginBottom := 5;
  FRoot.Add(Child1);

  FRoot.CalculateLayout(200, 100, TYogaDirection.LTR);
  Assert.IsTrue(FRoot.LayoutHadOverflow);

  Child1.FlexShrink := 1;

  FRoot.CalculateLayout(200, 100, TYogaDirection.LTR);
  Assert.IsFalse(FRoot.LayoutHadOverflow);
end;

procedure TTestHadOverflow.NoOverflowNoWrapAndNoFlexChildren;
var
  Child0, Child1: TYogaNode;
begin
  Child0 := TYogaNode.Create;
  Child0.Width := 80;
  Child0.Height := 40;
  Child0.MarginTop := 10;
  Child0.MarginBottom := 10;
  FRoot.Add(Child0);

  Child1 := TYogaNode.Create;
  Child1.Width := 80;
  Child1.Height := 40;
  Child1.MarginBottom := 5;
  Child1.FlexShrink := 1;
  FRoot.Add(Child1);

  FRoot.CalculateLayout(200, 100, TYogaDirection.LTR);

  Assert.IsFalse(FRoot.LayoutHadOverflow);
end;

procedure TTestHadOverflow.Setup;
begin
  FRoot := TYogaNode.Create;
  FRoot.Width := 200;
  FRoot.Height := 100;
  FRoot.FlexDirection := TYogaFlexDirection.Column;
  FRoot.FlexWrap := TYogaWrap.No;
end;

procedure TTestHadOverflow.SpacingOverflowInNestedNodes;
var
  Child0, Child1, Child1_1: TYogaNode;
begin
  Child0 := TYogaNode.Create;
  Child0.Width := 80;
  Child0.Height := 40;
  Child0.MarginTop := 10;
  Child0.MarginBottom := 10;
  FRoot.Add(Child0);

  Child1 := TYogaNode.Create;
  Child1.Width := 80;
  Child1.Height := 40;
  FRoot.Add(Child1);

  Child1_1 := TYogaNode.Create;
  Child1_1.Width := 80;
  Child1_1.Height := 40;
  Child1_1.MarginBottom := 5;
  Child1.Add(Child1_1);

  FRoot.CalculateLayout(200, 100, TYogaDirection.LTR);
  Assert.IsTrue(FRoot.LayoutHadOverflow);
end;

procedure TTestHadOverflow.SpacingOverflowNoWrapAndNoFlexChildren;
var
  Child0, Child1: TYogaNode;
begin
  Child0 := TYogaNode.Create;
  Child0.Width := 80;
  Child0.Height := 40;
  Child0.MarginTop := 10;
  Child0.MarginBottom := 10;
  FRoot.Add(Child0);

  Child1 := TYogaNode.Create;
  Child1.Width := 80;
  Child1.Height := 40;
  Child1.MarginBottom := 5;
  FRoot.Add(Child1);

  FRoot.CalculateLayout(200, 100, TYogaDirection.LTR);

  Assert.IsTrue(FRoot.LayoutHadOverflow);
end;

procedure TTestHadOverflow.Teardown;
begin
  FRoot.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestHadOverflow);

end.
