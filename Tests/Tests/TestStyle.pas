unit TestStyle;

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestStyle = class
  public
    [Test] procedure CopyStyleSame;
    [Test] procedure CopyStyleModified;
    [Test] procedure CopyStyleModifiedSame;
    [Test] procedure InitializeFlexShrinkFlexGrow;
  end;

implementation

{ TTestStyle }

procedure TTestStyle.CopyStyleModified;
var
  Node0, Node1: TYogaNode;
begin
  Node0 := TYogaNode.Create;
  Assert.IsFalse(Node0.IsDirty);
  Assert.AreEqual(TYogaFlexDirection.Column, Node0.FlexDirection);
  Assert.IsFalse(Node0.MaxHeight.Units <> TYogaUnit.Undefined);

  Node1 := TYogaNode.Create;
  Node1.FlexDirection := TYogaFlexDirection.Row;
  Node1.MaxHeight := 10;

  Node0.CopyStyle(Node1);
  Assert.IsTrue(Node0.IsDirty);
  Assert.AreEqual(TYogaFlexDirection.Row, Node0.FlexDirection);
  Assert.AreEqual<Single>(10, Node0.MaxHeight.Value);

  Node1.Free;
  Node0.Free;
end;

procedure TTestStyle.CopyStyleModifiedSame;
var
  Node0, Node1: TYogaNode;
begin
  Node0 := TYogaNode.Create;
  Node0.FlexDirection := TYogaFlexDirection.Row;
  Node0.MaxHeight := 10;
  Node0.CalculateLayout(TYogaDirection.LTR);
  Assert.IsFalse(Node0.IsDirty);

  Node1 := TYogaNode.Create;
  Node1.FlexDirection := TYogaFlexDirection.Row;
  Node1.MaxHeight := 10;

  Node0.CopyStyle(Node1);
  Assert.IsFalse(Node0.IsDirty);

  Node1.Free;
  Node0.Free;
end;

procedure TTestStyle.CopyStyleSame;
var
  Node0, Node1: TYogaNode;
begin
  Node0 := TYogaNode.Create;
  Node1 := TYogaNode.Create;

  Assert.IsFalse(Node0.IsDirty);
  Node0.CopyStyle(Node1);
  Assert.IsFalse(Node0.IsDirty);

  Node1.Free;
  Node0.Free;
end;

procedure TTestStyle.InitializeFlexShrinkFlexGrow;
var
  Node0: TYogaNode;
begin
  Node0 := TYogaNode.Create;

  Node0.FlexShrink := 1;
  Assert.AreEqual<Single>(1, Node0.FlexShrink);

  Node0.FlexShrink := YOGA_UNDEFINED;
  Node0.FlexGrow := 3;
  Assert.AreEqual<Single>(0, Node0.FlexShrink);
  Assert.AreEqual<Single>(3, Node0.FlexGrow);

  Node0.FlexGrow := YOGA_UNDEFINED;
  Node0.FlexShrink := 3;
  Assert.AreEqual<Single>(0, Node0.FlexGrow);
  Assert.AreEqual<Single>(3, Node0.FlexShrink);

  Node0.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestStyle);

end.
