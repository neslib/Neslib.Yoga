unit TestNodeChild;

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestNodeChild = class
  public
    [Test] procedure SingleChild;
  end;

implementation

{ TTestNodeChild }

procedure TTestNodeChild.SingleChild;
var
  Root, RootChild0: TYogaNode;
begin
  Root := TYogaNode.Create;

  RootChild0 := TYogaNode.Create;
  RootChild0.Width := 100;
  RootChild0.Height := 100;
  Root.Add(RootChild0);

  Root.CalculateLayout(TYogaDirection.LTR);

  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(100, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(100, RootChild0.LayoutHeight);

  Root.Free;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;
  TDUnitX.RegisterTestFixture(TTestNodeChild);

end.
