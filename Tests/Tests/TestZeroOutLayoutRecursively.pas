unit TestZeroOutLayoutRecursively;

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestZeroOutLayoutRecursively = class
  public
    [Test] procedure ZeroOutLayout;
  end;

implementation

{ TTestZeroOutLayoutRecursively }

procedure TTestZeroOutLayoutRecursively.ZeroOutLayout;
var
  Root, Child: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.FlexDirection := TYogaFlexDirection.Row;
  Root.Width := 200;
  Root.Height := 200;

  Child := TYogaNode.Create;
  Root.Add(Child);
  Child.Width := 100;
  Child.Height := 100;
  Child.MarginTop := 10;
  Child.PaddingTop := 10;

  Root.CalculateLayout(100, 100, TYogaDirection.LTR);
  Assert.AreEqual<Single>(10, Child.LayoutMarginTop);
  Assert.AreEqual<Single>(10, Child.LayoutPaddingTop);

  Child.Display := TYogaDisplay.None;
  Root.CalculateLayout(100, 100, TYogaDirection.LTR);
  Assert.AreEqual<Single>(0, Child.LayoutMarginTop);
  Assert.AreEqual<Single>(0, Child.LayoutPaddingTop);
  
  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestZeroOutLayoutRecursively);

end.
