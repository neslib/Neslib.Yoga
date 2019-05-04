unit TestGenAndroidNewsFeed;

// Generated from gentest/fixtures/YGAndroidNewsFeed.html

interface

uses
  DUnitX.TestFramework,
  Neslib.Yoga;

type
  TTestGenAndroidNews = class
  public
    [Test] procedure AndroidNewsFeed;
  end;

implementation

{ TTestGenAndroidNews }

procedure TTestGenAndroidNews.AndroidNewsFeed;
var
  Root: TYogaNode;
  RootChild0: TYogaNode;
  RootChild0Child0: TYogaNode;
  RootChild0Child0Child0: TYogaNode;
  RootChild0Child0Child0Child0: TYogaNode;
  RootChild0Child0Child0Child0Child0: TYogaNode;
  RootChild0Child0Child0Child0Child0Child0: TYogaNode;
  RootChild0Child0Child0Child0Child1: TYogaNode;
  RootChild0Child0Child0Child0Child1Child0: TYogaNode;
  RootChild0Child0Child0Child0Child1Child1: TYogaNode;
  RootChild0Child0Child1: TYogaNode;
  RootChild0Child0Child1Child0: TYogaNode;
  RootChild0Child0Child1Child0Child0: TYogaNode;
  RootChild0Child0Child1Child0Child0Child0: TYogaNode;
  RootChild0Child0Child1Child0Child1: TYogaNode;
  RootChild0Child0Child1Child0Child1Child0: TYogaNode;
  RootChild0Child0Child1Child0Child1Child1: TYogaNode;
