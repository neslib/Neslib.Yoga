unit TestDefaultValues;

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestDefaultValues = class
  public
    [Test] procedure AssertDefaultValues;
  end;

implementation

{ TTestDefaultValues }

procedure TTestDefaultValues.AssertDefaultValues;
var
  Root: TYogaNode;
begin
  Root := TYogaNode.Create;

  Assert.AreEqual(0, Root.ChildCount);
  Assert.AreEqual(TYogaDirection.Inherit, Root.Direction);
  Assert.AreEqual(TYogaFlexDirection.Column, Root.FlexDirection);
  Assert.AreEqual(TYogaJustify.FlexStart, Root.JustifyContent);
  Assert.AreEqual(TYogaAlign.FlexStart, Root.AlignContent);
  Assert.AreEqual(TYogaAlign.Stretch, Root.AlignItems);
  Assert.AreEqual(TYogaAlign.Auto, Root.AlignSelf);
  Assert.AreEqual(TYogaPositionType.Relative, Root.PositionType);
  Assert.AreEqual(TYogaWrap.No, Root.FlexWrap);
  Assert.AreEqual(TYogaOverflow.Visible, Root.Overflow);
  Assert.AreEqual<Single>(0, Root.FlexGrow);
  Assert.AreEqual<Single>(0, Root.FlexShrink);
  Assert.AreEqual(TYogaUnit.Auto, Root.FlexBasis.Units);

  Assert.AreEqual(TYogaUnit.Undefined, Root.Left.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.Top.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.Right.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.Bottom.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.Start.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.Stop.Units);

  Assert.AreEqual(TYogaUnit.Undefined, Root.MarginLeft.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.MarginTop.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.MarginRight.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.MarginBottom.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.MarginStart.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.MarginStop.Units);

  Assert.AreEqual(TYogaUnit.Undefined, Root.PaddingLeft.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.PaddingTop.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.PaddingRight.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.PaddingBottom.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.PaddingStart.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.PaddingStop.Units);

  Assert.AreEqual(TYogaUnit.Auto, Root.Width.Units);
  Assert.AreEqual(TYogaUnit.Auto, Root.Height.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.MinWidth.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.MinHeight.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.MaxWidth.Units);
  Assert.AreEqual(TYogaUnit.Undefined, Root.MaxHeight.Units);

  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(0, Root.LayoutRight);
  Assert.AreEqual<Single>(0, Root.LayoutBottom);

  Assert.AreEqual<Single>(0, Root.LayoutMarginLeft);
  Assert.AreEqual<Single>(0, Root.LayoutMarginTop);
  Assert.AreEqual<Single>(0, Root.LayoutMarginRight);
  Assert.AreEqual<Single>(0, Root.LayoutMarginBottom);

  Assert.AreEqual<Single>(0, Root.LayoutPaddingLeft);
  Assert.AreEqual<Single>(0, Root.LayoutPaddingTop);
  Assert.AreEqual<Single>(0, Root.LayoutPaddingRight);
  Assert.AreEqual<Single>(0, Root.LayoutPaddingBottom);

  Assert.IsTrue(YogaIsUndefined(Root.LayoutWidth));
  Assert.IsTrue(YogaIsUndefined(Root.LayoutHeight));
  Assert.AreEqual(TYogaDirection.Inherit, Root.LayoutDirection);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestDefaultValues);

end.