begin
  Root := TYogaNode.Create;
  Root.AlignContent := TYogaAlign.Stretch;
  Root.Width := 1080;
  
  RootChild0 := TYogaNode.Create;
  Root.Insert(0, RootChild0);
  
  RootChild0Child0 := TYogaNode.Create;
  RootChild0Child0.AlignContent := TYogaAlign.Stretch;
  RootChild0.Insert(0, RootChild0Child0);
  
  RootChild0Child0Child0 := TYogaNode.Create;
  RootChild0Child0Child0.AlignContent := TYogaAlign.Stretch;
  RootChild0Child0.Insert(0, RootChild0Child0Child0);
  
  RootChild0Child0Child0Child0 := TYogaNode.Create;
  RootChild0Child0Child0Child0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0Child0Child0Child0.AlignContent := TYogaAlign.Stretch;
  RootChild0Child0Child0Child0.AlignItems := TYogaAlign.FlexStart;
  RootChild0Child0Child0Child0.MarginStart := 36;
  RootChild0Child0Child0Child0.MarginTop := 24;
  RootChild0Child0Child0.Insert(0, RootChild0Child0Child0Child0);
  
  RootChild0Child0Child0Child0Child0 := TYogaNode.Create;
  RootChild0Child0Child0Child0Child0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0Child0Child0Child0Child0.AlignContent := TYogaAlign.Stretch;
  RootChild0Child0Child0Child0.Insert(0, RootChild0Child0Child0Child0Child0);
  
  RootChild0Child0Child0Child0Child0Child0 := TYogaNode.Create;
  RootChild0Child0Child0Child0Child0Child0.AlignContent := TYogaAlign.Stretch;
  RootChild0Child0Child0Child0Child0Child0.Width := 120;
  RootChild0Child0Child0Child0Child0Child0.Height := 120;
  RootChild0Child0Child0Child0Child0.Insert(0, RootChild0Child0Child0Child0Child0Child0);
  
  RootChild0Child0Child0Child0Child1 := TYogaNode.Create;
  RootChild0Child0Child0Child0Child1.AlignContent := TYogaAlign.Stretch;
  RootChild0Child0Child0Child0Child1.FlexShrink := 1;
  RootChild0Child0Child0Child0Child1.MarginRight := 36;
  RootChild0Child0Child0Child0Child1.PaddingLeft := 36;
  RootChild0Child0Child0Child0Child1.PaddingTop := 21;
  RootChild0Child0Child0Child0Child1.PaddingRight := 36;
  RootChild0Child0Child0Child0Child1.PaddingBottom := 18;
  RootChild0Child0Child0Child0.Insert(1, RootChild0Child0Child0Child0Child1);
  
  RootChild0Child0Child0Child0Child1Child0 := TYogaNode.Create;
  RootChild0Child0Child0Child0Child1Child0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0Child0Child0Child0Child1Child0.AlignContent := TYogaAlign.Stretch;
  RootChild0Child0Child0Child0Child1Child0.FlexShrink := 1;
  RootChild0Child0Child0Child0Child1.Insert(0, RootChild0Child0Child0Child0Child1Child0);
  
  RootChild0Child0Child0Child0Child1Child1 := TYogaNode.Create;
  RootChild0Child0Child0Child0Child1Child1.AlignContent := TYogaAlign.Stretch;
  RootChild0Child0Child0Child0Child1Child1.FlexShrink := 1;
  RootChild0Child0Child0Child0Child1.Insert(1, RootChild0Child0Child0Child0Child1Child1);
  
  RootChild0Child0Child1 := TYogaNode.Create;
  RootChild0Child0Child1.AlignContent := TYogaAlign.Stretch;
  RootChild0Child0.Insert(1, RootChild0Child0Child1);
  
  RootChild0Child0Child1Child0 := TYogaNode.Create;
  RootChild0Child0Child1Child0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0Child0Child1Child0.AlignContent := TYogaAlign.Stretch;
  RootChild0Child0Child1Child0.AlignItems := TYogaAlign.FlexStart;
  RootChild0Child0Child1Child0.MarginStart := 174;
  RootChild0Child0Child1Child0.MarginTop := 24;
  RootChild0Child0Child1.Insert(0, RootChild0Child0Child1Child0);
  
  RootChild0Child0Child1Child0Child0 := TYogaNode.Create;
  RootChild0Child0Child1Child0Child0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0Child0Child1Child0Child0.AlignContent := TYogaAlign.Stretch;
  RootChild0Child0Child1Child0.Insert(0, RootChild0Child0Child1Child0Child0);
  
  RootChild0Child0Child1Child0Child0Child0 := TYogaNode.Create;
  RootChild0Child0Child1Child0Child0Child0.AlignContent := TYogaAlign.Stretch;
  RootChild0Child0Child1Child0Child0Child0.Width := 72;
  RootChild0Child0Child1Child0Child0Child0.Height := 72;
  RootChild0Child0Child1Child0Child0.Insert(0, RootChild0Child0Child1Child0Child0Child0);
  
  RootChild0Child0Child1Child0Child1 := TYogaNode.Create;
  RootChild0Child0Child1Child0Child1.AlignContent := TYogaAlign.Stretch;
  RootChild0Child0Child1Child0Child1.FlexShrink := 1;
  RootChild0Child0Child1Child0Child1.MarginRight := 36;
  RootChild0Child0Child1Child0Child1.PaddingLeft := 36;
  RootChild0Child0Child1Child0Child1.PaddingTop := 21;
  RootChild0Child0Child1Child0Child1.PaddingRight := 36;
  RootChild0Child0Child1Child0Child1.PaddingBottom := 18;
  RootChild0Child0Child1Child0.Insert(1, RootChild0Child0Child1Child0Child1);
  
  RootChild0Child0Child1Child0Child1Child0 := TYogaNode.Create;
  RootChild0Child0Child1Child0Child1Child0.FlexDirection := TYogaFlexDirection.Row;
  RootChild0Child0Child1Child0Child1Child0.AlignContent := TYogaAlign.Stretch;
  RootChild0Child0Child1Child0Child1Child0.FlexShrink := 1;
  RootChild0Child0Child1Child0Child1.Insert(0, RootChild0Child0Child1Child0Child1Child0);
  
  RootChild0Child0Child1Child0Child1Child1 := TYogaNode.Create;
  RootChild0Child0Child1Child0Child1Child1.AlignContent := TYogaAlign.Stretch;
  RootChild0Child0Child1Child0Child1Child1.FlexShrink := 1;
  RootChild0Child0Child1Child0Child1.Insert(1, RootChild0Child0Child1Child0Child1Child1);
  Root.Direction := TYogaDirection.LTR;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(1080, Root.LayoutWidth);
  Assert.AreEqual<Single>(240, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(1080, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(240, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(1080, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(240, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(1080, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(144, RootChild0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(36, RootChild0Child0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(24, RootChild0Child0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(1044, RootChild0Child0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(120, RootChild0Child0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(120, RootChild0Child0Child0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(120, RootChild0Child0Child0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(120, RootChild0Child0Child0Child0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(120, RootChild0Child0Child0Child0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(120, RootChild0Child0Child0Child0Child1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0Child1.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0Child0Child0Child0Child1.LayoutWidth);
  Assert.AreEqual<Single>(39, RootChild0Child0Child0Child0Child1.LayoutHeight);
  Assert.AreEqual<Single>(36, RootChild0Child0Child0Child0Child1Child0.LayoutLeft);
  Assert.AreEqual<Single>(21, RootChild0Child0Child0Child0Child1Child0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0Child1Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0Child1Child0.LayoutHeight);
  Assert.AreEqual<Single>(36, RootChild0Child0Child0Child0Child1Child1.LayoutLeft);
  Assert.AreEqual<Single>(21, RootChild0Child0Child0Child0Child1Child1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0Child1Child1.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0Child1Child1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1.LayoutLeft);
  Assert.AreEqual<Single>(144, RootChild0Child0Child1.LayoutTop);
  Assert.AreEqual<Single>(1080, RootChild0Child0Child1.LayoutWidth);
  Assert.AreEqual<Single>(96, RootChild0Child0Child1.LayoutHeight);
  Assert.AreEqual<Single>(174, RootChild0Child0Child1Child0.LayoutLeft);
  Assert.AreEqual<Single>(24, RootChild0Child0Child1Child0.LayoutTop);
  Assert.AreEqual<Single>(906, RootChild0Child0Child1Child0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0Child0Child1Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0Child0Child1Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0Child0Child1Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0Child0Child1Child0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0Child0Child1Child0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(72, RootChild0Child0Child1Child0Child1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0Child1.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0Child0Child1Child0Child1.LayoutWidth);
  Assert.AreEqual<Single>(39, RootChild0Child0Child1Child0Child1.LayoutHeight);
  Assert.AreEqual<Single>(36, RootChild0Child0Child1Child0Child1Child0.LayoutLeft);
  Assert.AreEqual<Single>(21, RootChild0Child0Child1Child0Child1Child0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0Child1Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0Child1Child0.LayoutHeight);
  Assert.AreEqual<Single>(36, RootChild0Child0Child1Child0Child1Child1.LayoutLeft);
  Assert.AreEqual<Single>(21, RootChild0Child0Child1Child0Child1Child1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0Child1Child1.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0Child1Child1.LayoutHeight);
  Root.Direction := TYogaDirection.RTL;
  Root.CalculateLayout();
  Assert.AreEqual<Single>(0, Root.LayoutLeft);
  Assert.AreEqual<Single>(0, Root.LayoutTop);
  Assert.AreEqual<Single>(1080, Root.LayoutWidth);
  Assert.AreEqual<Single>(240, Root.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0.LayoutTop);
  Assert.AreEqual<Single>(1080, RootChild0.LayoutWidth);
  Assert.AreEqual<Single>(240, RootChild0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0.LayoutTop);
  Assert.AreEqual<Single>(1080, RootChild0Child0.LayoutWidth);
  Assert.AreEqual<Single>(240, RootChild0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(1080, RootChild0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(144, RootChild0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(24, RootChild0Child0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(1044, RootChild0Child0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(120, RootChild0Child0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(924, RootChild0Child0Child0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(120, RootChild0Child0Child0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(120, RootChild0Child0Child0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(120, RootChild0Child0Child0Child0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(120, RootChild0Child0Child0Child0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(816, RootChild0Child0Child0Child0Child1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0Child1.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0Child0Child0Child0Child1.LayoutWidth);
  Assert.AreEqual<Single>(39, RootChild0Child0Child0Child0Child1.LayoutHeight);
  Assert.AreEqual<Single>(36, RootChild0Child0Child0Child0Child1Child0.LayoutLeft);
  Assert.AreEqual<Single>(21, RootChild0Child0Child0Child0Child1Child0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0Child1Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0Child1Child0.LayoutHeight);
  Assert.AreEqual<Single>(36, RootChild0Child0Child0Child0Child1Child1.LayoutLeft);
  Assert.AreEqual<Single>(21, RootChild0Child0Child0Child0Child1Child1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0Child1Child1.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0Child0Child0Child1Child1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1.LayoutLeft);
  Assert.AreEqual<Single>(144, RootChild0Child0Child1.LayoutTop);
  Assert.AreEqual<Single>(1080, RootChild0Child0Child1.LayoutWidth);
  Assert.AreEqual<Single>(96, RootChild0Child0Child1.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0.LayoutLeft);
  Assert.AreEqual<Single>(24, RootChild0Child0Child1Child0.LayoutTop);
  Assert.AreEqual<Single>(906, RootChild0Child0Child1Child0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0Child0Child1Child0.LayoutHeight);
  Assert.AreEqual<Single>(834, RootChild0Child0Child1Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0Child0Child1Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0Child0Child1Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0Child0Child0.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0Child0Child0.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0Child0Child1Child0Child0Child0.LayoutWidth);
  Assert.AreEqual<Single>(72, RootChild0Child0Child1Child0Child0Child0.LayoutHeight);
  Assert.AreEqual<Single>(726, RootChild0Child0Child1Child0Child1.LayoutLeft);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0Child1.LayoutTop);
  Assert.AreEqual<Single>(72, RootChild0Child0Child1Child0Child1.LayoutWidth);
  Assert.AreEqual<Single>(39, RootChild0Child0Child1Child0Child1.LayoutHeight);
  Assert.AreEqual<Single>(36, RootChild0Child0Child1Child0Child1Child0.LayoutLeft);
  Assert.AreEqual<Single>(21, RootChild0Child0Child1Child0Child1Child0.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0Child1Child0.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0Child1Child0.LayoutHeight);
  Assert.AreEqual<Single>(36, RootChild0Child0Child1Child0Child1Child1.LayoutLeft);
  Assert.AreEqual<Single>(21, RootChild0Child0Child1Child0Child1Child1.LayoutTop);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0Child1Child1.LayoutWidth);
  Assert.AreEqual<Single>(0, RootChild0Child0Child1Child0Child1Child1.LayoutHeight);

  Root.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestGenAndroidNews);

end.
