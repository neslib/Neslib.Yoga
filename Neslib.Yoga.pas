unit Neslib.Yoga;
{ Delphi version of YogaLayout.
  Has the following differences compared to the C version:
  * There is no configuration object. It always uses this configuration:
    - No experimental features
    - Use Web Defaults (since non web defaults is considered legacy), unless
      YOGA_NO_WEB_DEFAULTS is defined.
  * The following node properties are not supported:
    - Border (this is for informational purposes only anyway)
    - Context (you should subclass TYogaNode instead)
  * Use the name Parent instead of Owner (which is more accurate for Delphi)
  * No DirtiedFunc callback that gets called when the Dirty property of a node
    is set.
  * No support for cloning. This adds complexity because you are supposed to
    override TYogaNode for your own purposes.

  Instead of a configurable PointScaleFactor you can set the define
  YOGA_NO_PIXEL_ALIGN. When set, calculated positions and dimensions may have
  fractions. Otherwise, positions and dimensions are aligned to integer
  positions on the pixel grid.

  Ideas for improvements:
  ----------------------
  Reduce memory by fitting TYogaValue and TFloatOptional into a single 32-bit
  value. For UI positions and dimensions, we don't need the precision of 23
  mantissa bits. The Single format is as follows:

  Sign bit - 8 exponent bits - 23 mantissa bits

  Three possible approaches:
  1. Use the lowest two mantissa bits to store TYogaUnit (Undefined, Point,
     Percent, Auto). For values between -2000 and 2000 this means that the
     value is precise up to at least 3-4 decimal digits after the point (the
     smaller the value, the more precise after the point. For example, a value
     of 1.0 is precise up to 6-7 digits).
  2. Use the lowest mantissa bit to signal between Point and Percent values.
     The values Undefined and Auto use Inf and NaN values. This increases
     precision and may also be easier in some cases.
     We could use -Inf ($FF800000) for Auto and any negative NaN ($FF800001-
     $FFFFFFFF) for Undefined. It is easy then to check for Auto or Undefined
     using a comparison of >= $FF800000.
  3. As 2, but Undefined is value 10e20 like in the C++ version.

  You could perform calculations with these values directly. They will introduce
  a bit of error, but the error may grow propagate depending on the calculation.
  For accurate calculations without error (other than the error inherent to the
  floating-point format), you should clear the lowest 1 or 2 bits before using
  the value in calculations.

  You can test out the individual floating-point bits on this website:
  https://www.h-schmidt.net/FloatConverter/IEEE754.html }

{$SCOPEDENUMS ON}

{ Enable this define to disable alignment of calculated positions and dimensions
  to an integer pixel grid. }
{.$DEFINE YOGA_NO_PIXEL_ALIGN}

{ Enable this define to use the legacy non-web defaults for certain node
  properties. }
{.DEFINE YOGA_NO_WEB_DEFAULTS}

interface

uses
  System.Types;

const
  YOGA_UNDEFINED = 10e20;

type
  TYogaAlign = (Auto, FlexStart, Center, FlexEnd, Stretch, Baseline,
    SpaceBetween, SpaceAround);
  TYogaDirection = (Inherit, LTR, RTL);
  TYogaDisplay = (Flex, None);
  TYogaEdge = (Left, Top, Right, Bottom, Start, Stop, Horizontal, Vertical, All);
  TYogaFlexDirection = (Column, ColumnReverse, Row, RowReverse);
  TYogaJustify = (FlexStart, Center, FlexEnd, SpaceBetween, SpaceAround,
    SpaceEvenly);
  TYogaMeasureMode = (Undefined, Exactly, AtMost);
  TYogaNodeType = (Default, Text);
  TYogaOverflow = (Visible, Hidden, Scroll);
  TYogaPositionType = (Relative, Absolute);
  TYogaUnit = (Undefined, Point, Percent, Auto);
  TYogaWrap = (No, Wrap, WrapReverse);

type
  TYogaValue = record
  {$REGION 'Internal Declarations'}
  private
    FValue: Single;
    FUnits: TYogaUnit;
  {$ENDREGION 'Internal Declarations'}
  public
    procedure SetPoint(const AValue: Single);
    procedure SetPercent(const AValue: Single);
    procedure SetUndefined;
    procedure SetAuto;

    class operator Implicit(const AValue: Single): TYogaValue; static;

    class operator Equal(const ALeft, ARight: TYogaValue): Boolean; static;
    class operator NotEqual(const ALeft, ARight: TYogaValue): Boolean;  static;

    class function Point(const AValue: Single): TYogaValue; static;
    class function Percent(const AValue: Single): TYogaValue; static;
    class function Undefined: TYogaValue;  static;
    class function Auto: TYogaValue;  static;

    property Value: Single read FValue;
    property Units: TYogaUnit read FUnits;
  end;

type
  TYogaNode = class;

  TYogaMeasureEvent = function(const ANode: TYogaNode; const AWidth: Single;
    const AWidthMode: TYogaMeasureMode; const AHeight: Single;
    const AHeightMode: TYogaMeasureMode): TSizeF of object;

  TYogaBaselineEvent = function(const ANode: TYogaNode; const AWidth,
    AHeight: Single): Single of object;

  { NOTE: Nodes own their children }
  TYogaNode = class
  {$REGION 'Internal Declarations'}
  private const
    DEFAULT_FLEX_GROW       = 0.0;
    {$IFDEF YOGA_NO_WEB_DEFAULTS}
    DEFAULT_FLEX_SHRINK     = 0.0;
    {$ELSE}
    DEFAULT_FLEX_SHRINK     = 1.0;
    {$ENDIF}
    MAX_CACHED_RESULT_COUNT = 16;
  private class var
    GCurrentGenerationCount: Cardinal;
    GDepth: Cardinal;
  private type
    TEnumerator = record
    private
      [unsafe] FNode: TYogaNode;
      FIndex: Integer;
      function GetCurrent: TYogaNode;
    public
      class function Create(const ANode: TYogaNode): TEnumerator; static;

      function MoveNext: Boolean;
      property Current: TYogaNode read GetCurrent;
    end;
  private type
    TFloatOptional = record
    private
      FValue: Single;
      FIsUndefined: Boolean;
      function GetValue: Single;
      procedure SetValue(const AValue: Single);
    public
      constructor Create(const AValue: Single);
      procedure Init; overload; inline;
      procedure Init(const AValue: Single); overload;

      function Unwrap: Single;
      class function Max(const AA, AB: TFloatOptional): TFloatOptional; static;

      class operator Implicit(const AValue: Single): TFloatOptional; inline; static;
      class operator Add(const ALeft, ARight: TFloatOptional): TFloatOptional; static;
      class operator GreaterThan(const ALeft, ARight: TFloatOptional): Boolean; static;
      class operator LessThan(const ALeft, ARight: TFloatOptional): Boolean; static;
      class operator GreaterThanOrEqual(const ALeft, ARight: TFloatOptional): Boolean; inline; static;
      class operator LessThanOrEqual(const ALeft, ARight: TFloatOptional): Boolean; inline; static;
      class operator Equal(const ALeft, ARight: TFloatOptional): Boolean; static;
      class operator Equal(const ALeft: TFloatOptional; const ARight: Single): Boolean; static;
      class operator NotEqual(const ALeft, ARight: TFloatOptional): Boolean; inline; static;
      class operator NotEqual(const ALeft: TFloatOptional; const ARight: Single): Boolean; inline; static;

      property Value: Single read GetValue write SetValue;
      property IsUndefined: Boolean read FIsUndefined;
    end;
  private type
    TEdgeValues = array [TYogaEdge] of TYogaValue;
    TDimension = (Width, Height);
    TDimensionValues = array [TDimension] of TYogaValue;
  private const
    DEFAULT_EDGE_VALUES: TEdgeValues = (
      (FValue: 0; FUnits: TYogaUnit.Undefined),
      (FValue: 0; FUnits: TYogaUnit.Undefined),
      (FValue: 0; FUnits: TYogaUnit.Undefined),
      (FValue: 0; FUnits: TYogaUnit.Undefined),
      (FValue: 0; FUnits: TYogaUnit.Undefined),
      (FValue: 0; FUnits: TYogaUnit.Undefined),
      (FValue: 0; FUnits: TYogaUnit.Undefined),
      (FValue: 0; FUnits: TYogaUnit.Undefined),
      (FValue: 0; FUnits: TYogaUnit.Undefined));
    DEFAULT_DIMENSIONS_AUTO: TDimensionValues = (
      (FValue: 0; FUnits: TYogaUnit.Auto),
      (FValue: 0; FUnits: TYogaUnit.Auto));
    DEFAULT_DIMENSIONS_UNDEFINED: TDimensionValues = (
      (FValue: 0; FUnits: TYogaUnit.Undefined),
      (FValue: 0; FUnits: TYogaUnit.Undefined));
    DIM: array [TYogaFlexDirection] of TDimension = (
      TDimension.Height, TDimension.Height, TDimension.Width, TDimension.Width);
    POS: array [TYogaFlexDirection] of TYogaEdge = (
      TYogaEdge.Top, TYogaEdge.Bottom, TYogaEdge.Left, TYogaEdge.Right);
    LEADING: array [TYogaFlexDirection] of TYogaEdge = (
      TYogaEdge.Top, TYogaEdge.Bottom, TYogaEdge.Left, TYogaEdge.Right);
    TRAILING: array [TYogaFlexDirection] of TYogaEdge = (
      TYogaEdge.Bottom, TYogaEdge.Top, TYogaEdge.Right, TYogaEdge.Left);
    FLOAT_OPT_ZERO: TFloatOptional = (FValue: 0; FIsUndefined: False);
  private type
    TStyle = record
    public
      Direction: TYogaDirection;
      FlexDirection: TYogaFlexDirection;
      JustifyContent: TYogaJustify;
      AlignContent: TYogaAlign;
      AlignItems: TYogaAlign;
      AlignSelf: TYogaAlign;
      PositionType: TYogaPositionType;
      FlexWrap: TYogaWrap;
      Overflow: TYogaOverflow;
      Display: TYogaDisplay;
      Flex: TFloatOptional;
      FlexGrow: TFloatOptional;
      FlexShrink: TFloatOptional;
      FlexBasis: TYogaValue;
      Margin: TEdgeValues;
      Position: TEdgeValues;
      Padding: TEdgeValues;
      Dimensions: TDimensionValues;
      MinDimensions: TDimensionValues;
      MaxDimensions: TDimensionValues;
      AspectRatio: TFloatOptional;
    public
      procedure Init; inline;
      class operator Equal(const ALeft, ARight: TStyle): Boolean; static;
      class operator NotEqual(const ALeft, ARight: TStyle): Boolean; inline; static;
    end;
  private type
    TPositionFloats = array [TYogaEdge.Left..TYogaEdge.Bottom] of Single;
    TDimensionFloats = array [TDimension] of Single;
    TMarginFloats = array [TYogaEdge.Left..TYogaEdge.Stop] of Single;
  private type
    TCachedMeasurement = record
    public
      AvailableWidth: Single;
      AvailableHeight: Single;
      ComputedWidth: Single;
      ComputedHeight: Single;
      WidthMeasureMode: TYogaMeasureMode;
      HeightMeasureMode: TYogaMeasureMode;
    public
      procedure Init; inline;
    end;
    PCachedMeasurement = ^TCachedMeasurement;
  private type
    TLayout = record
    public
      Position: TPositionFloats;
      Dimensions: TDimensionFloats;
      Margin: TMarginFloats;
      Padding: TMarginFloats;

      ComputedFlexBasisGeneration: Cardinal;
      ComputedFlexBasis: TFloatOptional;
      GenerationCount: Cardinal;
      NextCachedMeasurementsIndex: Integer;
      CachedMeasurements: array [0..MAX_CACHED_RESULT_COUNT - 1] of TCachedMeasurement;
      MeasuredDimensions: TDimensionFloats;
      CachedLayout: TCachedMeasurement;

      Direction: TYogaDirection;
      LastParentDirection: TYogaDirection;
      HadOverflow: Boolean;
    public
      procedure Init;
    end;
  private type
    { This struct is an helper model to hold the data for step 4 of flexbox
      algo, which is collecting the flex items in a line.
      - ItemsOnLine: Number of items which can fit in a line considering the
        available Inner dimension, the flex items computed flexbasis and their
        margin. It may be different than the difference between start and end
        indicates because we skip over absolute-positioned items.

      - SizeConsumedOnCurrentLine: It is accumulation of the dimensions and
        margin of all the children on the current line. This will be used in
        order to either set the dimensions of the node if none already exist or
        to compute the remaining space left for the flexible children.

      - TotalFlexGrowFactors: total flex grow factors of flex items which are to
        be layed in the current line

      - TotalFlexShrinkFactors: total flex shrink factors of flex items which
        are to be layed in the current line

      - EndOfLineIndex: Its the end index of the last flex item which was
        examined and it may or may not be part of the current line(as it may be
        absolutely positioned or inculding it may have caused to overshoot
        AvailableInnerDim)

      - RelativeChildren: Maintain a vector of the child nodes that can shrink
        and/or grow. }
    TCollectFlexItemsRowValues = record
    public
      ItemsOnLine: Integer;
      SizeConsumedOnCurrentLine: Single;
      TotalFlexGrowFactors: Single;
      TotalFlexShrinkScaledFactors: Single;
      EndOfLineIndex: Integer;
      RelativeChildren: TArray<TYogaNode>;
      RelativeChildCount: Integer;
      RemainingFreeSpace: Single;

      { The size of the MainDim for the row after considering size, padding,
        margin and border of flex items. This is used to calculate MaxLineDim
        after going through all the rows to decide on the main axis size of
        owner. }
      MainDim: Single;

      { The size of the CrossDim for the row after considering size, padding,
        margin and border of flex items. Used for calculating containers
        CrossSize. }
      CrossDim: Single;
    public
      procedure AddRelativeChild(const AChild: TYogaNode);
    end;
  private
    [unsafe] FParent: TYogaNode;  // Reference
    FChildren: TArray<TYogaNode>; // References
    FChildCount: Integer;
    FStyle: TStyle;
    FLayout: TLayout;
    FLineIndex: Integer;
    FResolvedDimensions: TDimensionValues;
    FNodeType: TYogaNodeType;
    FHasNewLayout: Boolean;
    FIsDirty: Boolean;
    FOnMeasure: TYogaMeasureEvent;
    FOnBaseline: TYogaBaselineEvent;
    procedure SetAlignContent(const AValue: TYogaAlign);
    procedure SetAlignItems(const AValue: TYogaAlign);
    procedure SetAlignSelf(const AValue: TYogaAlign);
    function GetAspectRatio: Single;
    procedure SetAspectRatio(const AValue: Single);
    function GetChild(const AIndex: Integer): TYogaNode;
    procedure SetDirection(const AValue: TYogaDirection);
    procedure SetDisplay(const AValue: TYogaDisplay);
    function GetFlex: Single;
    procedure SetFlex(const AValue: Single);
    function GetFlexBasis: TYogaValue;
    procedure SetFlexBasis(const AValue: TYogaValue);
    procedure SetFlexDirection(const AValue: TYogaFlexDirection);
    function GetFlexGrow: Single;
    procedure SetFlexGrow(const AValue: Single);
    function GetFlexShrink: Single;
    procedure SetFlexShrink(const AValue: Single);
    procedure SetFlexWrap(const AValue: TYogaWrap);
    function GetHeight: TYogaValue;
    procedure SetHeight(const AValue: TYogaValue);
    function GetIsMeasureDefined: Boolean;
    function GetIsBaselineDefined: Boolean;
    procedure SetJustifyContent(const AValue: TYogaJustify);
    function GetLayoutMargin(const AIndex: TYogaEdge): Single;
    function GetLayoutPadding(const AIndex: TYogaEdge): Single;
    function GetMargin(const AIndex: TYogaEdge): TYogaValue;
    procedure SetMargin(const AIndex: TYogaEdge; const AValue: TYogaValue);
    function GetMaxWidth: TYogaValue;
    procedure SetMaxWidth(const AValue: TYogaValue);
    function GetMaxHeight: TYogaValue;
    procedure SetMaxHeight(const AValue: TYogaValue);
    function GetMinWidth: TYogaValue;
    procedure SetMinWidth(const AValue: TYogaValue);
    function GetMinHeight: TYogaValue;
    procedure SetMinHeight(const AValue: TYogaValue);
    procedure SetOnMeasure(const AValue: TYogaMeasureEvent);
    procedure SetOverflow(const AValue: TYogaOverflow);
    function GetPadding(const AIndex: TYogaEdge): TYogaValue;
    procedure SetPadding(const AIndex: TYogaEdge; const AValue: TYogaValue);
    function GetPos(const AIndex: TYogaEdge): TYogaValue;
    procedure SetPos(const AIndex: TYogaEdge; const AValue: TYogaValue);
    procedure SetPositionType(const AValue: TYogaPositionType);
    function GetWidth: TYogaValue;
    procedure SetWidth(const AValue: TYogaValue);
  private
    procedure SetDirty(const AIsDirty: Boolean);
    procedure MarkDirtyAndPropogate;
    procedure ResolveDimension;
    function ResolveDirection(const AParentDirection: TYogaDirection): TYogaDirection;
    function ResolveFlexGrow: Single;
    function ResolveFlexShrink: Single;
    procedure ResolveFlexibleLength(
      var ACollectedFlexItemsValues: TCollectFlexItemsRowValues; const AMainAxis,
      ACrossAxis: TYogaFlexDirection; const AMainAxisParentSize,
      AAvailableInnerMainDim, AAvailableInnerCrossDim, AAvailableInnerWidth,
      AAvailableInnerHeight: Single; const AFlexBasisOverflows: Boolean;
      const AMeasureModeCrossDim: TYogaMeasureMode;
      const APerformLayout: Boolean);
    class procedure DistributeFreeSpaceFirstPass(
      var ACollectedFlexItemsValues: TCollectFlexItemsRowValues;
      const AMainAxis: TYogaFlexDirection; const AMainAxisParentSize,
      AAvailableInnerMainDim, AAvailableInnerWidth: Single); static;
    function DistributeFreeSpaceSecondPass(
      var ACollectedFlexItemsValues: TCollectFlexItemsRowValues;
      const AMainAxis, ACrossAxis: TYogaFlexDirection;
      const AMainAxisParentSize, AAvailableInnerMainDim, AAvailableInnerCrossDim,
      AAvailableInnerWidth, AAvailableInnerHeight: Single;
      const AFlexBasisOverflows: Boolean;
      const AMeasureModeCrossDim: TYogaMeasureMode;
      const APerformLayout: Boolean): Single;
    function ResolveFlexBasisPtr: TYogaValue;
    function IsFlexible: Boolean;
    function IsBaselineLayout: Boolean;
    function Baseline: Single;
    function IsStyleDimDefined(const AAxis: TYogaFlexDirection;
      const AParentSize: Single): Boolean; inline;
    function IsLayoutDimDefined(const AAxis: TYogaFlexDirection): Boolean; inline;
    function IsLeadingPositionDefined(const AAxis: TYogaFlexDirection): Boolean;
    function GetLeadingPosition(const AAxis: TYogaFlexDirection;
      const AAxisSize: Single): TFloatOptional;
    function IsTrailingPositionDefined(const AAxis: TYogaFlexDirection): Boolean;
    function GetTrailingPosition(const AAxis: TYogaFlexDirection;
      const AAxisSize: Single): TFloatOptional;
    function MarginLeadingValue(const AAxis: TYogaFlexDirection): TYogaValue;
    function MarginTrailingValue(const AAxis: TYogaFlexDirection): TYogaValue;
    function GetMarginForAxis(const AAxis: TYogaFlexDirection;
      const AWidthSize: Single): TFloatOptional;
    function PaddingForAxis(const AAxis: TYogaFlexDirection;
      const AWidthSize: Single): Single; inline;
    function GetLeadingMargin(const AAxis: TYogaFlexDirection;
      const AWidthSize: Single): TFloatOptional;
    function GetTrailingMargin(const AAxis: TYogaFlexDirection;
      const AWidthSize: Single): TFloatOptional;
    function GetLeadingPadding(const AAxis: TYogaFlexDirection;
      const AWidthSize: Single): TFloatOptional;
    function GetTrailingPadding(const AAxis: TYogaFlexDirection;
      const AWidthSize: Single): TFloatOptional;
    function BoundAxis(const AAxis: TYogaFlexDirection; const AValue, AAxisSize,
      AWidthSize: Single): Single; inline;
    function BoundAxisWithinMinAndMax(const AAxis: TYogaFlexDirection;
      const AValue, AAxisSize: Single): TFloatOptional; inline;
    function LayoutInternal(const AAvailableWidth, AAvailableHeight: Single;
      const AParentDirection: TYogaDirection; const AWidthMeasureMode,
      AHeightMeasureMode: TYogaMeasureMode; const AParentWidth,
      AParentHeight: Single; const APerformLayout: Boolean): Boolean;
    procedure LayoutImpl(const AAvailableWidth, AAvailableHeight: Single;
      const AParentDirection: TYogaDirection; const AWidthMeasureMode,
      AHeightMeasureMode: TYogaMeasureMode; const AParentWidth,
      AParentHeight: Single; const APerformLayout: Boolean);
    procedure AbsoluteLayoutChild(const AChild: TYogaNode; const AWidth: Single;
      const AWidthMode: TYogaMeasureMode; const AHeight: Single;
      const ADirection: TYogaDirection);
    procedure DoMeasureSetMeasuredDimensions(const AAvailableWidth,
      AAvailableHeight: Single; const AWidthMeasureMode,
      AHeightMeasureMode: TYogaMeasureMode; const AParentWidth,
      AParentHeight: Single);
    procedure EmptyContainerSetMeasuredDimensions(const AAvailableWidth,
      AAvailableHeight: Single; const AWidthMeasureMode,
      AHeightMeasureMode: TYogaMeasureMode; const AParentWidth,
      AParentHeight: Single);
    function FixedSizeSetMeasuredDimensions(const AAvailableWidth,
      AAvailableHeight: Single; const AWidthMeasureMode,
      AHeightMeasureMode: TYogaMeasureMode; const AParentWidth,
      AParentHeight: Single): Boolean;
    function CalculateAvailableInnerDim(const AAxis: TYogaFlexDirection;
      const AAvailableDim, AParentDim: Single): Single;
    procedure ComputeFlexBasisForChildren(const AAvailableInnerWidth,
      AAvailableInnerHeight: Single; const AWidthMeasureMode,
      AHeightMeasureMode: TYogaMeasureMode; const ADirection: TYogaDirection;
      const AMainAxis: TYogaFlexDirection; const APerformLayout: Boolean;
      var ATotalOuterFlexBasis: Single);
    procedure ComputeFlexBasisForChild(const AChild: TYogaNode;
      const AWidth: Single; const AWidthMode: TYogaMeasureMode; const AHeight,
      AParentWidth, AParentHeight: Single; const AHeightMode: TYogaMeasureMode;
      const ADirection: TYogaDirection);
    procedure CalculateCollectFlexItemsRowValues(
      const AParentDirection: TYogaDirection; const AMainAxisParentSize,
      AAvailableInnerWidth, AAvailableInnerMainDim: Single;
      const AStartOfLineIndex, ALineCount: Integer;
      out AValues: TCollectFlexItemsRowValues);
    procedure JustifyMainAxis(var ACollectedFlexItemValues: TCollectFlexItemsRowValues;
      const AStartOfLineIndex: Integer; const AMainAxis, ACrossAxis: TYogaFlexDirection;
      const AMeasureModeMainDim, AMeasureModeCrossDim: TYogaMeasureMode;
      const AMainAxisParentSize, AParentWidth, AAvailableInnerMainDim,
      AAvailableInnerCrossDim, AAvailableInnerWidth: Single;
      const APerformLayout: Boolean);
    function AlignItem(const AChild: TYogaNode): TYogaAlign; inline;
    function DimWithMargin(const AAxis: TYogaFlexDirection;
      const AWidthSize: Single): Single; inline;
    procedure ConstrainMaxSizeForMode(const AAxis: TYogaFlexDirection;
      const AParentAxisSize, AParentWidth: Single; var AMode: TYogaMeasureMode;
      var ASize: Single);
    procedure SetPosition(const ADirection: TYogaDirection; const AMainSize,
      ACrossSize, AParentWidth: Single);
    procedure SetChildTrailingPosition(const AChild: TYogaNode;
      const AAxis: TYogaFlexDirection);
    procedure ZeroOutLayoutRecursively;
    function RelativePosition(const AAxis: TYogaFlexDirection;
      const AAxisSize: Single): TFloatOptional;
    {$IFNDEF YOGA_NO_PIXEL_ALIGN}
    procedure RoundToPixelGrid(const AAbsoluteLeft, AAbsoluteTop: Single);
    {$ENDIF}
  private
    class function ComputedEdgeValue(const AEdges: TEdgeValues;
      const AEdge: TYogaEdge; const ADefault: TYogaValue): TYogaValue; static;
    class function CanUseCachedMeasurement(const AWidthMode: TYogaMeasureMode;
      const AWidth: Single; const AHeightMode: TYogaMeasureMode;
      const AHeight: Single; const ALastWidthMode: TYogaMeasureMode;
      const ALastWidth: Single; const ALastHeightMode: TYogaMeasureMode;
      const ALastHeight, ALastComputedWidth, ALastComputedHeight, AMarginRow,
      AMarginColumn: Single): Boolean; static;
    class function EdgeValuesEqual(const ALeft, ARight: TEdgeValues): Boolean; static;
    class function DimensionValuesEqual(const ALeft, ARight: TDimensionValues): Boolean; static;
  private
    class function GetStyleValue(const AValue: TYogaValue): TYogaValue; inline; static;
    procedure SetStyleValue(var AValue: TYogaValue; const ANewValue: Single);
    procedure SetStyleValuePercent(var AValue: TYogaValue; const ANewValue: Single);
    procedure SetStyleValueAuto(var AValue: TYogaValue);

    class function GetStyleEdgeValue(const AValues: TEdgeValues;
      const AEdge: TYogaEdge): TYogaValue; static;
    procedure SetStyleEdgeValue(var AValues: TEdgeValues;
      const AEdge: TYogaEdge; const AValue: Single);
    procedure SetStyleEdgeValuePercent(var AValues: TEdgeValues;
      const AEdge: TYogaEdge; const AValue: Single);
    procedure SetStyleEdgeValueAuto(var AValues: TEdgeValues;
      const AEdge: TYogaEdge);

    function GetLayoutValue(const AValues: TMarginFloats;
      const AEdge: TYogaEdge): Single; inline;
  {$ENDREGION 'Internal Declarations'}
  public
    constructor Create; overload;

    { This frees the children }
    destructor Destroy; override;

    procedure MarkDirty;
    procedure CopyStyle(const ASourceNode: TYogaNode);

    procedure Add(const AChild: TYogaNode);
    procedure Insert(const AIndex: Integer; const AChild: TYogaNode);

    { This frees the child }
    procedure Delete(const AIndex: Integer);
    procedure Remove(const AChild: TYogaNode);

    { This frees the children }
    procedure Clear;

    function IndexOf(const AChild: TYogaNode): Integer;

    { Does a recursive calculation }
    procedure CalculateLayout; overload;
    procedure CalculateLayout(const AAvailableWidth, AAvailableHeight: Single); overload;
    procedure CalculateLayout(const ADirection: TYogaDirection); overload;
    procedure CalculateLayout(const AAvailableWidth, AAvailableHeight: Single;
      const ADirection: TYogaDirection); overload;

    function GetEnumerator: TEnumerator;

    property NodeType: TYogaNodeType read FNodeType write FNodeType;
    property IsDirty: Boolean read FIsDirty;
    property HasNewLayout: Boolean read FHasNewLayout write FHasNewLayout;
    property Parent: TYogaNode read FParent;
    property IsMeasureDefined: Boolean read GetIsMeasureDefined;
    property IsBaselineDefined: Boolean read GetIsBaselineDefined;

    { Style related (input) }

    { @Container }
    property Direction: TYogaDirection read FStyle.Direction write SetDirection;

    { @Container }
    property FlexDirection: TYogaFlexDirection read FStyle.FlexDirection write SetFlexDirection;

    { @Container }
    property JustifyContent: TYogaJustify read FStyle.JustifyContent write SetJustifyContent;

    { @Container }
    property Display: TYogaDisplay read FStyle.Display write SetDisplay;

    { @Container }
    property AlignItems: TYogaAlign read FStyle.AlignItems write SetAlignItems;

    { @Item }
    property AlignSelf: TYogaAlign read FStyle.AlignSelf write SetAlignSelf;

    { @Container }
    property AlignContent: TYogaAlign read FStyle.AlignContent write SetAlignContent;

    { @Item (non-root) }
    property PositionType: TYogaPositionType read FStyle.PositionType write SetPositionType;

    { @Container }
    property FlexWrap: TYogaWrap read FStyle.FlexWrap write SetFlexWrap;

    { @Item (non-root) }
    property Flex: Single read GetFlex write SetFlex;
    property FlexGrow: Single read GetFlexGrow write SetFlexGrow;
    property FlexShrink: Single read GetFlexShrink write SetFlexShrink;
    property FlexBasis: TYogaValue read GetFlexBasis write SetFlexBasis;

    { @Item }
    property Width: TYogaValue read GetWidth write SetWidth;
    property Height: TYogaValue read GetHeight write SetHeight;
    property MaxWidth: TYogaValue read GetMaxWidth write SetMaxWidth;
    property MaxHeight: TYogaValue read GetMaxHeight write SetMaxHeight;
    property MinWidth: TYogaValue read GetMinWidth write SetMinWidth;
    property MinHeight: TYogaValue read GetMinHeight write SetMinHeight;

    { @Item }
    property AspectRatio: Single read GetAspectRatio write SetAspectRatio;

    { @Container? }
    property Overflow: TYogaOverflow read FStyle.Overflow write SetOverflow;

    { @Item (non-root) }
    property Left: TYogaValue index TYogaEdge.Left read GetPos write SetPos;
    property Top: TYogaValue index TYogaEdge.Top read GetPos write SetPos;
    property Right: TYogaValue index TYogaEdge.Right read GetPos write SetPos;
    property Bottom: TYogaValue index TYogaEdge.Bottom read GetPos write SetPos;
    property Start: TYogaValue index TYogaEdge.Start read GetPos write SetPos;
    property Stop: TYogaValue index TYogaEdge.Stop read GetPos write SetPos;
    property Positions[const AIndex: TYogaEdge]: TYogaValue read GetPos write SetPos;

    { @Item (non-root) }
    property Margin: TYogaValue index TYogaEdge.All read GetMargin write SetMargin;
    property MarginLeft: TYogaValue index TYogaEdge.Left read GetMargin write SetMargin;
    property MarginTop: TYogaValue index TYogaEdge.Top read GetMargin write SetMargin;
    property MarginRight: TYogaValue index TYogaEdge.Right read GetMargin write SetMargin;
    property MarginBottom: TYogaValue index TYogaEdge.Bottom read GetMargin write SetMargin;
    property MarginStart: TYogaValue index TYogaEdge.Start read GetMargin write SetMargin;
    property MarginStop: TYogaValue index TYogaEdge.Stop read GetMargin write SetMargin;
    property MarginHorizontal: TYogaValue index TYogaEdge.Horizontal read GetMargin write SetMargin;
    property MarginVertical: TYogaValue index TYogaEdge.Vertical read GetMargin write SetMargin;
    property Margins[const AIndex: TYogaEdge]: TYogaValue read GetMargin write SetMargin;

    { @Item }
    property Padding: TYogaValue index TYogaEdge.All read GetPadding write SetPadding;
    property PaddingLeft: TYogaValue index TYogaEdge.Left read GetPadding write SetPadding;
    property PaddingTop: TYogaValue index TYogaEdge.Top read GetPadding write SetPadding;
    property PaddingRight: TYogaValue index TYogaEdge.Right read GetPadding write SetPadding;
    property PaddingBottom: TYogaValue index TYogaEdge.Bottom read GetPadding write SetPadding;
    property PaddingStart: TYogaValue index TYogaEdge.Start read GetPadding write SetPadding;
    property PaddingStop: TYogaValue index TYogaEdge.Stop read GetPadding write SetPadding;
    property PaddingHorizontal: TYogaValue index TYogaEdge.Horizontal read GetPadding write SetPadding;
    property PaddingVertical: TYogaValue index TYogaEdge.Vertical read GetPadding write SetPadding;
    property Paddings[const AIndex: TYogaEdge]: TYogaValue read GetPadding write SetPadding;

    { Layout related (output) }

    { These are relative to the parent }
    property LayoutLeft: Single read FLayout.Position[TYogaEdge.Left];
    property LayoutTop: Single read FLayout.Position[TYogaEdge.Top];
    property LayoutRight: Single read FLayout.Position[TYogaEdge.Right];
    property LayoutBottom: Single read FLayout.Position[TYogaEdge.Bottom];
    property LayoutWidth: Single read FLayout.Dimensions[TDimension.Width];
    property LayoutHeight: Single read FLayout.Dimensions[TDimension.Height];

    property LayoutMarginLeft: Single index TYogaEdge.Left read GetLayoutMargin;
    property LayoutMarginTop: Single index TYogaEdge.Top read GetLayoutMargin;
    property LayoutMarginRight: Single index TYogaEdge.Right read GetLayoutMargin;
    property LayoutMarginBottom: Single index TYogaEdge.Bottom read GetLayoutMargin;
    property LayoutMarginStart: Single index TYogaEdge.Start read GetLayoutMargin;
    property LayoutMarginStop: Single index TYogaEdge.Stop read GetLayoutMargin;
    property LayoutMargins[const AIndex: TYogaEdge]: Single read GetLayoutMargin;

    property LayoutPaddingLeft: Single index TYogaEdge.Left read GetLayoutPadding;
    property LayoutPaddingTop: Single index TYogaEdge.Top read GetLayoutPadding;
    property LayoutPaddingRight: Single index TYogaEdge.Right read GetLayoutPadding;
    property LayoutPaddingBottom: Single index TYogaEdge.Bottom read GetLayoutPadding;
    property LayoutPaddingStart: Single index TYogaEdge.Start read GetLayoutPadding;
    property LayoutPaddingStop: Single index TYogaEdge.Stop read GetLayoutPadding;
    property LayoutPaddings[const AIndex: TYogaEdge]: Single read GetLayoutPadding;

    property LayoutDirection: TYogaDirection read FLayout.Direction;
    property LayoutHadOverflow: Boolean read FLayout.HadOverflow;

    property ChildCount: Integer read FChildCount;
    property Children[const AIndex: Integer]: TYogaNode read GetChild; default;

    property OnMeasure: TYogaMeasureEvent read FOnMeasure write SetOnMeasure;
    property OnBaseline: TYogaBaselineEvent read FOnBaseline write FOnBaseline;
  end;

function YogaIsUndefined(const AValue: Single): Boolean; inline;
function YogaMax(const AA, AB: Single): Single;

implementation

uses
  System.Math,
  System.SysUtils;

const
  YOGA_VALUE_ZERO: TYogaValue = (FValue: 0; FUnits: TYogaUnit.Point);
  YOGA_VALUE_UNDEFINED: TYogaValue = (FValue: YOGA_UNDEFINED; FUnits: TYogaUnit.Undefined);
  YOGA_VALUE_AUTO: TYogaValue = (FValue: YOGA_UNDEFINED; FUnits: TYogaUnit.Auto);

function YogaIsUndefined(const AValue: Single): Boolean; inline;
begin
  Result := (AValue >= 10e8) or (AValue <= -10e8);
end;

function YogaEqual(const ALeft, ARight: Single): Boolean;
var
  UL, UR: Boolean;
begin
  UL := YogaIsUndefined(ALeft);
  UR := YogaIsUndefined(ARight);
  if (not UL) and (not UL) then
    Result := (Abs(ALeft - ARight) < 0.0001)
  else
    Result := (UL = UR);
end;

function YogaSanitize(const AValue: Single): Single;
begin
  if (YogaIsUndefined(AValue)) then
    Result := 0.0
  else
    Result := AValue;
end;

function YogaMax(const AA, AB: Single): Single;
var
  UA: Boolean;
begin
  UA := YogaIsUndefined(AA);
  if (not UA) and (not YogaIsUndefined(AB)) then
    Result := Max(AA, AB)
  else if (UA) then
    Result := AB
  else
    Result := AA;
end;

function YogaMin(const AA, AB: Single): Single;
var
  UA: Boolean;
begin
  UA := YogaIsUndefined(AA);
  if (not UA) and (not YogaIsUndefined(AB)) then
    Result := Min(AA, AB)
  else if (UA) then
    Result := AB
  else
    Result := AA;
end;

{$IFNDEF YOGA_NO_PIXEL_ALIGN}
function YogaRoundValueToPixelGrid(const AValue: Single; const AForceCeil,
  AForceFloor: Boolean): Single;
var
  Fractial: Single;
begin
  Result := AValue;
  Fractial := Frac(Result);
  if (YogaEqual(Fractial, 0.0)) then
    { First we check if the value is already rounded }
    Result := Result - Fractial
  else if (YogaEqual(Fractial, 1.0)) then
    Result := Result - Fractial + 1.0
  else if (AForceCeil) then
    { Next we check if we need to use forced rounding }
    Result := Result - Fractial + 1.0
  else if (AForceFloor) then
    Result := Result - Fractial
  else
  begin
    { Finally we just round the value }
    Result := Result - Fractial;
    if (not YogaIsUndefined(Fractial)) and ((Fractial > 0.5) or YogaEqual(Fractial, 0.5)) then
      Result := Result + 1.0;
  end;

  if (YogaIsUndefined(Result)) then
    Result := YOGA_UNDEFINED;
end;
{$ENDIF}

type
  TYogaValueHelper = record helper for TYogaValue
  public
    function Resolve(const AParentSize: Single): TYogaNode.TFloatOptional; inline;
    function ResolveMargin(const AParentSize: Single): TYogaNode.TFloatOptional; inline;
  end;

type
  TYogaFlexDirectionHelper = record helper for TYogaFlexDirection
  public
    function IsRow: Boolean; inline;
    function IsColumn: Boolean; inline;
    function Resolve(const ADirection: TYogaDirection): TYogaFlexDirection; inline;
    function Cross(const ADirection: TYogaDirection): TYogaFlexDirection;
  end;

type
  TYogaMeasureModeHelper = record helper for TYogaMeasureMode
  public
    function SizeIsExactAndMatchesOldMeasuresSize(const ASize,
      ALastComputedSize: Single): Boolean; inline;
    function OldSizeIsUnspecifiedAndStillFits(const ASize: Single;
      const ALastSizeMode: TYogaMeasureMode;
      const ALastComputedSize: Single): Boolean; inline;
    function NewMeasureSizeIsStricterAndStillValid(const ASize: Single;
      const ALastSizeMode: TYogaMeasureMode;
      const ALastSize, ALastComputedSize: Single): Boolean; inline;
  end;

{ TYogaValue }

class function TYogaValue.Auto: TYogaValue;
begin
  Result.FValue := 0;
  Result.FUnits := TYogaUnit.Auto;
end;

class operator TYogaValue.Equal(const ALeft, ARight: TYogaValue): Boolean;
begin
  if (ALeft.FUnits <> ARight.FUnits) then
    Exit(False);

  if (ALeft.FUnits = TYogaUnit.Undefined)
    or ((YogaIsUndefined(ALeft.FValue)) and (YogaIsUndefined(ARight.FValue)))
  then
    Exit(True);

  Result := (Abs(ALeft.FValue - ARight.FValue) < 0.0001);
end;

class operator TYogaValue.Implicit(const AValue: Single): TYogaValue;
begin
  Result.FValue := AValue;
  if YogaIsUndefined(AValue) then
    Result.FUnits := TYogaUnit.Undefined
  else
    Result.FUnits := TYogaUnit.Point;
end;

class operator TYogaValue.NotEqual(const ALeft, ARight: TYogaValue): Boolean;
begin
  Result := not (ALeft = ARight);
end;

class function TYogaValue.Percent(const AValue: Single): TYogaValue;
begin
  Result.FValue := AValue;
  if YogaIsUndefined(AValue) then
    Result.FUnits := TYogaUnit.Undefined
  else
    Result.FUnits := TYogaUnit.Percent;
end;

class function TYogaValue.Point(const AValue: Single): TYogaValue;
begin
  Result.FValue := AValue;
  if YogaIsUndefined(AValue) then
    Result.FUnits := TYogaUnit.Undefined
  else
    Result.FUnits := TYogaUnit.Point;
end;

procedure TYogaValue.SetAuto;
begin
  FValue := 0;
  FUnits := TYogaUnit.Auto;
end;

procedure TYogaValue.SetPercent(const AValue: Single);
begin
  FValue := AValue;
  if YogaIsUndefined(AValue) then
    FUnits := TYogaUnit.Undefined
  else
    FUnits := TYogaUnit.Percent;
end;

procedure TYogaValue.SetPoint(const AValue: Single);
begin
  FValue := AValue;
  if YogaIsUndefined(AValue) then
    FUnits := TYogaUnit.Undefined
  else
    FUnits := TYogaUnit.Point;
end;

procedure TYogaValue.SetUndefined;
begin
  FValue := YOGA_UNDEFINED;
  FUnits := TYogaUnit.Undefined;
end;

class function TYogaValue.Undefined: TYogaValue;
begin
  Result.FValue := YOGA_UNDEFINED;
  Result.FUnits := TYogaUnit.Undefined;
end;

{ TYogaValueHelper }

function TYogaValueHelper.Resolve(
  const AParentSize: Single): TYogaNode.TFloatOptional;
begin
  case FUnits of
    TYogaUnit.Point:
      Result.Init(FValue);

    TYogaUnit.Percent:
      Result.Init(FValue * AParentSize * 0.01);
  else
    Result.Init;
  end;
end;

function TYogaValueHelper.ResolveMargin(
  const AParentSize: Single): TYogaNode.TFloatOptional;
begin
  if (FUnits = TYogaUnit.Auto) then
    Result.Init(0.0)
  else
    Result := Resolve(AParentSize);
end;

{ TYogaFlexDirectionHelper }

function TYogaFlexDirectionHelper.Cross(
  const ADirection: TYogaDirection): TYogaFlexDirection;
begin
  if (IsColumn) then
    Result := TYogaFlexDirection.Row.Resolve(ADirection)
  else
    Result := TYogaFlexDirection.Column.Resolve(ADirection);
end;

function TYogaFlexDirectionHelper.IsColumn: Boolean;
begin
  Result := (Self in [TYogaFlexDirection.Column, TYogaFlexDirection.ColumnReverse]);
end;

function TYogaFlexDirectionHelper.IsRow: Boolean;
begin
  Result := (Self in [TYogaFlexDirection.Row, TYogaFlexDirection.RowReverse]);
end;

function TYogaFlexDirectionHelper.Resolve(
  const ADirection: TYogaDirection): TYogaFlexDirection;
begin
  if (ADirection = TYogaDirection.RTL) then
  begin
    if (Self = TYogaFlexDirection.Row) then
      Exit(TYogaFlexDirection.RowReverse)
    else if (Self = TYogaFlexDirection.RowReverse) then
      Exit(TYogaFlexDirection.Row);
  end;
  Result := Self;
end;

{ TYogaMeasureModeHelper }

function TYogaMeasureModeHelper.NewMeasureSizeIsStricterAndStillValid(
  const ASize: Single; const ALastSizeMode: TYogaMeasureMode; const ALastSize,
  ALastComputedSize: Single): Boolean;
begin
  Result := (ALastSizeMode = TYogaMeasureMode.AtMost)
    and (Self = TYogaMeasureMode.AtMost)
    and (not YogaIsUndefined(ALastSize))
    and (not YogaIsUndefined(ASize))
    and (not YogaIsUndefined(ALastComputedSize))
    and (ALastSize > ASize)
    and ((ALastComputedSize <= ASize) or YogaEqual(ASize, ALastComputedSize));
end;

function TYogaMeasureModeHelper.OldSizeIsUnspecifiedAndStillFits(
  const ASize: Single; const ALastSizeMode: TYogaMeasureMode;
  const ALastComputedSize: Single): Boolean;
begin
  Result := (Self = TYogaMeasureMode.AtMost)
    and (ALastSizeMode = TYogaMeasureMode.Undefined)
    and ((ASize >= ALastComputedSize) or YogaEqual(ASize, ALastComputedSize));
end;

function TYogaMeasureModeHelper.SizeIsExactAndMatchesOldMeasuresSize(
  const ASize, ALastComputedSize: Single): Boolean;
begin
  Result := (Self = TYogaMeasureMode.Exactly) and YogaEqual(ASize, ALastComputedSize);
end;

{ TYogaNode }

constructor TYogaNode.Create;
begin
  inherited Create;
  FStyle.Init;
  FLayout.Init;
  FResolvedDimensions[TDimension.Width].SetUndefined;
  FResolvedDimensions[TDimension.Height].SetUndefined;
  FHasNewLayout := True;
end;

procedure TYogaNode.AbsoluteLayoutChild(const AChild: TYogaNode;
  const AWidth: Single; const AWidthMode: TYogaMeasureMode;
  const AHeight: Single; const ADirection: TYogaDirection);
var
  MainAxis, CrossAxis: TYogaFlexDirection;
  IsMainAxisRow: Boolean;
  ChildWidth, ChildHeight, MarginRow, MarginColumn, Value: Single;
  ChildWidthMeasureMode, ChildHeightMeasureMode: TYogaMeasureMode;
begin
  MainAxis := FStyle.FlexDirection.Resolve(ADirection);
  CrossAxis := MainAxis.Cross(ADirection);
  IsMainAxisRow := MainAxis.IsRow;

  ChildWidth := YOGA_UNDEFINED;
  ChildHeight := YOGA_UNDEFINED;

  MarginRow := AChild.GetMarginForAxis(TYogaFlexDirection.Row, AWidth).Unwrap;
  MarginColumn := AChild.GetMarginForAxis(TYogaFlexDirection.Column, AWidth).Unwrap;

  if (AChild.IsStyleDimDefined(TYogaFlexDirection.Row, AWidth)) then
  begin
    ChildWidth := AChild.FResolvedDimensions[TDimension.Width].Resolve(AWidth).Unwrap
      + MarginRow;
  end
  else
  begin
    { If the child doesn't have a specified width, compute the width based
      on the left/right offsets if they're defined. }
    if (AChild.IsLeadingPositionDefined(TYogaFlexDirection.Row))
      and (AChild.IsTrailingPositionDefined(TYogaFlexDirection.Row)) then
    begin
      ChildWidth := FLayout.MeasuredDimensions[TDimension.Width] -
        (AChild.GetLeadingPosition(TYogaFlexDirection.Row, AWidth) +
         AChild.GetTrailingPosition(TYogaFlexDirection.Row, AWidth)).Unwrap;

      ChildWidth := AChild.BoundAxis(TYogaFlexDirection.Row, ChildWidth,
        AWidth, AWidth);
    end;
  end;

  if (AChild.IsStyleDimDefined(TYogaFlexDirection.Column, AHeight)) then
  begin
    ChildHeight := AChild.FResolvedDimensions[TDimension.Height].Resolve(AHeight).Unwrap
      + MarginColumn;
  end
  else
  begin
    { If the child doesn't have a specified height, compute the height based
      on the top/bottom offsets if they're defined. }
    if (AChild.IsLeadingPositionDefined(TYogaFlexDirection.Column))
      and (AChild.IsTrailingPositionDefined(TYogaFlexDirection.Column)) then
    begin
      ChildHeight := FLayout.MeasuredDimensions[TDimension.Height] -
        (AChild.GetLeadingPosition(TYogaFlexDirection.Column, AHeight) +
         AChild.GetTrailingPosition(TYogaFlexDirection.Column, AHeight)).Unwrap;

      ChildHeight := AChild.BoundAxis(TYogaFlexDirection.Column, ChildHeight,
        AHeight, AWidth);
    end;
  end;

  { Exactly one dimension needs to be defined for us to be able to do aspect
    ratio calculation. One dimension being the anchor and the other being
    flexible. }
  if (YogaIsUndefined(ChildWidth) xor YogaIsUndefined(ChildHeight)) then
  begin
    if (not AChild.FStyle.AspectRatio.IsUndefined) then
    begin
      if (YogaIsUndefined(ChildWidth)) then
        ChildWidth := MarginRow + (ChildHeight - MarginColumn) * AChild.FStyle.AspectRatio.Value
      else if (YogaIsUndefined(ChildHeight)) then
        ChildHeight := MarginColumn + (ChildWidth - MarginRow) / AChild.FStyle.AspectRatio.Value;
    end;
  end;

  { If we're still missing one or the other dimension, measure the content. }
  if (YogaIsUndefined(ChildWidth)) or (YogaIsUndefined(ChildHeight)) then
  begin
    if (YogaIsUndefined(ChildWidth)) then
      ChildWidthMeasureMode := TYogaMeasureMode.Undefined
    else
      ChildWidthMeasureMode := TYogaMeasureMode.Exactly;

    if (YogaIsUndefined(ChildHeight)) then
      ChildHeightMeasureMode := TYogaMeasureMode.Undefined
    else
      ChildHeightMeasureMode := TYogaMeasureMode.Exactly;

    { If the size of the owner is defined then try to constrain the absolute
      child to that size as well. This allows text within the absolute child to
      wrap to the size of its owner. This is the same behavior as many browsers
      implement. }
    if (not IsMainAxisRow) and (YogaIsUndefined(ChildWidth))
      and (AWidthMode <> TYogaMeasureMode.Undefined)
      and (not YogaIsUndefined(AWidth)) and (AWidth > 0) then
    begin
      ChildWidth := AWidth;
      ChildWidthMeasureMode := TYogaMeasureMode.AtMost;
    end;

    AChild.LayoutInternal(ChildWidth, ChildHeight, ADirection,
      ChildWidthMeasureMode, ChildHeightMeasureMode, ChildWidth, ChildHeight,
      False);

    ChildWidth := AChild.FLayout.MeasuredDimensions[TDimension.Width] +
      AChild.GetMarginForAxis(TYogaFlexDirection.Row, AWidth).Unwrap;

    ChildHeight := AChild.FLayout.MeasuredDimensions[TDimension.Height] +
      AChild.GetMarginForAxis(TYogaFlexDirection.Column, AWidth).Unwrap;
  end;

  AChild.LayoutInternal(ChildWidth, ChildHeight, ADirection,
    TYogaMeasureMode.Exactly, TYogaMeasureMode.Exactly, ChildWidth, ChildHeight,
    True);

  if (AChild.IsTrailingPositionDefined(MainAxis)) and
    (not AChild.IsLeadingPositionDefined(MainAxis)) then
  begin
    if (IsMainAxisRow) then
      Value := AWidth
    else
      Value := AHeight;

    AChild.FLayout.Position[LEADING[MainAxis]] :=
      FLayout.MeasuredDimensions[DIM[MainAxis]] -
      AChild.FLayout.MeasuredDimensions[DIM[MainAxis]] -
      AChild.GetTrailingMargin(MainAxis, AWidth).Unwrap -
      AChild.GetTrailingPosition(MainAxis, Value).Unwrap;
  end
  else if (not AChild.IsLeadingPositionDefined(MainAxis))
    and (FStyle.JustifyContent = TYogaJustify.Center) then
  begin
    AChild.FLayout.Position[LEADING[MainAxis]] :=
      (FLayout.MeasuredDimensions[DIM[MainAxis]] -
      AChild.FLayout.MeasuredDimensions[DIM[MainAxis]]) * 0.5;
  end
  else if (not AChild.IsLeadingPositionDefined(MainAxis))
    and (FStyle.JustifyContent = TYogaJustify.FlexEnd) then
  begin
    AChild.FLayout.Position[LEADING[MainAxis]] :=
      (FLayout.MeasuredDimensions[DIM[MainAxis]] -
      AChild.FLayout.MeasuredDimensions[DIM[MainAxis]]);
  end;

  if (AChild.IsTrailingPositionDefined(CrossAxis)) and
    (not AChild.IsLeadingPositionDefined(CrossAxis)) then
  begin
    if (IsMainAxisRow) then
      Value := AHeight
    else
      Value := AWidth;

    AChild.FLayout.Position[LEADING[CrossAxis]] :=
      FLayout.MeasuredDimensions[DIM[CrossAxis]] -
      AChild.FLayout.MeasuredDimensions[DIM[CrossAxis]] -
      AChild.GetTrailingMargin(CrossAxis, AWidth).Unwrap -
      AChild.GetTrailingPosition(CrossAxis, Value).Unwrap;
  end
  else if (not AChild.IsLeadingPositionDefined(CrossAxis))
    and (AlignItem(AChild) = TYogaAlign.Center) then
  begin
    AChild.FLayout.Position[LEADING[CrossAxis]] :=
      (FLayout.MeasuredDimensions[DIM[CrossAxis]] -
      AChild.FLayout.MeasuredDimensions[DIM[CrossAxis]]) * 0.5;
  end
  else if (not AChild.IsLeadingPositionDefined(CrossAxis))
    and ((AlignItem(AChild) = TYogaAlign.FlexEnd) xor (FStyle.FlexWrap = TYogaWrap.WrapReverse)) then
  begin
    AChild.FLayout.Position[LEADING[CrossAxis]] :=
      (FLayout.MeasuredDimensions[DIM[CrossAxis]] -
      AChild.FLayout.MeasuredDimensions[DIM[CrossAxis]]);
  end;
end;

procedure TYogaNode.Add(const AChild: TYogaNode);
begin
  Insert(FChildCount, AChild);
end;

procedure TYogaNode.CalculateLayout;
begin
  CalculateLayout(YOGA_UNDEFINED, YOGA_UNDEFINED, FStyle.Direction);
end;

procedure TYogaNode.CalculateLayout(const ADirection: TYogaDirection);
begin
  CalculateLayout(YOGA_UNDEFINED, YOGA_UNDEFINED, ADirection);
end;

procedure TYogaNode.CalculateLayout(const AAvailableWidth,
  AAvailableHeight: Single);
begin
  CalculateLayout(AAvailableWidth, AAvailableHeight, FStyle.Direction);
end;

function TYogaNode.AlignItem(const AChild: TYogaNode): TYogaAlign;
begin
  if (AChild.FStyle.AlignSelf = TYogaAlign.Auto) then
    Result := FStyle.AlignItems
  else
    Result := AChild.FStyle.AlignSelf;

  if (Result = TYogaAlign.Baseline) and (FStyle.FlexDirection.IsColumn) then
    Result := TYogaAlign.FlexStart;
end;

function TYogaNode.Baseline: Single;
var
  Child, BaselineChild: TYogaNode;
  I: Integer;
begin
  if Assigned(FOnBaseline) then
  begin
    Result := FOnBaseline(Self, FLayout.MeasuredDimensions[TDimension.Width],
      FLayout.MeasuredDimensions[TDimension.Height]);
    Assert(not YogaIsUndefined(Result), 'Expect custom baseline function to not return NaN');
    Exit;
  end;

  BaselineChild := nil;
  for I := 0 to FChildCount - 1 do
  begin
    Child := FChildren[I];
    if (Child.FLineIndex > 0) then
      Break;

    if (Child.FStyle.PositionType = TYogaPositionType.Absolute) then
      Continue;

    if (AlignItem(Child) = TYogaAlign.Baseline) then
    begin
      BaselineChild := Child;
      Break;
    end;

    if (BaselineChild = nil) then
      BaselineChild := Child;
  end;

  if (BaselineChild = nil) then
    Exit(FLayout.MeasuredDimensions[TDimension.Height]);

  Result := BaselineChild.Baseline + BaselineChild.FLayout.Position[TYogaEdge.Top];
end;

function TYogaNode.BoundAxis(const AAxis: TYogaFlexDirection; const AValue,
  AAxisSize, AWidthSize: Single): Single;
begin
  Result := YogaMax(BoundAxisWithinMinAndMax(AAxis, AValue, AAxisSize).Unwrap,
    PaddingForAxis(AAxis, AWidthSize));
end;

function TYogaNode.BoundAxisWithinMinAndMax(const AAxis: TYogaFlexDirection;
  const AValue, AAxisSize: Single): TFloatOptional;
var
  Min, Max: TFloatOptional;
begin
  if (AAxis.IsColumn) then
  begin
    Min := FStyle.MinDimensions[TDimension.Height].Resolve(AAxisSize);
    Max := FStyle.MaxDimensions[TDimension.Height].Resolve(AAxisSize);
  end
  else
  begin
    Min := FStyle.MinDimensions[TDimension.Width].Resolve(AAxisSize);
    Max := FStyle.MaxDimensions[TDimension.Width].Resolve(AAxisSize);
  end;

  if (not Max.IsUndefined) and (Max.Value >= 0) and (AValue > Max.Value) then
    Exit(Max);

  if (not Min.IsUndefined) and (Min.Value >= 0) and (AValue < Min.Value) then
    Exit(Min);

  Result.Init(AValue);
end;

function TYogaNode.CalculateAvailableInnerDim(const AAxis: TYogaFlexDirection;
  const AAvailableDim, AParentDim: Single): Single;
var
  Direction: TYogaFlexDirection;
  Dimension: TDimension;
  Margin, Padding, MinInnerDim, MaxInnerDim: Single;
  MinDimensionOptional, MaxDimensionOptional: TFloatOptional;
begin
  if (AAxis.IsRow) then
  begin
    Direction := TYogaFlexDirection.Row;
    Dimension := TDimension.Width;
  end
  else
  begin
    Direction := TYogaFlexDirection.Column;
    Dimension := TDimension.Height;
  end;

  Margin := GetMarginForAxis(Direction, AParentDim).Unwrap;
  Padding := PaddingForAxis(Direction, AParentDim);

  Result := AAvailableDim - Margin - Padding;

  { Max dimension overrides predefined dimension value; Min dimension in turn
    overrides both of the above }
  if (not YogaIsUndefined(Result)) then
  begin
    { We want to make sure our available height does not violate min and max
      constraints }
    MinDimensionOptional := FStyle.MinDimensions[Dimension].Resolve(AParentDim);
    if (MinDimensionOptional.IsUndefined) then
      MinInnerDim := 0.0
    else
      MinInnerDim := MinDimensionOptional.Value - Padding;

    MaxDimensionOptional := FStyle.MaxDimensions[Dimension].Resolve(AParentDim);
    if (MaxDimensionOptional.IsUndefined) then
      MaxInnerDim := Single.MaxValue
    else
      MaxInnerDim := MaxDimensionOptional.Value - Padding;

    Result := YogaMax(YogaMin(Result, MaxInnerDim), MinInnerDim);
  end;
end;

procedure TYogaNode.CalculateCollectFlexItemsRowValues(
  const AParentDirection: TYogaDirection; const AMainAxisParentSize,
  AAvailableInnerWidth, AAvailableInnerMainDim: Single; const AStartOfLineIndex,
  ALineCount: Integer; out AValues: TCollectFlexItemsRowValues);
{ This function assumes that all the children of node have their
  ComputedFlexBasis properly computed }
var
  SizeConsumedOnCurrentLineIncludingMinConstraint: Single;
  ChildMarginMainAxis, FlexBasisWithMinAndMaxConstraints: Single;
  MainAxis: TYogaFlexDirection;
  EndOfLineIndex: Integer;
  Child: TYogaNode;
  IsNodeFlexWrap: Boolean;
begin
  FillChar(AValues, SizeOf(AValues), 0);
  SetLength(AValues.RelativeChildren, FChildCount);

  SizeConsumedOnCurrentLineIncludingMinConstraint := 0;
  MainAxis := FStyle.FlexDirection.Resolve(ResolveDirection(AParentDirection));
  IsNodeFlexWrap := (FStyle.FlexWrap <> TYogaWrap.No);

  { Add items to the current line until it's full or we run out of items. }
  EndOfLineIndex := AStartOfLineIndex;
  while (EndOfLineIndex < FChildCount) do
  begin
    Child := FChildren[EndOfLineIndex];
    if (Child.FStyle.Display = TYogaDisplay.None) or (Child.FStyle.PositionType = TYogaPositionType.Absolute) then
    begin
      Inc(EndOfLineIndex);
      Continue;
    end;

    Child.FLineIndex := ALineCount;
    ChildMarginMainAxis := Child.GetMarginForAxis(MainAxis, AAvailableInnerWidth).Unwrap;
    FlexBasisWithMinAndMaxConstraints := Child.BoundAxisWithinMinAndMax(
      MainAxis, Child.FLayout.ComputedFlexBasis.Unwrap, AMainAxisParentSize).Unwrap;

    { If this is a multi-line flow and this item pushes us over the available
      size, we've hit the end of the current line. Break out of the loop and lay
      out the current line. }
    if ((SizeConsumedOnCurrentLineIncludingMinConstraint +
      FlexBasisWithMinAndMaxConstraints + ChildMarginMainAxis) > AAvailableInnerMainDim) and
      IsNodeFlexWrap and (AValues.ItemsOnLine > 0)
    then
      Break;

    SizeConsumedOnCurrentLineIncludingMinConstraint :=
      SizeConsumedOnCurrentLineIncludingMinConstraint +
      FlexBasisWithMinAndMaxConstraints + ChildMarginMainAxis;

    AValues.SizeConsumedOnCurrentLine :=
      AValues.SizeConsumedOnCurrentLine +
      FlexBasisWithMinAndMaxConstraints + ChildMarginMainAxis;

    Inc(AValues.ItemsOnLine);

    if (Child.IsFlexible) then
    begin
      AValues.TotalFlexGrowFactors :=
        AValues.TotalFlexGrowFactors + Child.ResolveFlexGrow;

      { Unlike the grow factor, the shrink factor is scaled relative to the
        child dimension. }
      AValues.TotalFlexShrinkScaledFactors :=
        AValues.TotalFlexShrinkScaledFactors -
        (Child.ResolveFlexShrink * Child.FLayout.ComputedFlexBasis.Unwrap);
    end;

    AValues.AddRelativeChild(Child);
    Inc(EndOfLineIndex);
  end;

  { The total flex factor needs to be floored to 1. }
  if (AValues.TotalFlexGrowFactors > 0.0) and
    (AValues.TotalFlexGrowFactors < 1.0)
  then
    AValues.TotalFlexGrowFactors := 1.0;

  { The total flex shrink factor needs to be floored to 1. }
  if (AValues.TotalFlexShrinkScaledFactors > 0.0) and
    (AValues.TotalFlexShrinkScaledFactors < 1.0)
  then
    AValues.TotalFlexShrinkScaledFactors := 1.0;

  AValues.EndOfLineIndex := EndOfLineIndex;
end;

procedure TYogaNode.CalculateLayout(const AAvailableWidth,
  AAvailableHeight: Single; const ADirection: TYogaDirection);
var
  Width, Height: Single;
  WidthMeasureMode, HeightMeasureMode: TYogaMeasureMode;
  Optional: TFloatOptional;
begin
  { Increment the generation count. This will force the recursive routine to
    visit all dirty nodes at least once. Subsequent visits will be skipped if
    the input parameters don't change. }
  Inc(GCurrentGenerationCount);
  ResolveDimension;

  if (IsStyleDimDefined(TYogaFlexDirection.Row, AAvailableWidth)) then
  begin
    Width := (FResolvedDimensions[DIM[TYogaFlexDirection.Row]].Resolve(AAvailableWidth)
      + GetMarginForAxis(TYogaFlexDirection.Row, AAvailableWidth)).Unwrap;
    WidthMeasureMode := TYogaMeasureMode.Exactly;
  end
  else
  begin
    Optional := FStyle.MaxDimensions[TDimension.Width].Resolve(AAvailableWidth);
    if (not Optional.IsUndefined) then
    begin
      Width := Optional.FValue;
      WidthMeasureMode := TYogaMeasureMode.AtMost;
    end
    else
    begin
      Width := AAvailableWidth;
      if (YogaIsUndefined(Width)) then
        WidthMeasureMode := TYogaMeasureMode.Undefined
      else
        WidthMeasureMode := TYogaMeasureMode.Exactly;
    end;
  end;

  if (IsStyleDimDefined(TYogaFlexDirection.Column, AAvailableHeight)) then
  begin
    Height := (FResolvedDimensions[DIM[TYogaFlexDirection.Column]].Resolve(AAvailableHeight)
      + GetMarginForAxis(TYogaFlexDirection.Column, AAvailableHeight)).Unwrap;
    HeightMeasureMode := TYogaMeasureMode.Exactly;
  end
  else
  begin
    Optional := FStyle.MaxDimensions[TDimension.Height].Resolve(AAvailableHeight);
    if (not Optional.IsUndefined) then
    begin
      Height := Optional.FValue;
      HeightMeasureMode := TYogaMeasureMode.AtMost;
    end
    else
    begin
      Height := AAvailableHeight;
      if (YogaIsUndefined(Height)) then
        HeightMeasureMode := TYogaMeasureMode.Undefined
      else
        HeightMeasureMode := TYogaMeasureMode.Exactly;
    end;
  end;

  if (LayoutInternal(Width, Height, ADirection, WidthMeasureMode,
    HeightMeasureMode, AAvailableWidth, AAvailableHeight, True)) then
  begin
    SetPosition(FLayout.Direction, AAvailableWidth, AAvailableHeight, AAvailableWidth);
    {$IFNDEF YOGA_NO_PIXEL_ALIGN}
    RoundToPixelGrid(0.0, 0.0);
    {$ENDIF}
  end;
end;

class function TYogaNode.CanUseCachedMeasurement(
  const AWidthMode: TYogaMeasureMode; const AWidth: Single;
  const AHeightMode: TYogaMeasureMode; const AHeight: Single;
  const ALastWidthMode: TYogaMeasureMode; const ALastWidth: Single;
  const ALastHeightMode: TYogaMeasureMode; const ALastHeight,
  ALastComputedWidth, ALastComputedHeight, AMarginRow,
  AMarginColumn: Single): Boolean;
var
  EffectiveWidth, EffectiveHeight, EffectiveLastWidth, EffectiveLastHeight: Single;
  HasSameWidthSpec, HasSameHeightSpec: Boolean;
begin
  if ((not YogaIsUndefined(ALastComputedHeight)) and (ALastComputedHeight < 0))
    or ((not YogaIsUndefined(ALastComputedWidth)) and (ALastComputedWidth < 0))
  then
    Exit(False);

  {$IFDEF YOGA_NO_PIXEL_ALIGN}
  EffectiveWidth := AWidth;
  EffectiveHeight := AHeight;
  EffectiveLastWidth := ALastWidth;
  EffectiveLastHeight := ALastHeight;
  {$ELSE}
  EffectiveWidth := YogaRoundValueToPixelGrid(AWidth, False, False);
  EffectiveHeight := YogaRoundValueToPixelGrid(AHeight, False, False);
  EffectiveLastWidth := YogaRoundValueToPixelGrid(ALastWidth, False, False);
  EffectiveLastHeight := YogaRoundValueToPixelGrid(ALastHeight, False, False);
  {$ENDIF}

  HasSameWidthSpec := (ALastWidthMode = AWidthMode)
    and (YogaEqual(EffectiveLastWidth, EffectiveWidth));

  HasSameHeightSpec := (ALastHeightMode = AHeightMode)
    and (YogaEqual(EffectiveLastHeight, EffectiveHeight));

  if (not (HasSameWidthSpec
    or AWidthMode.SizeIsExactAndMatchesOldMeasuresSize(AWidth - AMarginRow, ALastComputedWidth)
    or AWidthMode.OldSizeIsUnspecifiedAndStillFits(AWidth - AMarginRow, ALastWidthMode, ALastComputedWidth)
    or AWidthMode.NewMeasureSizeIsStricterAndStillValid(AWidth - AMarginRow, ALastWidthMode, ALastWidth, ALastComputedWidth)))
  then
    Exit(False);

  Result := HasSameHeightSpec
    or AHeightMode.SizeIsExactAndMatchesOldMeasuresSize(AHeight - AMarginColumn, ALastComputedHeight)
    or AHeightMode.OldSizeIsUnspecifiedAndStillFits(AHeight - AMarginColumn, ALastHeightMode, ALastComputedHeight)
    or AHeightMode.NewMeasureSizeIsStricterAndStillValid(AHeight - AMarginColumn, ALastHeightMode, ALastHeight, ALastComputedHeight);
end;

procedure TYogaNode.Clear;
var
  I: Integer;
begin
  for I := 0 to FChildCount - 1 do
  begin
    FChildren[I].FParent := nil;
    FreeAndNil(FChildren[I]);
  end;
  FChildCount := 0;
end;

class function TYogaNode.ComputedEdgeValue(const AEdges: TEdgeValues;
  const AEdge: TYogaEdge; const ADefault: TYogaValue): TYogaValue;
begin
  if (AEdges[AEdge].Units <> TYogaUnit.Undefined) then
    Exit(AEdges[AEdge]);

  if (AEdge in [TYogaEdge.Top, TYogaEdge.Bottom])
    and (AEdges[TYogaEdge.Vertical].Units <> TYogaUnit.Undefined)
  then
    Exit(AEdges[TYogaEdge.Vertical]);

  if (AEdge in [TYogaEdge.Left, TYogaEdge.Right, TYogaEdge.Start, TYogaEdge.Stop])
    and (AEdges[TYogaEdge.Horizontal].Units <> TYogaUnit.Undefined)
  then
    Exit(AEdges[TYogaEdge.Horizontal]);

  if (AEdges[TYogaEdge.All].Units <> TYogaUnit.Undefined) then
    Exit(AEdges[TYogaEdge.All]);

  if (AEdge in [TYogaEdge.Start, TYogaEdge.Stop]) then
    Exit(YOGA_VALUE_UNDEFINED);

  Result := ADefault;
end;

procedure TYogaNode.ComputeFlexBasisForChild(const AChild: TYogaNode;
  const AWidth: Single; const AWidthMode: TYogaMeasureMode; const AHeight,
  AParentWidth, AParentHeight: Single; const AHeightMode: TYogaMeasureMode;
  const ADirection: TYogaDirection);
var
  MainAxis: TYogaFlexDirection;
  IsMainAxisRow, IsRowStyleDimDefined, IsColumnStyleDimDefined: Boolean;
  HasExactWidth, ChildWidthStretch, HasExactHeight, ChildHeightStretch: Boolean;
  MainAxisSize, MainAxisParentSize, ChildWidth, ChildHeight: Single;
  MarginRow, MarginColumn: Single;
  ChildWidthMeasureMode, ChildHeightMeasureMode: TYogaMeasureMode;
  ResolvedFlexBasis, Padding: TFloatOptional;
begin
  MainAxis := FStyle.FlexDirection.Resolve(ADirection);
  IsMainAxisRow := MainAxis.IsRow;
  if (IsMainAxisRow) then
  begin
    MainAxisSize := AWidth;
    MainAxisParentSize := AParentWidth;
  end
  else
  begin
    MainAxisSize := AHeight;
    MainAxisParentSize := AParentHeight;
  end;

  ResolvedFlexBasis := AChild.ResolveFlexBasisPtr.Resolve(MainAxisParentSize);
  IsRowStyleDimDefined := AChild.IsStyleDimDefined(TYogaFlexDirection.Row, AParentWidth);
  IsColumnStyleDimDefined := AChild.IsStyleDimDefined(TYogaFlexDirection.Column, AParentHeight);

  if (not ResolvedFlexBasis.IsUndefined) and (not YogaIsUndefined(MainAxisSize)) then
  begin
    if (AChild.FLayout.ComputedFlexBasis.IsUndefined) then
    begin
      Padding.Init(AChild.PaddingForAxis(MainAxis, AParentWidth));
      AChild.FLayout.ComputedFlexBasis := TFloatOptional.Max(ResolvedFlexBasis, Padding);
    end;
  end
  else if (IsMainAxisRow) and (IsRowStyleDimDefined) then
  begin
    { The width is definite, so use that as the flex basis. }
    Padding.Init(AChild.PaddingForAxis(TYogaFlexDirection.Row, AParentWidth));
    AChild.FLayout.ComputedFlexBasis := TFloatOptional.Max(
      AChild.FResolvedDimensions[TDimension.Width].Resolve(AParentWidth), Padding);
  end
  else if (not IsMainAxisRow) and (IsColumnStyleDimDefined) then
  begin
    { The height is definite, so use that as the flex basis. }
    Padding.Init(AChild.PaddingForAxis(TYogaFlexDirection.Column, AParentWidth));
    AChild.FLayout.ComputedFlexBasis := TFloatOptional.Max(
      AChild.FResolvedDimensions[TDimension.Height].Resolve(AParentHeight), Padding);
  end
  else
  begin
    { Compute the flex basis and hypothetical main size (i.e. the clamped
      flex basis).}
    ChildWidth := YOGA_UNDEFINED;
    ChildHeight := YOGA_UNDEFINED;
    ChildWidthMeasureMode := TYogaMeasureMode.Undefined;
    ChildHeightMeasureMode := TYogaMeasureMode.Undefined;

    MarginRow := AChild.GetMarginForAxis(TYogaFlexDirection.Row, AParentWidth).Unwrap;
    MarginColumn := AChild.GetMarginForAxis(TYogaFlexDirection.Column, AParentWidth).Unwrap;

    if (IsRowStyleDimDefined) then
    begin
      ChildWidth := AChild.FResolvedDimensions[TDimension.Width].
        Resolve(AParentWidth).Unwrap + MarginRow;
      ChildWidthMeasureMode := TYogaMeasureMode.Exactly;
    end;

    if (IsColumnStyleDimDefined) then
    begin
      ChildHeight := AChild.FResolvedDimensions[TDimension.Height].
        Resolve(AParentHeight).Unwrap + MarginColumn;
      ChildHeightMeasureMode := TYogaMeasureMode.Exactly;
    end;

    { The W3C spec doesn't say anything about the 'overflow' property,
      but all major browsers appear to implement the following logic. }
    if ((not IsMainAxisRow) and (FStyle.Overflow = TYogaOverflow.Scroll))
      or (FStyle.Overflow <> TYogaOverflow.Scroll) then
    begin
      if YogaIsUndefined(ChildWidth) and (not YogaIsUndefined(AWidth)) then
      begin
        ChildWidth := AWidth;
        ChildWidthMeasureMode := TYogaMeasureMode.AtMost;
      end;
    end;

    if (IsMainAxisRow and (FStyle.Overflow = TYogaOverflow.Scroll))
      or (FStyle.Overflow <> TYogaOverflow.Scroll) then
    begin
      if YogaIsUndefined(ChildHeight) and (not YogaIsUndefined(AHeight)) then
      begin
        ChildHeight := AHeight;
        ChildHeightMeasureMode := TYogaMeasureMode.AtMost;
      end;
    end;

    if (not AChild.FStyle.AspectRatio.IsUndefined) then
    begin
      if (not IsMainAxisRow) and (ChildWidthMeasureMode = TYogaMeasureMode.Exactly) then
      begin
        ChildHeight := MarginColumn +
          (ChildWidth - MarginRow) / AChild.FStyle.AspectRatio.Value;
        ChildHeightMeasureMode := TYogaMeasureMode.Exactly;
      end
      else if (IsMainAxisRow) and (ChildHeightMeasureMode = TYogaMeasureMode.Exactly) then
      begin
        ChildWidth := MarginRow +
          (ChildHeight - MarginColumn) * AChild.FStyle.AspectRatio.Value;
        ChildWidthMeasureMode := TYogaMeasureMode.Exactly;
      end
    end;

    { If child has no defined size in the cross axis and is set to stretch,
      set the cross axis to be measured exactly with the available inner width }
    HasExactWidth := (not YogaIsUndefined(AWidth)) and (AWidthMode = TYogaMeasureMode.Exactly);
    ChildWidthStretch := (AlignItem(AChild) = TYogaAlign.Stretch) and
      (ChildWidthMeasureMode <> TYogaMeasureMode.Exactly);

    if (not IsMainAxisRow) and (not IsRowStyleDimDefined) and (HasExactWidth)
      and (ChildWidthStretch) then
    begin
      ChildWidth := AWidth;
      ChildWidthMeasureMode := TYogaMeasureMode.Exactly;
      if (not AChild.FStyle.AspectRatio.IsUndefined) then
      begin
        ChildHeight := (ChildWidth - MarginRow) / AChild.FStyle.AspectRatio.Value;
        ChildHeightMeasureMode := TYogaMeasureMode.Exactly;
      end;
    end;

    HasExactHeight := (not YogaIsUndefined(AHeight)) and (AHeightMode = TYogaMeasureMode.Exactly);
    ChildHeightStretch := (AlignItem(AChild) = TYogaAlign.Stretch) and
      (ChildHeightMeasureMode <> TYogaMeasureMode.Exactly);

    if (IsMainAxisRow) and (not IsColumnStyleDimDefined) and (HasExactHeight)
      and (ChildHeightStretch) then
    begin
      ChildHeight := AHeight;
      ChildHeightMeasureMode := TYogaMeasureMode.Exactly;
      if (not AChild.FStyle.AspectRatio.IsUndefined) then
      begin
        ChildWidth := (ChildHeight - MarginColumn) * AChild.FStyle.AspectRatio.Value;
        ChildWidthMeasureMode := TYogaMeasureMode.Exactly;
      end;
    end;

    AChild.ConstrainMaxSizeForMode(TYogaFlexDirection.Row, AParentWidth,
      AParentWidth, ChildWidthMeasureMode, ChildWidth);

    AChild.ConstrainMaxSizeForMode(TYogaFlexDirection.Column, AParentHeight,
      AParentWidth, ChildHeightMeasureMode, ChildHeight);

    { Measure the child }
    AChild.LayoutInternal(ChildWidth, ChildHeight, ADirection,
      ChildWidthMeasureMode, ChildHeightMeasureMode, AParentWidth,
      AParentHeight, False);

    AChild.FLayout.ComputedFlexBasis.Init(YogaMax(
      AChild.FLayout.MeasuredDimensions[DIM[MainAxis]],
      AChild.PaddingForAxis(MainAxis, AParentWidth)));
  end;
  AChild.FLayout.ComputedFlexBasisGeneration := GCurrentGenerationCount;
end;

procedure TYogaNode.ComputeFlexBasisForChildren(const AAvailableInnerWidth,
  AAvailableInnerHeight: Single; const AWidthMeasureMode,
  AHeightMeasureMode: TYogaMeasureMode; const ADirection: TYogaDirection;
  const AMainAxis: TYogaFlexDirection; const APerformLayout: Boolean;
  var ATotalOuterFlexBasis: Single);
var
  Child, SingleFlexChild: TYogaNode;
  Children: TArray<TYogaNode>;
  MeasureModeMainDim: TYogaMeasureMode;
  ChildDirection: TYogaDirection;
  MainDim, CrossDim: Single;
  I: Integer;
begin
  SingleFlexChild := nil;
  Children := FChildren;
  if (AMainAxis.IsRow) then
    MeasureModeMainDim := AWidthMeasureMode
  else
    MeasureModeMainDim := AHeightMeasureMode;

  { If there is only one child with flexGrow + flexShrink it means we can set
    the ComputedFlexBasis to 0 instead of measuring and shrinking / flexing the
    child to exactly match the remaining space }
  if (MeasureModeMainDim = TYogaMeasureMode.Exactly) then
  begin
    for I := 0 to FChildCount - 1 do
    begin
      Child := Children[I];
      if (Child.IsFlexible) then
      begin
        if (SingleFlexChild <> nil) or (YogaEqual(Child.ResolveFlexGrow, 0.0))
          or (YogaEqual(Child.ResolveFlexShrink, 0.0)) then
        begin
          { There is already a flexible child, or this flexible child doesn't
            have FlexGrow and FlexShrink, abort }
          SingleFlexChild := nil;
          Break;
        end
        else
          SingleFlexChild := Child;
      end;
    end;
  end;

  if (AMainAxis.IsRow) then
  begin
    MainDim := AAvailableInnerWidth;
    CrossDim := AAvailableInnerHeight;
  end
  else
  begin
    MainDim := AAvailableInnerHeight;
    CrossDim := AAvailableInnerWidth;
  end;

  for I := 0 to FChildCount - 1 do
  begin
    Child := Children[I];
    Child.ResolveDimension;
    if (Child.FStyle.Display = TYogaDisplay.None) then
    begin
      Child.ZeroOutLayoutRecursively;
      Child.FHasNewLayout := True;
      Child.SetDirty(False);
      Continue;
    end;

    if (APerformLayout) then
    begin
      { Set the initial position (relative to the owner). }
      ChildDirection := ResolveDirection(ADirection);
      Child.SetPosition(ChildDirection, MainDim, CrossDim, AAvailableInnerWidth);
    end;

    if (Child.FStyle.PositionType = TYogaPositionType.Absolute) then
      Continue;

    if (Child = SingleFlexChild) then
    begin
      Child.FLayout.ComputedFlexBasisGeneration := GCurrentGenerationCount;
      Child.FLayout.ComputedFlexBasis := FLOAT_OPT_ZERO;
    end
    else
    begin
      ComputeFlexBasisForChild(Child, AAvailableInnerWidth, AWidthMeasureMode,
        AAvailableInnerHeight, AAvailableInnerWidth, AAvailableInnerHeight,
        AHeightMeasureMode, ADirection);
    end;

    ATotalOuterFlexBasis := ATotalOuterFlexBasis + (Child.FLayout.ComputedFlexBasis +
      Child.GetMarginForAxis(AMainAxis, AAvailableInnerWidth)).Unwrap;
  end;
end;

procedure TYogaNode.ConstrainMaxSizeForMode(const AAxis: TYogaFlexDirection;
  const AParentAxisSize, AParentWidth: Single; var AMode: TYogaMeasureMode;
  var ASize: Single);
var
  MaxSize: TFloatOptional;
begin
  MaxSize := FStyle.MaxDimensions[DIM[AAxis]].Resolve(AParentAxisSize)
    + GetMarginForAxis(AAxis, AParentWidth);

  case AMode of
    TYogaMeasureMode.Exactly,
    TYogaMeasureMode.AtMost:
      begin
        if (not MaxSize.IsUndefined) and (ASize >= MaxSize.Value) then
          ASize := MaxSize.Value;
      end;

    TYogaMeasureMode.Undefined:
      if (not MaxSize.IsUndefined) then
      begin
        AMode := TYogaMeasureMode.AtMost;
        ASize := MaxSize.Value;
      end;
  end;
end;

procedure TYogaNode.CopyStyle(const ASourceNode: TYogaNode);
begin
  Assert(Assigned(ASourceNode));
  if (FStyle <> ASourceNode.FStyle) then
  begin
    FStyle := ASourceNode.FStyle;
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.Delete(const AIndex: Integer);
var
  Child: TYogaNode;
begin
  Assert((AIndex >= 0) and (AIndex < FChildCount));

  Child := FChildren[AIndex];
  Assert(Assigned(Child));

  Child.FParent := nil;

  {$IFDEF AUTOREFCOUNT}
  Pointer(FChildren[AIndex]) := nil;
  {$ENDIF}

  Dec(FChildCount);
  if (AIndex <> FChildCount) then
  begin
    Move(FChildren[AIndex + 1], FChildren[AIndex], (FChildCount - AIndex) * SizeOf(TYogaNode));
    Pointer(FChildren[FChildCount]) := nil;
  end;

  Child.Free;
  MarkDirtyAndPropogate;
end;

destructor TYogaNode.Destroy;
begin
  if (FParent <> nil) then
    FParent.Remove(Self);

  Clear;
  inherited;
end;

class function TYogaNode.DimensionValuesEqual(const ALeft,
  ARight: TDimensionValues): Boolean;
begin
  Result := (ALeft[TDimension.Width] = ARight[TDimension.Width])
        and (ALeft[TDimension.Height] = ARight[TDimension.Height]);
end;

function TYogaNode.DimWithMargin(const AAxis: TYogaFlexDirection;
  const AWidthSize: Single): Single;
begin
  Result := FLayout.MeasuredDimensions[DIM[AAxis]] + (
    GetLeadingMargin(AAxis, AWidthSize) +
    GetTrailingMargin(AAxis, AWidthSize)).Unwrap;
end;

class procedure TYogaNode.DistributeFreeSpaceFirstPass(
  var ACollectedFlexItemsValues: TCollectFlexItemsRowValues;
  const AMainAxis: TYogaFlexDirection; const AMainAxisParentSize,
  AAvailableInnerMainDim, AAvailableInnerWidth: Single);
{ It distributes the free space to the flexible items.For those flexible items
  whose min and max constraints are triggered, those flex item's clamped size
  is removed from the remaingfreespace. }
var
  FlexShrinkScaledFactor, FlexGrowFactor, BaseMainSize, BoundMainSize: Single;
  DeltaFreeSpace, ChildFlexBasis: Single;
  CurrentRelativeChild: TYogaNode;
  I: Integer;
begin
  DeltaFreeSpace := 0;

  for I := 0 to ACollectedFlexItemsValues.RelativeChildCount - 1 do
  begin
    CurrentRelativeChild := ACollectedFlexItemsValues.RelativeChildren[I];
    ChildFlexBasis := CurrentRelativeChild.BoundAxisWithinMinAndMax(AMainAxis,
      CurrentRelativeChild.FLayout.ComputedFlexBasis.Unwrap, AMainAxisParentSize).Unwrap;

    if (ACollectedFlexItemsValues.RemainingFreeSpace < 0.0) then
    begin
      FlexShrinkScaledFactor := -CurrentRelativeChild.ResolveFlexShrink * ChildFlexBasis;

      { Is this child able to shrink? }
      if (not YogaIsUndefined(FlexShrinkScaledFactor)) and (FlexShrinkScaledFactor <> 0) then
      begin
        BaseMainSize := ChildFlexBasis + (ACollectedFlexItemsValues.RemainingFreeSpace /
          ACollectedFlexItemsValues.TotalFlexShrinkScaledFactors * FlexShrinkScaledFactor);

        BoundMainSize := CurrentRelativeChild.BoundAxis(AMainAxis, BaseMainSize,
          AAvailableInnerMainDim, AAvailableInnerWidth);

        if (not YogaIsUndefined(BaseMainSize)) and (not YogaIsUndefined(BoundMainSize))
          and (BaseMainSize <> BoundMainSize) then
        begin
          { By excluding this item's size and flex factor from remaining, this
            item's min/max constraints should also trigger in the second pass
            resulting in the item's size calculation being identical in the
            first and second passes. }
          DeltaFreeSpace := DeltaFreeSpace + (BoundMainSize - ChildFlexBasis);
          ACollectedFlexItemsValues.TotalFlexShrinkScaledFactors :=
            ACollectedFlexItemsValues.TotalFlexShrinkScaledFactors -
            FlexShrinkScaledFactor;
        end;
      end;
    end
    else if (not YogaIsUndefined(ACollectedFlexItemsValues.RemainingFreeSpace))
      and (ACollectedFlexItemsValues.RemainingFreeSpace > 0.0) then
    begin
      FlexGrowFactor := CurrentRelativeChild.ResolveFlexGrow;

      { Is this child able to grow? }
      if (not YogaIsUndefined(FlexGrowFactor)) and (FlexGrowFactor <> 0.0) then
      begin
        BaseMainSize := ChildFlexBasis + (ACollectedFlexItemsValues.RemainingFreeSpace /
          ACollectedFlexItemsValues.TotalFlexGrowFactors * FlexGrowFactor);

        BoundMainSize := CurrentRelativeChild.BoundAxis(AMainAxis, BaseMainSize,
          AAvailableInnerMainDim, AAvailableInnerWidth);

        if (not YogaIsUndefined(BaseMainSize)) and (not YogaIsUndefined(BoundMainSize))
          and (BaseMainSize <> BoundMainSize) then
        begin
          { By excluding this item's size and flex factor from remaining, this
            item's min/max constraints should also trigger in the second pass
            resulting in the item's size calculation being identical in the
            first and second passes. }
          DeltaFreeSpace := DeltaFreeSpace + (BoundMainSize - ChildFlexBasis);
          ACollectedFlexItemsValues.TotalFlexGrowFactors :=
            ACollectedFlexItemsValues.TotalFlexGrowFactors -
            FlexGrowFactor;
        end;
      end;
    end;
  end;
  ACollectedFlexItemsValues.RemainingFreeSpace :=
    ACollectedFlexItemsValues.RemainingFreeSpace - DeltaFreeSpace;
end;

function TYogaNode.DistributeFreeSpaceSecondPass(
  var ACollectedFlexItemsValues: TCollectFlexItemsRowValues; const AMainAxis,
  ACrossAxis: TYogaFlexDirection; const AMainAxisParentSize,
  AAvailableInnerMainDim, AAvailableInnerCrossDim, AAvailableInnerWidth,
  AAvailableInnerHeight: Single; const AFlexBasisOverflows: Boolean;
  const AMeasureModeCrossDim: TYogaMeasureMode;
  const APerformLayout: Boolean): Single;
{ It distributes the free space to the flexible items and ensures that the size
  of the flex items abide the min and max constraints. At the end of this
  function the child nodes would have proper size. Prior using this function
  please ensure that DistributeFreeSpaceFirstPass is called. }
var
  ChildFlexBasis, FlexShrinkScaledFactor, FlexGrowFactor, DeltaFreeSpace: Single;
  UpdatedMainSize, ChildSize, MarginMain, MarginCross, ChildCrossSize: Single;
  ChildMainSize, ChildWidth, ChildHeight: Single;
  ChildCrossMeasureMode, ChildMainMearureMode: TYogaMeasureMode;
  ChildWidthMeasureMode, ChildHeightMeasureMode: TYogaMeasureMode;
  IsMainAxisRow, IsNodeFlexWrap, IsLoosePercentageMeasurement: Boolean;
  RequiresStretchLayout: Boolean;
  CurrentRelativeChild: TYogaNode;
  I: Integer;
begin
//  FlexShrinkScaledFactor := 0;
//  FlexGrowFactor := 0;
  DeltaFreeSpace := 0;
  IsMainAxisRow := AMainAxis.IsRow;
  IsNodeFlexWrap := (FStyle.FlexWrap <> TYogaWrap.No);

  for I := 0 to ACollectedFlexItemsValues.RelativeChildCount - 1 do
  begin
    CurrentRelativeChild := ACollectedFlexItemsValues.RelativeChildren[I];

    ChildFlexBasis := CurrentRelativeChild.BoundAxisWithinMinAndMax(AMainAxis,
      CurrentRelativeChild.FLayout.ComputedFlexBasis.Unwrap, AMainAxisParentSize).Unwrap;

    UpdatedMainSize := ChildFlexBasis;

    if (not YogaIsUndefined(ACollectedFlexItemsValues.RemainingFreeSpace)) and
      (ACollectedFlexItemsValues.RemainingFreeSpace < 0) then
    begin
      FlexShrinkScaledFactor := -CurrentRelativeChild.ResolveFlexShrink * ChildFlexBasis;

      { Is this child able to shrink? }
      if (FlexShrinkScaledFactor <> 0) then
      begin
        if (not YogaIsUndefined(ACollectedFlexItemsValues.TotalFlexShrinkScaledFactors))
          and (ACollectedFlexItemsValues.TotalFlexShrinkScaledFactors = 0)
        then
          ChildSize := ChildFlexBasis + FlexShrinkScaledFactor
        else
        begin
          ChildSize := ChildFlexBasis + ((ACollectedFlexItemsValues.RemainingFreeSpace /
            ACollectedFlexItemsValues.TotalFlexShrinkScaledFactors) * FlexShrinkScaledFactor);
        end;

        UpdatedMainSize := CurrentRelativeChild.BoundAxis(AMainAxis, ChildSize,
          AAvailableInnerMainDim, AAvailableInnerWidth);
      end;
    end
    else if (not YogaIsUndefined(ACollectedFlexItemsValues.RemainingFreeSpace)) and
      (ACollectedFlexItemsValues.RemainingFreeSpace > 0) then
    begin
      FlexGrowFactor := CurrentRelativeChild.ResolveFlexGrow;

      { Is this child able to grow? }
      if (not YogaIsUndefined(FlexGrowFactor)) and (FlexGrowFactor <> 0) then
      begin
        UpdatedMainSize := CurrentRelativeChild.BoundAxis(AMainAxis,
          ChildFlexBasis + (ACollectedFlexItemsValues.RemainingFreeSpace /
          ACollectedFlexItemsValues.TotalFlexGrowFactors * FlexGrowFactor),
          AAvailableInnerMainDim, AAvailableInnerWidth);
      end;
    end;

    DeltaFreeSpace := DeltaFreeSpace + (UpdatedMainSize - ChildFlexBasis);

    MarginMain := CurrentRelativeChild.GetMarginForAxis(AMainAxis, AAvailableInnerWidth).Unwrap;
    MarginCross := CurrentRelativeChild.GetMarginForAxis(ACrossAxis, AAvailableInnerWidth).Unwrap;

    ChildMainSize := UpdatedMainSize + MarginMain;
    ChildMainMearureMode := TYogaMeasureMode.Exactly;

    if (not CurrentRelativeChild.FStyle.AspectRatio.IsUndefined) then
    begin
      if (IsMainAxisRow) then
        ChildCrossSize := (ChildMainSize - MarginMain) / CurrentRelativeChild.FStyle.AspectRatio.Value
      else
        ChildCrossSize := (ChildMainSize - MarginMain) * CurrentRelativeChild.FStyle.AspectRatio.Value;
      ChildCrossMeasureMode := TYogaMeasureMode.Exactly;

      ChildCrossSize := ChildCrossSize + MarginCross;
    end
    else if (not YogaIsUndefined(AAvailableInnerCrossDim))
      and (not CurrentRelativeChild.IsStyleDimDefined(ACrossAxis, AAvailableInnerCrossDim))
      and (AMeasureModeCrossDim = TYogaMeasureMode.Exactly)
      and (not (IsNodeFlexWrap and AFlexBasisOverflows))
      and (AlignItem(CurrentRelativeChild) = TYogaAlign.Stretch)
      and (CurrentRelativeChild.MarginLeadingValue(ACrossAxis).Units <> TYogaUnit.Auto)
      and (CurrentRelativeChild.MarginTrailingValue(ACrossAxis).Units <> TYogaUnit.Auto) then
    begin
      ChildCrossSize := AAvailableInnerCrossDim;
      ChildCrossMeasureMode := TYogaMeasureMode.Exactly;
    end
    else if (not CurrentRelativeChild.IsStyleDimDefined(ACrossAxis, AAvailableInnerCrossDim)) then
    begin
      ChildCrossSize := AAvailableInnerCrossDim;
      if (YogaIsUndefined(ChildCrossSize)) then
        ChildCrossMeasureMode := TYogaMeasureMode.Undefined
      else
        ChildCrossMeasureMode := TYogaMeasureMode.AtMost;
    end
    else
    begin
      ChildCrossSize := CurrentRelativeChild.FResolvedDimensions[DIM[ACrossAxis]].
        Resolve(AAvailableInnerCrossDim).Unwrap + MarginCross;

      IsLoosePercentageMeasurement := (CurrentRelativeChild.FResolvedDimensions[DIM[ACrossAxis]].Units = TYogaUnit.Percent)
        and (AMeasureModeCrossDim <> TYogaMeasureMode.Exactly);

      if (YogaIsUndefined(ChildCrossSize)) or IsLoosePercentageMeasurement then
        ChildCrossMeasureMode := TYogaMeasureMode.Undefined
      else
        ChildCrossMeasureMode := TYogaMeasureMode.Exactly;
    end;

    CurrentRelativeChild.ConstrainMaxSizeForMode(AMainAxis, AAvailableInnerMainDim,
      AAvailableInnerWidth, ChildMainMearureMode, ChildMainSize);

    CurrentRelativeChild.ConstrainMaxSizeForMode(ACrossAxis, AAvailableInnerCrossDim,
      AAvailableInnerWidth, ChildCrossMeasureMode, ChildCrossSize);

    RequiresStretchLayout := (not CurrentRelativeChild.IsStyleDimDefined(
      ACrossAxis, AAvailableInnerCrossDim))
      and (AlignItem(CurrentRelativeChild) = TYogaAlign.Stretch)
      and (CurrentRelativeChild.MarginLeadingValue(ACrossAxis).Units <> TYogaUnit.Auto)
      and (CurrentRelativeChild.MarginTrailingValue(ACrossAxis).Units <> TYogaUnit.Auto);

    if (IsMainAxisRow) then
    begin
      ChildWidth := ChildMainSize;
      ChildWidthMeasureMode := ChildMainMearureMode;
      ChildHeight := ChildCrossSize;
      ChildHeightMeasureMode := ChildCrossMeasureMode;
    end
    else
    begin
      ChildWidth := ChildCrossSize;
      ChildWidthMeasureMode := ChildCrossMeasureMode;
      ChildHeight := ChildMainSize;
      ChildHeightMeasureMode := ChildMainMearureMode;
    end;

    { Recursively call the layout algorithm for this child with the updated
      main size. }
    CurrentRelativeChild.LayoutInternal(ChildWidth, ChildHeight,
      FLayout.Direction, ChildWidthMeasureMode, ChildHeightMeasureMode,
      AAvailableInnerWidth, AAvailableInnerHeight,
      APerformLayout and not RequiresStretchLayout);

    FLayout.HadOverflow := FLayout.HadOverflow or CurrentRelativeChild.FLayout.HadOverflow;
  end;
  Result := DeltaFreeSpace;
end;

procedure TYogaNode.DoMeasureSetMeasuredDimensions(const AAvailableWidth,
  AAvailableHeight: Single; const AWidthMeasureMode,
  AHeightMeasureMode: TYogaMeasureMode; const AParentWidth,
  AParentHeight: Single);
var
  PaddingAxisRow, PaddingAxisColumn, MarginAxisRow, MarginAxisColumn: Single;
  InnerWidth, InnerHeight, Value: Single;
  MeasuredSize: TSizeF;
begin
  Assert(Assigned(FOnMeasure), 'Expected node to have custom measure function');
  PaddingAxisRow := PaddingForAxis(TYogaFlexDirection.Row, AAvailableWidth);
  PaddingAxisColumn := PaddingForAxis(TYogaFlexDirection.Column, AAvailableWidth);
  MarginAxisRow := GetMarginForAxis(TYogaFlexDirection.Row, AAvailableWidth).Unwrap;
  MarginAxisColumn := GetMarginForAxis(TYogaFlexDirection.Column, AAvailableWidth).Unwrap;

  { We want to make sure we don't call measure with negative size }
  if (YogaIsUndefined(AAvailableWidth)) then
    InnerWidth := AAvailableWidth
  else
    InnerWidth := YogaMax(0.0, AAvailableWidth - MarginAxisRow - PaddingAxisRow);

  if (YogaIsUndefined(AAvailableHeight)) then
    InnerHeight := AAvailableHeight
  else
    InnerHeight := YogaMax(0.0, AAvailableHeight - MarginAxisColumn - PaddingAxisColumn);

  if (AWidthMeasureMode = TYogaMeasureMode.Exactly) and (AHeightMeasureMode = TYogaMeasureMode.Exactly) then
  begin
    { Don't bother sizing the text if both dimensions are already defined. }
    FLayout.MeasuredDimensions[TDimension.Width] := BoundAxis(TYogaFlexDirection.Row,
      AAvailableWidth - MarginAxisRow,  AParentWidth, AParentWidth);

    FLayout.MeasuredDimensions[TDimension.Height] := BoundAxis(TYogaFlexDirection.Column,
      AAvailableHeight - MarginAxisColumn,  AParentHeight, AParentWidth);
  end
  else
  begin
    { Measure the text under the current constraints. }
    MeasuredSize := FOnMeasure(Self, InnerWidth, AWidthMeasureMode,
      InnerHeight, AHeightMeasureMode);

    if (AWidthMeasureMode in [TYogaMeasureMode.Undefined, TYogaMeasureMode.AtMost]) then
      Value := MeasuredSize.Width + PaddingAxisRow
    else
      Value := AAvailableWidth - MarginAxisRow;

    FLayout.MeasuredDimensions[TDimension.Width] := BoundAxis(TYogaFlexDirection.Row,
      Value, AParentWidth, AParentWidth);

    if (AHeightMeasureMode in [TYogaMeasureMode.Undefined, TYogaMeasureMode.AtMost]) then
      Value := MeasuredSize.Height + PaddingAxisColumn
    else
      Value := AAvailableHeight - MarginAxisColumn;

    FLayout.MeasuredDimensions[TDimension.Height] := BoundAxis(TYogaFlexDirection.Column,
      Value, AParentHeight, AParentWidth);
  end;
end;

class function TYogaNode.EdgeValuesEqual(const ALeft,
  ARight: TEdgeValues): Boolean;
var
  Edge: TYogaEdge;
begin
  for Edge := Low(TYogaEdge) to High(TYogaEdge) do
  begin
    if (ALeft[Edge] <> ARight[Edge]) then
      Exit(False);
  end;
  Result := True;
end;

procedure TYogaNode.EmptyContainerSetMeasuredDimensions(const AAvailableWidth,
  AAvailableHeight: Single; const AWidthMeasureMode,
  AHeightMeasureMode: TYogaMeasureMode; const AParentWidth,
  AParentHeight: Single);
{ For nodes with no children, use the available values if they were provided,
  or the minimum size as indicated by the padding and border sizes. }
var
  PaddingAxisRow, PaddingAxisColumn, MarginAxisRow, MarginAxisColumn: Single;
  Value: Single;
begin
  PaddingAxisRow := PaddingForAxis(TYogaFlexDirection.Row, AParentWidth);
  PaddingAxisColumn := PaddingForAxis(TYogaFlexDirection.Column, AParentWidth);
  MarginAxisRow := GetMarginForAxis(TYogaFlexDirection.Row, AParentWidth).Unwrap;
  MarginAxisColumn := GetMarginForAxis(TYogaFlexDirection.Column, AParentWidth).Unwrap;

  if (AWidthMeasureMode in [TYogaMeasureMode.Undefined, TYogaMeasureMode.AtMost]) then
    Value := PaddingAxisRow
  else
    Value := AAvailableWidth - MarginAxisRow;

  FLayout.MeasuredDimensions[TDimension.Width] := BoundAxis(TYogaFlexDirection.Row,
    Value, AParentWidth, AParentWidth);

  if (AHeightMeasureMode in [TYogaMeasureMode.Undefined, TYogaMeasureMode.AtMost]) then
    Value := PaddingAxisColumn
  else
    Value := AAvailableHeight - MarginAxisColumn;

  FLayout.MeasuredDimensions[TDimension.Height] := BoundAxis(TYogaFlexDirection.Column,
    Value, AParentHeight, AParentWidth);
end;

function TYogaNode.FixedSizeSetMeasuredDimensions(const AAvailableWidth,
  AAvailableHeight: Single; const AWidthMeasureMode,
  AHeightMeasureMode: TYogaMeasureMode; const AParentWidth,
  AParentHeight: Single): Boolean;
var
  MarginAxisColumn, MarginAxisRow, Value: Single;
begin
  if ((not YogaIsUndefined(AAvailableWidth))
    and (AWidthMeasureMode = TYogaMeasureMode.AtMost)
    and (AAvailableWidth <= 0.0))
   or ((not YogaIsUndefined(AAvailableHeight))
    and (AHeightMeasureMode = TYogaMeasureMode.AtMost)
    and (AAvailableHeight <= 0.0))
   or ((AWidthMeasureMode = TYogaMeasureMode.Exactly)
    and (AHeightMeasureMode = TYogaMeasureMode.Exactly)) then
  begin
    MarginAxisColumn := GetMarginForAxis(TYogaFlexDirection.Column, AParentWidth).Unwrap;
    MarginAxisRow := GetMarginForAxis(TYogaFlexDirection.Row, AParentWidth).Unwrap;

    if (YogaIsUndefined(AAvailableWidth))
      or ((AWidthMeasureMode = TYogaMeasureMode.AtMost) and (AAvailableWidth < 0.0))
    then
      Value := 0.0
    else
      Value := AAvailableWidth - MarginAxisRow;

    FLayout.MeasuredDimensions[TDimension.Width] := BoundAxis(
      TYogaFlexDirection.Row, Value, AParentWidth, AParentWidth);

    if (YogaIsUndefined(AAvailableHeight))
      or ((AHeightMeasureMode = TYogaMeasureMode.AtMost) and (AAvailableHeight < 0.0))
    then
      Value := 0.0
    else
      Value := AAvailableHeight - MarginAxisColumn;

    FLayout.MeasuredDimensions[TDimension.Height] := BoundAxis(
      TYogaFlexDirection.Column, Value, AParentHeight, AParentWidth);

    Exit(True);
  end;

  Result := False;
end;

function TYogaNode.GetAspectRatio: Single;
begin
  if (FStyle.AspectRatio.IsUndefined) then
    Result := YOGA_UNDEFINED
  else
    Result := FStyle.AspectRatio.Value;
end;

function TYogaNode.GetChild(const AIndex: Integer): TYogaNode;
begin
  Assert((AIndex >= 0) and (AIndex < FChildCount));
  Result := FChildren[AIndex];
end;

function TYogaNode.GetEnumerator: TEnumerator;
begin
  Result := TEnumerator.Create(Self);
end;

function TYogaNode.GetFlex: Single;
begin
  if (FStyle.Flex.IsUndefined) then
    Result := YOGA_UNDEFINED
  else
    Result := FStyle.Flex.Value;
end;

function TYogaNode.GetFlexBasis: TYogaValue;
begin
  Result := FStyle.FlexBasis;
  if (Result.Units in [TYogaUnit.Undefined, TYogaUnit.Auto]) then
    Result.FValue := YOGA_UNDEFINED;
end;

function TYogaNode.GetFlexGrow: Single;
begin
  if (FStyle.FlexGrow.IsUndefined) then
    Result := DEFAULT_FLEX_GROW
  else
    Result := FStyle.FlexGrow.Value;
end;

function TYogaNode.GetFlexShrink: Single;
begin
  if (FStyle.FlexShrink.IsUndefined) then
    Result := DEFAULT_FLEX_SHRINK
  else
    Result := FStyle.FlexShrink.Value;
end;

function TYogaNode.GetHeight: TYogaValue;
begin
  Result := GetStyleValue(FStyle.Dimensions[TDimension.Height]);
end;

function TYogaNode.GetIsBaselineDefined: Boolean;
begin
  Result := Assigned(FOnBaseline);
end;

function TYogaNode.GetIsMeasureDefined: Boolean;
begin
  Result := Assigned(FOnMeasure);
end;

function TYogaNode.GetLayoutMargin(const AIndex: TYogaEdge): Single;
begin
  Result := GetLayoutValue(FLayout.Margin, AIndex);
end;

function TYogaNode.GetLayoutPadding(const AIndex: TYogaEdge): Single;
begin
  Result := GetLayoutValue(FLayout.Padding, AIndex);
end;

function TYogaNode.GetLayoutValue(const AValues: TMarginFloats;
  const AEdge: TYogaEdge): Single;
begin
  if (AEdge = TYogaEdge.Left) then
  begin
    if (FLayout.Direction = TYogaDirection.RTL) then
      Exit(AValues[TYogaEdge.Stop])
    else
      Exit(AValues[TYogaEdge.Start]);
  end;

  if (AEdge = TYogaEdge.Right) then
  begin
    if (FLayout.Direction = TYogaDirection.RTL) then
      Exit(AValues[TYogaEdge.Start])
    else
      Exit(AValues[TYogaEdge.Stop]);
  end;

  Result := AValues[AEdge];
end;

function TYogaNode.GetLeadingMargin(const AAxis: TYogaFlexDirection;
  const AWidthSize: Single): TFloatOptional;
begin
  if AAxis.IsRow and (FStyle.Margin[TYogaEdge.Start].Units <> TYogaUnit.Undefined) then
    Exit(FStyle.Margin[TYogaEdge.Start].ResolveMargin(AWidthSize));

  Result := ComputedEdgeValue(FStyle.Margin, LEADING[AAxis], YOGA_VALUE_ZERO).ResolveMargin(AWidthSize);
end;

function TYogaNode.GetLeadingPadding(const AAxis: TYogaFlexDirection;
  const AWidthSize: Single): TFloatOptional;
var
  PaddingEdgeStart, ResolvedValue: TFloatOptional;
begin
  PaddingEdgeStart := FStyle.Padding[TYogaEdge.Start].Resolve(AWidthSize);
  if AAxis.IsRow and (FStyle.Padding[TYogaEdge.Start].Units <> TYogaUnit.Undefined)
    and (not PaddingEdgeStart.IsUndefined) and (PaddingEdgeStart.Value > 0.0)
  then
    Exit(PaddingEdgeStart);

  ResolvedValue := ComputedEdgeValue(FStyle.Padding, LEADING[AAxis], YOGA_VALUE_ZERO).Resolve(AWidthSize);
  Result := TFloatOptional.Max(ResolvedValue, FLOAT_OPT_ZERO);
end;

function TYogaNode.GetLeadingPosition(const AAxis: TYogaFlexDirection;
  const AAxisSize: Single): TFloatOptional;
var
  LeadingPosition: TYogaValue;
begin
  if (AAxis.IsRow) then
  begin
    LeadingPosition := ComputedEdgeValue(FStyle.Position, TYogaEdge.Start, YOGA_VALUE_UNDEFINED);
    if (LeadingPosition.Units <> TYogaUnit.Undefined) then
      Exit(LeadingPosition.Resolve(AAxisSize));
  end;

  LeadingPosition := ComputedEdgeValue(FStyle.Position, LEADING[AAxis], YOGA_VALUE_UNDEFINED);
  if (LeadingPosition.Units = TYogaUnit.Undefined) then
    Result := FLOAT_OPT_ZERO
  else
    Result := LeadingPosition.Resolve(AAxisSize);
end;

function TYogaNode.GetMargin(const AIndex: TYogaEdge): TYogaValue;
begin
  Result := GetStyleEdgeValue(FStyle.Margin, AIndex);
end;

function TYogaNode.GetMarginForAxis(const AAxis: TYogaFlexDirection;
  const AWidthSize: Single): TFloatOptional;
begin
  Result := GetLeadingMargin(AAxis, AWidthSize) + GetTrailingMargin(AAxis, AWidthSize);
end;

function TYogaNode.GetMaxHeight: TYogaValue;
begin
  Result := GetStyleValue(FStyle.MaxDimensions[TDimension.Height]);
end;

function TYogaNode.GetMaxWidth: TYogaValue;
begin
  Result := GetStyleValue(FStyle.MaxDimensions[TDimension.Width]);
end;

function TYogaNode.GetMinHeight: TYogaValue;
begin
  Result := GetStyleValue(FStyle.MinDimensions[TDimension.Height]);
end;

function TYogaNode.GetMinWidth: TYogaValue;
begin
  Result := GetStyleValue(FStyle.MinDimensions[TDimension.Width]);
end;

function TYogaNode.GetPadding(const AIndex: TYogaEdge): TYogaValue;
begin
  Result := GetStyleEdgeValue(FStyle.Padding, AIndex);
end;

function TYogaNode.GetPos(const AIndex: TYogaEdge): TYogaValue;
begin
  Result := GetStyleEdgeValue(FStyle.Position, AIndex);
end;

class function TYogaNode.GetStyleEdgeValue(const AValues: TEdgeValues;
  const AEdge: TYogaEdge): TYogaValue;
begin
  Result := AValues[AEdge];
  if (Result.Units in [TYogaUnit.Undefined, TYogaUnit.Auto]) then
    Result.FValue := YOGA_UNDEFINED;
end;

class function TYogaNode.GetStyleValue(const AValue: TYogaValue): TYogaValue;
begin
  Result := AValue;
  if (AValue.Units in [TYogaUnit.Undefined, TYogaUnit.Auto]) then
    Result.FValue := YOGA_UNDEFINED;
end;

function TYogaNode.GetTrailingMargin(const AAxis: TYogaFlexDirection;
  const AWidthSize: Single): TFloatOptional;
begin
  if AAxis.IsRow and (FStyle.Margin[TYogaEdge.Stop].Units <> TYogaUnit.Undefined) then
    Exit(FStyle.Margin[TYogaEdge.Stop].ResolveMargin(AWidthSize));

  Result := ComputedEdgeValue(FStyle.Margin, TRAILING[AAxis], YOGA_VALUE_ZERO).ResolveMargin(AWidthSize);
end;

function TYogaNode.GetTrailingPadding(const AAxis: TYogaFlexDirection;
  const AWidthSize: Single): TFloatOptional;
var
  PaddingEdgeStop, ResolvedValue: TFloatOptional;
begin
  PaddingEdgeStop := FStyle.Padding[TYogaEdge.Stop].Resolve(AWidthSize);
  if AAxis.IsRow and (FStyle.Padding[TYogaEdge.Stop].Units <> TYogaUnit.Undefined)
    and (not PaddingEdgeStop.IsUndefined) and (PaddingEdgeStop.Value >= 0.0)
  then
    Exit(PaddingEdgeStop);

  ResolvedValue := ComputedEdgeValue(FStyle.Padding, TRAILING[AAxis], YOGA_VALUE_ZERO).Resolve(AWidthSize);
  Result := TFloatOptional.Max(ResolvedValue, FLOAT_OPT_ZERO);
end;

function TYogaNode.GetTrailingPosition(const AAxis: TYogaFlexDirection;
  const AAxisSize: Single): TFloatOptional;
var
  TrailingPosition: TYogaValue;
begin
  if (AAxis.IsRow) then
  begin
    TrailingPosition := ComputedEdgeValue(FStyle.Position, TYogaEdge.Stop, YOGA_VALUE_UNDEFINED);
    if (TrailingPosition.Units <> TYogaUnit.Undefined) then
      Exit(TrailingPosition.Resolve(AAxisSize));
  end;

  TrailingPosition := ComputedEdgeValue(FStyle.Position, TRAILING[AAxis], YOGA_VALUE_UNDEFINED);
  if (TrailingPosition.Units = TYogaUnit.Undefined) then
    Result := FLOAT_OPT_ZERO
  else
    Result := TrailingPosition.Resolve(AAxisSize);
end;

function TYogaNode.GetWidth: TYogaValue;
begin
  Result := GetStyleValue(FStyle.Dimensions[TDimension.Width]);
end;

function TYogaNode.IndexOf(const AChild: TYogaNode): Integer;
var
  I: Integer;
begin
  for I := 0 to FChildCount - 1 do
  begin
    if (AChild = FChildren[I]) then
      Exit(I);
  end;
  Result := -1;
end;

procedure TYogaNode.Insert(const AIndex: Integer; const AChild: TYogaNode);
var
  Capacity: Integer;
begin
  Assert(Assigned(AChild));
  Assert((AIndex >= 0) and (AIndex <= FChildCount));
  Assert(AChild.FParent = nil, 'Child already has a owner, it must be removed first.');
  Assert(not Assigned(FOnMeasure), 'Cannot add child: Nodes with measure functions cannot have children.');

  Capacity := Length(FChildren);
  if (FChildCount >= Capacity) then
  begin
    if (Capacity > 64) then
      Capacity := (Capacity * 3) shr 1
    else if (Capacity > 8) then
      Inc(Capacity, 16)
    else
      Inc(Capacity, 4);
    SetLength(FChildren, Capacity);
  end;

  if (AIndex <> FChildCount) then
  begin
    Move(FChildren[AIndex], FChildren[AIndex + 1], (FChildCount - AIndex) * SizeOf(TYogaNode));
    {$IFDEF AUTOREFCOUNT}
    Pointer(FChildren[AIndex]) := nil;
    {$ENDIF}
  end;

  FChildren[AIndex] := AChild;
  Inc(FChildCount);

  AChild.FParent := Self;
  MarkDirtyAndPropogate;
end;

function TYogaNode.IsBaselineLayout: Boolean;
var
  I: Integer;
  Child: TYogaNode;
begin
  if (FStyle.FlexDirection.IsColumn) then
    Exit(False);

  if (FStyle.AlignItems = TYogaAlign.Baseline) then
    Exit(True);

  for I := 0 to FChildCount - 1 do
  begin
    Child := FChildren[I];
    if (Child.FStyle.PositionType = TYogaPositionType.Relative)
      and (Child.FStyle.AlignSelf = TYogaAlign.Baseline)
    then
      Exit(True);
  end;

  Result := False;
end;

function TYogaNode.IsFlexible: Boolean;
begin
  Result := (FStyle.PositionType = TYogaPositionType.Relative) and
    ((ResolveFlexGrow <> 0.0) or (ResolveFlexShrink <> 0.0));
end;

function TYogaNode.IsLayoutDimDefined(const AAxis: TYogaFlexDirection): Boolean;
var
  Value: Single;
begin
  Value := FLayout.MeasuredDimensions[DIM[AAxis]];
  Result := (not YogaIsUndefined(Value)) and (Value >= 0.0);
end;

function TYogaNode.IsLeadingPositionDefined(
  const AAxis: TYogaFlexDirection): Boolean;
begin
  Result := (AAxis.IsRow and
    (ComputedEdgeValue(FStyle.Position, TYogaEdge.Start, YOGA_VALUE_UNDEFINED).Units <> TYogaUnit.Undefined)) or
    (ComputedEdgeValue(FStyle.Position, LEADING[AAxis], YOGA_VALUE_UNDEFINED).Units <> TYogaUnit.Undefined);
end;

function TYogaNode.IsStyleDimDefined(const AAxis: TYogaFlexDirection;
  const AParentSize: Single): Boolean;
var
  IsUndefined: Boolean;
  V: TYogaValue;
begin
  V := FResolvedDimensions[DIM[AAxis]];
  IsUndefined := YogaIsUndefined(V.Value);
  Result := not (
    (V.Units in [TYogaUnit.Auto, TYogaUnit.Undefined]) or
    ((V.Units = TYogaUnit.Auto) and (not IsUndefined) and (V.Value < 0.0)) or
    ((V.Units = TYogaUnit.Percent) and (not IsUndefined) and
     ((V.Value < 0.0) or (YogaIsUndefined(AParentSize)))));
end;

function TYogaNode.IsTrailingPositionDefined(
  const AAxis: TYogaFlexDirection): Boolean;
begin
  Result := (AAxis.IsRow and
    (ComputedEdgeValue(FStyle.Position, TYogaEdge.Stop, YOGA_VALUE_UNDEFINED).Units <> TYogaUnit.Undefined)) or
    (ComputedEdgeValue(FStyle.Position, TRAILING[AAxis], YOGA_VALUE_UNDEFINED).Units <> TYogaUnit.Undefined);
end;

procedure TYogaNode.JustifyMainAxis(
  var ACollectedFlexItemValues: TCollectFlexItemsRowValues;
  const AStartOfLineIndex: Integer; const AMainAxis, ACrossAxis: TYogaFlexDirection;
  const AMeasureModeMainDim, AMeasureModeCrossDim: TYogaMeasureMode;
  const AMainAxisParentSize, AParentWidth, AAvailableInnerMainDim,
  AAvailableInnerCrossDim, AAvailableInnerWidth: Single;
  const APerformLayout: Boolean);
var
  LeadingPaddingMain, TrailingPaddingMain, MinAvailableMainDim: Single;
  OccupiedSpaceByChildNodes, LeadingMainDim, BetweenMainDim: Single;
  MaxAscentForCurrentLine, MaxDescentForCurrentLine, Ascent, Descent: Single;
  IsNodeBaselineLayout, CanSkipFlex: Boolean;
  I, NumberOfAutoMarginsOnCurrentLine: Integer;
  JustifyContent: TYogaJustify;
  Child: TYogaNode;
begin
  LeadingPaddingMain := GetLeadingPadding(AMainAxis, AParentWidth).Unwrap;
  TrailingPaddingMain := GetTrailingPadding(AMainAxis, AParentWidth).Unwrap;

  { If we are using "at most" rules in the main axis, make sure that
    RemainingFreeSpace is 0 when min main dimension is not given }
  if (AMeasureModeMainDim = TYogaMeasureMode.AtMost)
    and (ACollectedFlexItemValues.RemainingFreeSpace > 0) then
  begin
    if (FStyle.MinDimensions[DIM[AMainAxis]].Units <> TYogaUnit.Undefined)
      and (not FStyle.MinDimensions[DIM[AMainAxis]].Resolve(AMainAxisParentSize).IsUndefined) then
    begin
      { This condition makes sure that if the size of main dimension(after
        considering child nodes main dim, leading and trailing padding etc)
        falls below min dimension, then the remainingFreeSpace is reassigned
        considering the min dimension

        MinAvailableMainDim denotes minimum available space in which child
        can be laid out, it will exclude space consumed by padding and border. }
      MinAvailableMainDim := FStyle.MinDimensions[DIM[AMainAxis]].Resolve(AMainAxisParentSize).Unwrap
        - LeadingPaddingMain - TrailingPaddingMain;

      OccupiedSpaceByChildNodes := AAvailableInnerMainDim
        - ACollectedFlexItemValues.RemainingFreeSpace;

      ACollectedFlexItemValues.RemainingFreeSpace :=
        YogaMax(0, MinAvailableMainDim - OccupiedSpaceByChildNodes);
    end
    else
      ACollectedFlexItemValues.RemainingFreeSpace := 0;
  end;

  NumberOfAutoMarginsOnCurrentLine := 0;
  for I := AStartOfLineIndex to ACollectedFlexItemValues.EndOfLineIndex - 1 do
  begin
    Child := FChildren[I];
    if (Child.FStyle.PositionType = TYogaPositionType.Relative) then
    begin
      if (Child.MarginLeadingValue(AMainAxis).Units = TYogaUnit.Auto) then
        Inc(NumberOfAutoMarginsOnCurrentLine);

      if (Child.MarginTrailingValue(AMainAxis).Units = TYogaUnit.Auto) then
        Inc(NumberOfAutoMarginsOnCurrentLine);
    end;
  end;

  { In order to position the elements in the main axis, we have two
    controls. The space between the beginning and the first element
    and the space between each two elements. }
  LeadingMainDim := 0;
  BetweenMainDim := 0;
  JustifyContent := FStyle.JustifyContent;

  if (NumberOfAutoMarginsOnCurrentLine = 0) then
  begin
    case JustifyContent of
      TYogaJustify.Center:
        LeadingMainDim := ACollectedFlexItemValues.RemainingFreeSpace * 0.5;

      TYogaJustify.FlexEnd:
        LeadingMainDim := ACollectedFlexItemValues.RemainingFreeSpace;

      TYogaJustify.SpaceBetween:
        if (ACollectedFlexItemValues.ItemsOnLine > 1) then
        begin
          BetweenMainDim := YogaMax(ACollectedFlexItemValues.RemainingFreeSpace, 0)
            / (ACollectedFlexItemValues.ItemsOnLine - 1);
        end
        else
          BetweenMainDim := 0;

      TYogaJustify.SpaceEvenly:
        begin
          { Space is distributed evenly across all elements }
          BetweenMainDim := ACollectedFlexItemValues.RemainingFreeSpace
            / (ACollectedFlexItemValues.ItemsOnLine + 1);
          LeadingMainDim := BetweenMainDim;
        end;

      TYogaJustify.SpaceAround:
        begin
          { Space on the edges is half of the space between elements }
          BetweenMainDim := ACollectedFlexItemValues.RemainingFreeSpace
            / ACollectedFlexItemValues.ItemsOnLine;
          LeadingMainDim := BetweenMainDim * 0.5;
        end;
    end;
  end;

  ACollectedFlexItemValues.MainDim := LeadingPaddingMain + LeadingMainDim;
  ACollectedFlexItemValues.CrossDim := 0;

  MaxAscentForCurrentLine := 0;
  MaxDescentForCurrentLine := 0;
  IsNodeBaselineLayout := IsBaselineLayout;

  for I := AStartOfLineIndex to ACollectedFlexItemValues.EndOfLineIndex - 1 do
  begin
    Child := FChildren[I];
    if (Child.FStyle.Display = TYogaDisplay.None) then
      Continue;

    if (Child.FStyle.PositionType = TYogaPositionType.Absolute)
      and (Child.IsLeadingPositionDefined(AMainAxis)) then
    begin
      if (APerformLayout) then
      begin
        { In case the child is position absolute and has left/top being defined,
          we override the position to whatever the user said (and margin/border). }
        Child.FLayout.Position[POS[AMainAxis]] :=
          Child.GetLeadingPosition(AMainAxis, AAvailableInnerMainDim).Unwrap +
          Child.GetLeadingMargin(AMainAxis, AAvailableInnerWidth).Unwrap;
      end;
    end
    else
    begin
      { Now that we placed the element, we need to update the variables.
        We need to do that only for relative elements. Absolute elements
        do not take part in that phase. }
      if (Child.FStyle.PositionType = TYogaPositionType.Relative) then
      begin
        if (Child.MarginLeadingValue(AMainAxis).Units = TYogaUnit.Auto) then
        begin
          ACollectedFlexItemValues.MainDim := ACollectedFlexItemValues.MainDim +
            (ACollectedFlexItemValues.RemainingFreeSpace / NumberOfAutoMarginsOnCurrentLine);
        end;

        if (APerformLayout) then
        begin
          Child.FLayout.Position[POS[AMainAxis]] :=
            Child.FLayout.Position[POS[AMainAxis]] + ACollectedFlexItemValues.MainDim;
        end;

        if (Child.MarginTrailingValue(AMainAxis).Units = TYogaUnit.Auto) then
        begin
          ACollectedFlexItemValues.MainDim := ACollectedFlexItemValues.MainDim +
            (ACollectedFlexItemValues.RemainingFreeSpace / NumberOfAutoMarginsOnCurrentLine);
        end;

        CanSkipFlex := (not APerformLayout) and (AMeasureModeCrossDim = TYogaMeasureMode.Exactly);
        if (CanSkipFlex) then
        begin
          { If we skipped the flex step, then we can't rely on the MeasuredDims
            because they weren't computed. This means we can't call
            DimWithMargin. }
          ACollectedFlexItemValues.MainDim := ACollectedFlexItemValues.MainDim +
            Child.GetMarginForAxis(AMainAxis, AAvailableInnerWidth).Unwrap +
            Child.FLayout.ComputedFlexBasis.Unwrap;
          ACollectedFlexItemValues.CrossDim := AAvailableInnerCrossDim;
        end
        else
        begin
          { The main dimension is the sum of all the elements dimension plus
            the spacing. }
          ACollectedFlexItemValues.MainDim := ACollectedFlexItemValues.MainDim +
            BetweenMainDim + Child.DimWithMargin(AMainAxis, AAvailableInnerWidth);

          if (IsNodeBaselineLayout) then
          begin
            { If the child is baseline aligned then the cross dimension is
              calculated by adding maxAscent and maxDescent from the baseline. }
            Ascent := Child.Baseline +
              Child.GetLeadingMargin(TYogaFlexDirection.Column, AAvailableInnerWidth).Unwrap;
            Descent := Child.FLayout.MeasuredDimensions[TDimension.Height] +
              Child.GetMarginForAxis(TYogaFlexDirection.Column, AAvailableInnerWidth).Unwrap -
              Ascent;

            MaxAscentForCurrentLine := YogaMax(MaxAscentForCurrentLine, Ascent);
            MaxDescentForCurrentLine := YogaMax(MaxDescentForCurrentLine, Descent);
          end
          else
          begin
            { The cross dimension is the max of the elements dimension since
              there can only be one element in that cross dimension in the case
              when the items are not baseline aligned }
            ACollectedFlexItemValues.CrossDim := YogaMax(
              ACollectedFlexItemValues.CrossDim,
              Child.DimWithMargin(ACrossAxis, AAvailableInnerWidth));
          end;
        end;
      end
      else if (APerformLayout) then
      begin
        Child.FLayout.Position[POS[AMainAxis]] :=
          Child.FLayout.Position[POS[AMainAxis]] + LeadingMainDim;
      end;
    end;
  end;

  ACollectedFlexItemValues.MainDim := ACollectedFlexItemValues.MainDim +
    TrailingPaddingMain;

  if (IsNodeBaselineLayout) then
    ACollectedFlexItemValues.CrossDim := MaxAscentForCurrentLine + MaxDescentForCurrentLine;
end;

procedure TYogaNode.LayoutImpl(const AAvailableWidth, AAvailableHeight: Single;
  const AParentDirection: TYogaDirection; const AWidthMeasureMode,
  AHeightMeasureMode: TYogaMeasureMode; const AParentWidth,
  AParentHeight: Single; const APerformLayout: Boolean);
{ This is the main routine that implements a subset of the flexbox layout
  algorithm described in the W3C YG documentation: https://www.w3.org/TR/YG3-flexbox/.

  Limitations of this algorithm, compared to the full standard:
  * Display property is always assumed to be 'flex' except for Text nodes, which
    are assumed to be 'inline-flex'.
  * The 'zIndex' property (or any form of z ordering) is not supported. Nodes
    are stacked in document order.
  * The 'order' property is not supported. The order of flex items is always
    defined by document order.
  * The 'visibility' property is always assumed to be 'visible'. Values of
    'collapse' and 'hidden' are not supported.
  * There is no support for forced breaks.
  * It does not support vertical inline directions (top-to-bottom or
    bottom-to-top text).

  Deviations from standard:
  * Section 4.5 of the spec indicates that all flex items have a default minimum
    main size. For text blocks, for example, this is the width of the widest
    word. Calculating the minimum width is expensive, so we forego it and assume
    a default minimum main size of 0.
  * Min/Max sizes in the main axis are not honored when resolving flexible
    lengths.
  * The spec indicates that the default value for 'flexDirection' is 'row', but
    the algorithm below assumes a default of 'column'.

  Input parameters:
  * AAvailableWidth & AAvailableHeight: available size to be used for sizing
    the node or YogaUndefined if the size is not available; interpretation
    depends on layout flags
  * AParentDirection: the inline (text) direction within the parent (
    left-to-right or right-to-left)
  * AWidthMeasureMode: indicates the sizing rules for the width (see below for
    explanation)
  * AHeightMeasureMode: indicates the sizing rules for the height (see below
    for explanation)
  * APerformLayout: specifies whether the caller is interested in just the
    dimensions of the node or it requires the entire node and its subtree to be
    layed out (with final positions)

  Details:
    This routine is called recursively to lay out subtrees of flexbox elements.
    It uses the information in node.style, which is treated as a read-only
    input. It is responsible for setting the layout.direction and
    FLayout.MeasuredDimensions fields for the input node as well as the
    FLayout.Position and FLayout.LineIndex fields for its child nodes.
    The FLayout.MeasuredDimensions field includes any border or padding for the
    node but does not include margins.

    The spec describes four different layout modes: "fill available", "max
    content", "min content", and "fit content". Of these, we don't use "min
    content" because we don't support default minimum main sizes (see above for
    details). Each of our measure modes maps to a layout mode from the spec
    (https://www.w3.org/TR/YG3-sizing/#terms):
    - Undefined: max content
    - Exactly: fill available
    - AtMost: fit content

    When calling LayoutImpl and LayoutInternal, if the caller passes an
    available size of undefined then it must also pass a measure mode of
    Undefined in that dimension. }
var
  Direction: TYogaDirection;
  FlexRowDirection, FlexColumnDirection, MainAxis, CrossAxis: TYogaFlexDirection;
  MeasureModeMainDim, MeasureModeCrossDim: TYogaMeasureMode;
  ChildMainMeasureMode, ChildCrossMeasureMode: TYogaMeasureMode;
  ChildWidthMeasureMode, ChildHeightMeasureMode: TYogaMeasureMode;
  IsMainAxisRow, IsNodeFlexWrap, FlexBasisOverflows, CanSkipFlex: Boolean;
  SizeBasedOnContent, IsChildLeadingPosDefined: Boolean;
  NeedsMainTrailingPos, NeedsCrossTrailingPos: Boolean;
  MainAxisParentSize, CrossAxisParentSize, LeadingPaddingCross: Single;
  PaddingAxisMain, PaddingAxisCross, PaddingAxisRow, PaddingAxisColumn: Single;
  MarginAxisRow, MarginAxisColumn, MinInnerMainDim, MaxInnerMainDim: Single;
  MinInnerWidth, MaxInnerWidth, MinInnerHeight, MaxInnerHeight: Single;
  AvailableInnerWidth, AvailableInnerHeight, TotalOuterFlexBasis: Single;
  AvailableInnerMainDim, AvailableInnerCrossDim, TotalLineCrossDim: Single;
  MaxLineMainDim, ContainerCrossAxis, LeadingCrossDim, S: Single;
  ChildMainSize, ChildCrossSize, ChildWidth, ChildHeight: Single;
  RemainingCrossDim, CrossDimLead, CurrentLead, RemainingAlignContentDim: Single;
  LineHeight, MaxAscentForCurrentLine, MaxDescentForCurrentLine: Single;
  Ascent, Descent: Single;
  ChildCount, StartOfLineIndex, EndOfLineIndex, LineCount, I, II: Integer;
  StartIndex, EndIndex: Integer;
  CollectFlexItemsValues: TCollectFlexItemsRowValues;
  Child: TYogaNode;
  AlignItem: TYogaAlign;
begin
  Assert((not YogaIsUndefined(AAvailableWidth)) or (AWidthMeasureMode = TYogaMeasureMode.Undefined),
    'AAvailableWidth is indefinite so AWidthMeasureMode must be Undefined');
  Assert((not YogaIsUndefined(AAvailableHeight)) or (AHeightMeasureMode = TYogaMeasureMode.Undefined),
    'AAvailableHeight is indefinite so AHeightMeasureMode must be Undefined');

  { Set the resolved resolution in the node's layout. }
  Direction := ResolveDirection(AParentDirection);
  FLayout.Direction := Direction;

  FlexRowDirection := TYogaFlexDirection.Row.Resolve(Direction);
  FlexColumnDirection := TYogaFlexDirection.Column.Resolve(Direction);

  FLayout.Margin[TYogaEdge.Start] := GetLeadingMargin(FlexRowDirection, AParentWidth).Unwrap;
  FLayout.Margin[TYogaEdge.Stop] := GetTrailingMargin(FlexRowDirection, AParentWidth).Unwrap;
  FLayout.Margin[TYogaEdge.Top] := GetLeadingMargin(FlexColumnDirection, AParentWidth).Unwrap;
  FLayout.Margin[TYogaEdge.Bottom] := GetTrailingMargin(FlexColumnDirection, AParentWidth).Unwrap;

  { TODO : Border? }

  FLayout.Padding[TYogaEdge.Start] := GetLeadingPadding(FlexRowDirection, AParentWidth).Unwrap;
  FLayout.Padding[TYogaEdge.Stop] := GetTrailingPadding(FlexRowDirection, AParentWidth).Unwrap;
  FLayout.Padding[TYogaEdge.Top] := GetLeadingPadding(FlexColumnDirection, AParentWidth).Unwrap;
  FLayout.Padding[TYogaEdge.Bottom] := GetTrailingPadding(FlexColumnDirection, AParentWidth).Unwrap;

  if Assigned(FOnMeasure) then
  begin
    DoMeasureSetMeasuredDimensions(AAvailableWidth, AAvailableHeight,
      AWidthMeasureMode, AHeightMeasureMode, AParentWidth, AParentHeight);
    Exit;
  end;

  ChildCount := FChildCount;
  if (ChildCount = 0) then
  begin
    EmptyContainerSetMeasuredDimensions(AAvailableWidth, AAvailableHeight,
      AWidthMeasureMode, AHeightMeasureMode, AParentWidth, AParentHeight);
    Exit;
  end;

  { If we're not being asked to perform a full layout we can skip the algorithm
    if we already know the size }
  if (not APerformLayout) and FixedSizeSetMeasuredDimensions(AAvailableWidth,
    AAvailableHeight, AWidthMeasureMode, AHeightMeasureMode, AParentWidth,
    AParentHeight)
  then
    Exit;

  { At this point we know we're going to perform work.
    Reset layout flags, as they could have changed. }
  FLayout.HadOverflow := False;

  { STEP 1: CALCULATE VALUES FOR REMAINDER OF ALGORITHM }
  MainAxis := FStyle.FlexDirection.Resolve(Direction);
  CrossAxis := MainAxis.Cross(Direction);
  IsMainAxisRow := MainAxis.IsRow;
  IsNodeFlexWrap := (FStyle.FlexWrap <> TYogaWrap.No);

  if (IsMainAxisRow) then
  begin
    MainAxisParentSize := AParentWidth;
    CrossAxisParentSize := AParentHeight;
  end
  else
  begin
    MainAxisParentSize := AParentHeight;
    CrossAxisParentSize := AParentWidth;
  end;

  { TODO : Border? }
  LeadingPaddingCross := GetLeadingPadding(CrossAxis, AParentWidth).Unwrap;
  PaddingAxisMain := PaddingForAxis(MainAxis, AParentWidth);
  PaddingAxisCross := PaddingForAxis(CrossAxis, AParentWidth);

  if (IsMainAxisRow) then
  begin
    MeasureModeMainDim := AWidthMeasureMode;
    MeasureModeCrossDim := AHeightMeasureMode;
    PaddingAxisRow := PaddingAxisMain;
    PaddingAxisColumn := PaddingAxisCross;
  end
  else
  begin
    MeasureModeMainDim := AHeightMeasureMode;
    MeasureModeCrossDim := AWidthMeasureMode;
    PaddingAxisRow := PaddingAxisCross;
    PaddingAxisColumn := PaddingAxisMain;
  end;

  MarginAxisRow := GetMarginForAxis(TYogaFlexDirection.Row, AParentWidth).Unwrap;
  MarginAxisColumn := GetMarginForAxis(TYogaFlexDirection.Column, AParentWidth).Unwrap;

  MinInnerWidth := FStyle.MinDimensions[TDimension.Width].Resolve(AParentWidth).Unwrap - PaddingAxisRow;
  MaxInnerWidth := FStyle.MaxDimensions[TDimension.Width].Resolve(AParentWidth).Unwrap - PaddingAxisRow;
  MinInnerHeight := FStyle.MinDimensions[TDimension.Height].Resolve(AParentHeight).Unwrap - PaddingAxisColumn;
  MaxInnerHeight := FStyle.MaxDimensions[TDimension.Height].Resolve(AParentHeight).Unwrap - PaddingAxisColumn;

  if (IsMainAxisRow) then
  begin
    MinInnerMainDim := MinInnerWidth;
    MaxInnerMainDim := MaxInnerWidth;
  end
  else
  begin
    MinInnerMainDim := MinInnerHeight;
    MaxInnerMainDim := MaxInnerHeight;
  end;

  { STEP 2: DETERMINE AVAILABLE SIZE IN MAIN AND CROSS DIRECTIONS }
  AvailableInnerWidth := CalculateAvailableInnerDim(TYogaFlexDirection.Row,
    AAvailableWidth, AParentWidth);
  AvailableInnerHeight := CalculateAvailableInnerDim(TYogaFlexDirection.Column,
    AAvailableHeight, AParentHeight);

  if (IsMainAxisRow) then
  begin
    AvailableInnerMainDim := AvailableInnerWidth;
    AvailableInnerCrossDim := AvailableInnerHeight;
  end
  else
  begin
    AvailableInnerMainDim := AvailableInnerHeight;
    AvailableInnerCrossDim := AvailableInnerWidth;
  end;

  { STEP 3: DETERMINE FLEX BASIS FOR EACH ITEM }
  TotalOuterFlexBasis := 0;
  ComputeFlexBasisForChildren(AvailableInnerWidth, AvailableInnerHeight,
    AWidthMeasureMode, AHeightMeasureMode, Direction, MainAxis, APerformLayout,
    TotalOuterFlexBasis);

  if (MeasureModeMainDim = TYogaMeasureMode.Undefined) then
    FlexBasisOverflows := False
  else
    FlexBasisOverflows := (TotalOuterFlexBasis > AvailableInnerMainDim);

  if (IsNodeFlexWrap and FlexBasisOverflows and (MeasureModeMainDim = TYogaMeasureMode.AtMost)) then
    MeasureModeMainDim := TYogaMeasureMode.Exactly;

  { STEP 4: COLLECT FLEX ITEMS INTO FLEX LINES }

  { Indexes of children that represent the first and last items in the line. }
  StartOfLineIndex := 0;
  EndOfLineIndex := 0;

  { Number of lines. }
  LineCount := 0;

  { Accumulated cross dimensions of all lines so far. }
  TotalLineCrossDim := 0;

  { Max main dimension of all the lines. }
  MaxLineMainDim := 0;
  while (EndOfLineIndex < ChildCount) do
  begin
    CalculateCollectFlexItemsRowValues(AParentDirection, MainAxisParentSize,
      AvailableInnerWidth, AvailableInnerMainDim, StartOfLineIndex,
      LineCount, CollectFlexItemsValues);

    EndOfLineIndex := CollectFlexItemsValues.EndOfLineIndex;

    { If we don't need to measure the cross axis, we can skip the entire flex
      step. }
    CanSkipFlex := (not APerformLayout) and (MeasureModeCrossDim = TYogaMeasureMode.Exactly);

    { STEP 5: RESOLVING FLEXIBLE LENGTHS ON MAIN AXIS
      Calculate the remaining available space that needs to be allocated.
      If the main dimension size isn't known, it is computed based on the line
      length, so there's no more space left to distribute. }
    SizeBasedOnContent := False;

    { If we don't measure with exact main dimension we want to ensure we don't
      violate min and max }
    if (MeasureModeMainDim <> TYogaMeasureMode.Exactly) then
    begin
      if (not YogaIsUndefined(MinInnerMainDim))
        and (CollectFlexItemsValues.SizeConsumedOnCurrentLine < MinInnerMainDim)
      then
        AvailableInnerMainDim := MinInnerMainDim
      else if (not YogaIsUndefined(MaxInnerMainDim))
        and (CollectFlexItemsValues.SizeConsumedOnCurrentLine > MaxInnerMainDim)
      then
        AvailableInnerMainDim := MaxInnerMainDim
      else
      begin
        { If we don't have any children to flex or we can't flex the node
          itself, space we've used is all space we need. Root node also should
          be shrunk to minimum }
        if YogaIsUndefined(CollectFlexItemsValues.TotalFlexGrowFactors)
          and (CollectFlexItemsValues.TotalFlexGrowFactors = 0)
        then
          AvailableInnerMainDim := CollectFlexItemsValues.SizeConsumedOnCurrentLine
        else
        begin
          S := ResolveFlexGrow;
          if YogaIsUndefined(S) and (S = 0) then
            AvailableInnerMainDim := CollectFlexItemsValues.SizeConsumedOnCurrentLine
        end;

        SizeBasedOnContent := True;
      end;
    end;

    if (not SizeBasedOnContent) and (not YogaIsUndefined(AvailableInnerMainDim)) then
    begin
      CollectFlexItemsValues.RemainingFreeSpace := AvailableInnerMainDim -
        CollectFlexItemsValues.SizeConsumedOnCurrentLine;
    end
    else if (CollectFlexItemsValues.SizeConsumedOnCurrentLine < 0) then
    begin
      { AvailableInnerMainDim is indefinite which means the node is being sized
        based on its content. SizeConsumedOnCurrentLine is negative which means
        the node will allocate 0 points for its content. Consequently,
        RemainingFreeSpace is 0 - SizeConsumedOnCurrentLine. }
      CollectFlexItemsValues.RemainingFreeSpace :=
        -CollectFlexItemsValues.SizeConsumedOnCurrentLine;
    end;

    if (not CanSkipFlex) then
    begin
      ResolveFlexibleLength(CollectFlexItemsValues, MainAxis, CrossAxis,
        MainAxisParentSize, AvailableInnerMainDim, AvailableInnerCrossDim,
        AvailableInnerWidth, AAvailableHeight, FlexBasisOverflows,
        MeasureModeCrossDim, APerformLayout);
    end;

    FLayout.HadOverflow := FLayout.HadOverflow or (CollectFlexItemsValues.RemainingFreeSpace < 0);

    { STEP 6: MAIN-AXIS JUSTIFICATION & CROSS-AXIS SIZE DETERMINATION

      At this point, all the children have their dimensions set in the main axis.
      Their dimensions are also set in the cross axis with the exception of
      items that are aligned "stretch". We need to compute these stretch values
      and set the final positions. }
    JustifyMainAxis(CollectFlexItemsValues, StartOfLineIndex, MainAxis,
      CrossAxis, MeasureModeMainDim, MeasureModeCrossDim, MainAxisParentSize,
      AParentWidth, AvailableInnerMainDim, AvailableInnerCrossDim,
      AvailableInnerWidth, APerformLayout);

    ContainerCrossAxis := AvailableInnerCrossDim;
    if (MeasureModeCrossDim in [TYogaMeasureMode.Undefined, TYogaMeasureMode.AtMost]) then
    begin
      { Compute the cross axis from the max cross dimension of the children. }
      ContainerCrossAxis := BoundAxis(CrossAxis,
        CollectFlexItemsValues.CrossDim + PaddingAxisCross, CrossAxisParentSize,
        AParentWidth) - PaddingAxisCross;
    end;

    { If there's no flex wrap, the cross dimension is defined by the container. }
    if (not IsNodeFlexWrap) and (MeasureModeCrossDim = TYogaMeasureMode.Exactly) then
      CollectFlexItemsValues.CrossDim := AvailableInnerCrossDim;

    { Clamp to the min/max size specified on the container. }
    CollectFlexItemsValues.CrossDim := BoundAxis(CrossAxis,
      CollectFlexItemsValues.CrossDim + PaddingAxisCross, CrossAxisParentSize,
      AParentWidth) - PaddingAxisCross;

    { STEP 7: CROSS-AXIS ALIGNMENT
      We can skip child alignment if we're just measuring the container. }
    if (APerformLayout) then
    begin
      for I := StartOfLineIndex to EndOfLineIndex - 1 do
      begin
        Child := FChildren[I];
        if (Child.FStyle.Display = TYogaDisplay.None) then
          Continue;

        if (Child.FStyle.PositionType = TYogaPositionType.Absolute) then
        begin
          { If the child is absolutely positioned and has a top/left/bottom/right
            set, override all the previously computed positions to set it
            correctly. }
          IsChildLeadingPosDefined := Child.IsLeadingPositionDefined(CrossAxis);
          if (IsChildLeadingPosDefined) then
          begin
            Child.FLayout.Position[POS[CrossAxis]] := Child.GetLeadingPosition(
              CrossAxis, AvailableInnerCrossDim).Unwrap + { TODO : Border }
              Child.GetLeadingMargin(CrossAxis, AvailableInnerWidth).Unwrap;
          end;

          { If leading position is not defined or calculations result in Nan,
            default to border + margin }
          if (not IsChildLeadingPosDefined) or (YogaIsUndefined(Child.FLayout.Position[POS[CrossAxis]])) then
          begin
            Child.FLayout.Position[POS[CrossAxis]] := { TODO : Border }
              Child.GetLeadingMargin(CrossAxis, AvailableInnerWidth).Unwrap;
          end;
        end
        else
        begin
          LeadingCrossDim := LeadingPaddingCross;

          { For a relative children, we're either using AlignItems (parent) or
            AlignSelf (child) in order to determine the position in the cross
            axis }
          AlignItem := Self.AlignItem(Child);

          { If the child uses align stretch, we need to lay it out one more
            time, this time forcing the cross-axis size to be the computed
            cross size for the current line. }
          if (AlignItem = TYogaAlign.Stretch) and
            (Child.MarginLeadingValue(CrossAxis).Units <> TYogaUnit.Auto) and
            (Child.MarginTrailingValue(CrossAxis).Units <> TYogaUnit.Auto) then
          begin
            { If the child defines a definite size for its cross axis, there's
              no need to stretch. }
            if (not Child.IsStyleDimDefined(CrossAxis, AvailableInnerCrossDim)) then
            begin
              ChildMainSize := Child.FLayout.MeasuredDimensions[DIM[MainAxis]];
              if (not Child.FStyle.AspectRatio.IsUndefined) then
              begin
                ChildCrossSize := Child.GetMarginForAxis(CrossAxis, AvailableInnerWidth).Unwrap;
                if (IsMainAxisRow) then
                  ChildCrossSize := ChildCrossSize + (ChildMainSize / Child.FStyle.AspectRatio.Value)
                else
                  ChildCrossSize := ChildCrossSize + (ChildMainSize * Child.FStyle.AspectRatio.Value);
              end
              else
                ChildCrossSize := CollectFlexItemsValues.CrossDim;

              ChildMainSize := ChildMainSize + Child.GetMarginForAxis(MainAxis,
                AvailableInnerWidth).Unwrap;

              ChildMainMeasureMode := TYogaMeasureMode.Exactly;
              ChildCrossMeasureMode := TYogaMeasureMode.Exactly;

              Child.ConstrainMaxSizeForMode(MainAxis, AvailableInnerMainDim,
                AvailableInnerWidth, ChildMainMeasureMode, ChildMainSize);

              Child.ConstrainMaxSizeForMode(CrossAxis, AvailableInnerCrossDim,
                AvailableInnerWidth, ChildCrossMeasureMode, ChildCrossSize);

              if (IsMainAxisRow) then
              begin
                ChildWidth := ChildMainSize;
                ChildHeight := ChildCrossSize;
              end
              else
              begin
                ChildWidth := ChildCrossSize;
                ChildHeight := ChildMainSize;
              end;

              if (YogaIsUndefined(ChildWidth)) then
                ChildWidthMeasureMode := TYogaMeasureMode.Undefined
              else
                ChildWidthMeasureMode := TYogaMeasureMode.Exactly;

              if (YogaIsUndefined(ChildHeight)) then
                ChildHeightMeasureMode := TYogaMeasureMode.Undefined
              else
                ChildHeightMeasureMode := TYogaMeasureMode.Exactly;

              Child.LayoutInternal(ChildWidth, ChildHeight, Direction,
                ChildWidthMeasureMode, ChildHeightMeasureMode,
                AvailableInnerWidth, AvailableInnerHeight, True);
            end;
          end
          else
          begin
            RemainingCrossDim := ContainerCrossAxis -
              Child.DimWithMargin(CrossAxis, AvailableInnerWidth);

            if (Child.MarginLeadingValue(CrossAxis).Units = TYogaUnit.Auto) and
              (Child.MarginTrailingValue(CrossAxis).Units = TYogaUnit.Auto)
            then
              LeadingCrossDim := LeadingCrossDim + YogaMax(0.0, RemainingCrossDim * 0.5)
            else if (Child.MarginTrailingValue(CrossAxis).Units = TYogaUnit.Auto) then
              { No-op }
            else if (Child.MarginLeadingValue(CrossAxis).Units = TYogaUnit.Auto) then
              LeadingCrossDim := LeadingCrossDim + YogaMax(0.0, RemainingCrossDim)
            else if (AlignItem = TYogaAlign.FlexStart) then
              { No-op }
            else if (AlignItem = TYogaAlign.Center) then
              LeadingCrossDim := LeadingCrossDim + (RemainingCrossDim * 0.5)
            else
              LeadingCrossDim := LeadingCrossDim + RemainingCrossDim;
          end;

          { And we apply the position }
          Child.FLayout.Position[POS[CrossAxis]] :=
            Child.FLayout.Position[POS[CrossAxis]] + TotalLineCrossDim +
            LeadingCrossDim;
        end;
      end;
    end;

    TotalLineCrossDim := TotalLineCrossDim + CollectFlexItemsValues.CrossDim;
    MaxLineMainDim := YogaMax(MaxLineMainDim, CollectFlexItemsValues.MainDim);

    Inc(LineCount);
    StartOfLineIndex := EndOfLineIndex;
  end;

  {  STEP 8: MULTI-LINE CONTENT ALIGNMENT
     CurrentLead stores the size of the cross dim }
  if (APerformLayout) and ((LineCount > 1) or (IsBaselineLayout())) then
  begin
    CrossDimLead := 0;
    CurrentLead := LeadingPaddingCross;
    if (not YogaIsUndefined(AvailableInnerCrossDim)) then
    begin
      RemainingAlignContentDim := AvailableInnerCrossDim - TotalLineCrossDim;
      case FStyle.AlignContent of
        TYogaAlign.FlexEnd:
          CurrentLead := CurrentLead + RemainingAlignContentDim;

        TYogaAlign.Center:
          CurrentLead := CurrentLead + (RemainingAlignContentDim * 0.5);

        TYogaAlign.Stretch:
          if (AvailableInnerCrossDim > TotalLineCrossDim) then
            CrossDimLead := RemainingAlignContentDim / LineCount;

        TYogaAlign.SpaceAround:
          if (AvailableInnerCrossDim > TotalLineCrossDim) then
          begin
            CurrentLead := CurrentLead + (RemainingAlignContentDim / (2 * LineCount));
            if (LineCount > 1) then
              CrossDimLead := RemainingAlignContentDim / LineCount;
          end
          else
            CurrentLead := CurrentLead + (RemainingAlignContentDim * 0.5);

        TYogaAlign.SpaceBetween:
          if (AvailableInnerCrossDim > TotalLineCrossDim) and (LineCount > 1) then
            CrossDimLead := RemainingAlignContentDim / (LineCount - 1);
      end;
    end;

    EndIndex := 0;
    for I := 0 to LineCount - 1 do
    begin
      StartIndex := EndIndex;

      { Compute the line's height and find the EndIndex }
      LineHeight := 0;
      MaxAscentForCurrentLine := 0;
      MaxDescentForCurrentLine := 0;
      II := StartIndex;
      while (II < ChildCount) do
      begin
        Child := FChildren[II];
        if (Child.FStyle.Display = TYogaDisplay.None) then
        begin
          Inc(II);
          Continue;
        end;

        if (Child.FStyle.PositionType = TYogaPositionType.Relative) then
        begin
          if (Child.FLineIndex <> I) then
            Break;

          if (Child.IsLayoutDimDefined(CrossAxis)) then
          begin
            LineHeight := YogaMax(LineHeight,
              Child.FLayout.MeasuredDimensions[DIM[CrossAxis]] +
              Child.GetMarginForAxis(CrossAxis, AvailableInnerWidth).Unwrap);
          end;

          if (Self.AlignItem(Child) = TYogaAlign.Baseline) then
          begin
            Ascent := Child.Baseline + Child.GetLeadingMargin(
              TYogaFlexDirection.Column, AvailableInnerWidth).Unwrap;

            Descent := Child.FLayout.MeasuredDimensions[TDimension.Height] +
              Child.GetMarginForAxis(TYogaFlexDirection.Column,
              AvailableInnerWidth).Unwrap - Ascent;

            MaxAscentForCurrentLine := YogaMax(MaxAscentForCurrentLine, Ascent);
            MaxDescentForCurrentLine := YogaMax(MaxDescentForCurrentLine, Descent);
            LineHeight := YogaMax(LineHeight, MaxAscentForCurrentLine + MaxDescentForCurrentLine);
          end;
        end;
        Inc(II);
      end;

      EndIndex := II;
      LineHeight := LineHeight + CrossDimLead;

      if (APerformLayout) then
      begin
        for II := StartIndex to EndIndex - 1 do
        begin
          Child := FChildren[II];
          if (Child.FStyle.Display = TYogaDisplay.None) then
            Continue;

          if (Child.PositionType = TYogaPositionType.Relative) then
          begin
            case Self.AlignItem(Child) of
              TYogaAlign.FlexStart:
                Child.FLayout.Position[POS[CrossAxis]] := CurrentLead +
                  Child.GetLeadingMargin(CrossAxis, AvailableInnerWidth).Unwrap;

              TYogaAlign.FlexEnd:
                Child.FLayout.Position[POS[CrossAxis]] := CurrentLead + LineHeight -
                  Child.GetTrailingMargin(CrossAxis, AvailableInnerWidth).Unwrap -
                  Child.FLayout.MeasuredDimensions[DIM[CrossAxis]];

              TYogaAlign.Center:
                begin
                  ChildHeight := Child.FLayout.MeasuredDimensions[DIM[CrossAxis]];
                  Child.FLayout.Position[POS[CrossAxis]] := CurrentLead +
                    ((LineHeight - ChildHeight) * 0.5);
                end;

              TYogaAlign.Stretch:
                begin
                  Child.FLayout.Position[POS[CrossAxis]] := CurrentLead +
                    Child.GetLeadingMargin(CrossAxis, AvailableInnerWidth).Unwrap;

                  { Remeasure child with the line height as it as been only
                    measured with the owners height yet.}
                  if (not Child.IsStyleDimDefined(CrossAxis, AvailableInnerCrossDim)) then
                  begin
                    if (IsMainAxisRow) then
                    begin
                      ChildWidth := Child.FLayout.MeasuredDimensions[TDimension.Width] +
                        Child.GetMarginForAxis(MainAxis, AvailableInnerWidth).Unwrap;
                      ChildHeight := LineHeight;
                    end
                    else
                    begin
                      ChildWidth := LineHeight;
                      ChildHeight := Child.FLayout.MeasuredDimensions[TDimension.Height] +
                        Child.GetMarginForAxis(CrossAxis, AvailableInnerWidth).Unwrap;
                    end;

                    if (not (YogaEqual(ChildWidth, Child.FLayout.MeasuredDimensions[TDimension.Width]) and
                      YogaEqual(ChildHeight, Child.FLayout.MeasuredDimensions[TDimension.Height]))) then
                    begin
                      Child.LayoutInternal(ChildWidth, ChildHeight, Direction,
                        TYogaMeasureMode.Exactly, TYogaMeasureMode.Exactly,
                        AvailableInnerWidth, AvailableInnerHeight, True);
                    end;
                  end;
                end;

              TYogaAlign.Baseline:
                Child.FLayout.Position[TYogaEdge.Top] := CurrentLead +
                  MaxAscentForCurrentLine - Child.Baseline +
                  Child.GetLeadingPosition(TYogaFlexDirection.Column, AvailableInnerCrossDim).Unwrap;
            end;
          end;
        end;
      end;

      CurrentLead := CurrentLead + LineHeight;
    end;
  end;

  { STEP 9: COMPUTING FINAL DIMENSIONS }
  FLayout.MeasuredDimensions[TDimension.Width] := BoundAxis(TYogaFlexDirection.Row,
    AAvailableWidth - MarginAxisRow, AParentWidth, AParentWidth);

  FLayout.MeasuredDimensions[TDimension.Height] := BoundAxis(TYogaFlexDirection.Column,
    AAvailableHeight - MarginAxisColumn, AParentHeight, AParentWidth);

  { If the user didn't specify a width or height for the node, set the
    dimensions based on the children. }
  if (MeasureModeMainDim = TYogaMeasureMode.Undefined) or
    ((FStyle.Overflow <> TYogaOverflow.Scroll) and (MeasureModeMainDim = TYogaMeasureMode.AtMost)) then
  begin
    { Clamp the size to the min/max size, if specified, and make sure it
      doesn't go below the padding and border amount. }
    FLayout.MeasuredDimensions[DIM[MainAxis]] := BoundAxis(MainAxis,
      MaxLineMainDim, MainAxisParentSize, AParentWidth);
  end
  else if (MeasureModeMainDim = TYogaMeasureMode.AtMost) and
    (FStyle.Overflow = TYogaOverflow.Scroll) then
  begin
    FLayout.MeasuredDimensions[DIM[MainAxis]] := YogaMax(YogaMin(
      AvailableInnerMainDim + PaddingAxisMain,
      BoundAxisWithinMinAndMax(MainAxis, MaxLineMainDim, MainAxisParentSize).Unwrap),
      PaddingAxisMain);
  end;

  if (MeasureModeCrossDim = TYogaMeasureMode.Undefined) or
    ((FStyle.Overflow <> TYogaOverflow.Scroll) and (MeasureModeCrossDim = TYogaMeasureMode.AtMost)) then
  begin
    { Clamp the size to the min/max size, if specified, and make sure it
      doesn't go below the padding and border amount. }
    FLayout.MeasuredDimensions[DIM[CrossAxis]] := BoundAxis(CrossAxis,
      TotalLineCrossDim + PaddingAxisCross, CrossAxisParentSize, AParentWidth);
  end
  else if (MeasureModeCrossDim = TYogaMeasureMode.AtMost) and
    (FStyle.Overflow = TYogaOverflow.Scroll) then
  begin
    FLayout.MeasuredDimensions[DIM[CrossAxis]] := YogaMax(YogaMin(
      AvailableInnerCrossDim + PaddingAxisCross,
      BoundAxisWithinMinAndMax(CrossAxis, TotalLineCrossDim + PaddingAxisCross, CrossAxisParentSize).Unwrap),
      PaddingAxisCross);
  end;

  { As we only wrapped in normal direction yet, we need to reverse the
    positions on wrap-reverse. }
  if (APerformLayout) and (FStyle.FlexWrap = TYogaWrap.WrapReverse) then
  begin
    for I := 0 to ChildCount - 1 do
    begin
      Child := FChildren[I];
      if (Child.FStyle.PositionType = TYogaPositionType.Relative) then
      begin
        Child.FLayout.Position[POS[CrossAxis]] :=
          FLayout.MeasuredDimensions[DIM[CrossAxis]] -
          Child.FLayout.Position[POS[CrossAxis]] -
          Child.FLayout.MeasuredDimensions[DIM[CrossAxis]];
      end;
    end;
  end;

  if (APerformLayout) then
  begin
    { STEP 10: SIZING AND POSITIONING ABSOLUTE CHILDREN }
    if (IsMainAxisRow) then
      ChildWidthMeasureMode := MeasureModeMainDim
    else
      ChildWidthMeasureMode := MeasureModeCrossDim;
    for I := 0 to ChildCount - 1 do
    begin
      Child := FChildren[I];
      if (Child.FStyle.PositionType = TYogaPositionType.Absolute) then
      begin
        AbsoluteLayoutChild(Child, AvailableInnerWidth, ChildWidthMeasureMode,
          AvailableInnerHeight, Direction);
      end;
    end;

    { STEP 11: SETTING TRAILING POSITIONS FOR CHILDREN }
    NeedsMainTrailingPos := (MainAxis in [TYogaFlexDirection.RowReverse, TYogaFlexDirection.ColumnReverse]);
    NeedsCrossTrailingPos := (CrossAxis in [TYogaFlexDirection.RowReverse, TYogaFlexDirection.ColumnReverse]);

    { Set trailing position if necessary. }
    if (NeedsMainTrailingPos or NeedsCrossTrailingPos) then
    begin
      for I := 0 to ChildCount - 1 do
      begin
        Child := FChildren[I];
        if (Child.FStyle.Display <> TYogaDisplay.None) then
        begin
          if (NeedsMainTrailingPos) then
            SetChildTrailingPosition(Child, MainAxis);

          if (NeedsCrossTrailingPos) then
            SetChildTrailingPosition(Child, CrossAxis);
        end;
      end;
    end;
  end;
end;

function TYogaNode.LayoutInternal(const AAvailableWidth,
  AAvailableHeight: Single; const AParentDirection: TYogaDirection;
  const AWidthMeasureMode, AHeightMeasureMode: TYogaMeasureMode;
  const AParentWidth, AParentHeight: Single; const APerformLayout: Boolean): Boolean;
var
  I: Integer;
  NeedToVisitNode: Boolean;
  CachedResults, NewCacheEntry: PCachedMeasurement;
  MarginAxisRow, MarginAxisColumn: Single;
begin
  Inc(GDepth);
  NeedToVisitNode := (FIsDirty and (FLayout.GenerationCount <> GCurrentGenerationCount))
    or (FLayout.LastParentDirection <> AParentDirection);

  if (NeedToVisitNode) then
  begin
    { Invalidate the cached results }
    FLayout.NextCachedMeasurementsIndex := 0;
    FLayout.CachedLayout.WidthMeasureMode := TYogaMeasureMode(-1);
    FLayout.CachedLayout.HeightMeasureMode := TYogaMeasureMode(-1);
    FLayout.CachedLayout.ComputedWidth := -1;
    FLayout.CachedLayout.ComputedHeight := -1;
  end;

  { Determine whether the results are already cached. We maintain a separate
    cache for layouts and measurements. A layout operation modifies the
    positions and dimensions for nodes in the subtree. The algorithm assumes
    that each node gets layed out a maximum of one time per tree layout, but
    multiple measurements may be required to resolve all of the flex dimensions.
    We handle nodes with measure functions specially here because they are the
    most expensive to measure, so it's worth avoiding redundant measurements if
    at all possible. }
  CachedResults := nil;
  if Assigned(FOnMeasure) then
  begin
    MarginAxisRow := GetMarginForAxis(TYogaFlexDirection.Row, AParentWidth).Unwrap;
    MarginAxisColumn := GetMarginForAxis(TYogaFlexDirection.Column, AParentWidth).Unwrap;

    { First, try to use the layout cache. }
    if (CanUseCachedMeasurement(AWidthMeasureMode, AAvailableWidth,
      AHeightMeasureMode, AAvailableHeight, FLayout.CachedLayout.WidthMeasureMode,
      FLayout.CachedLayout.AvailableWidth, FLayout.CachedLayout.HeightMeasureMode,
      FLayout.CachedLayout.AvailableHeight, FLayout.CachedLayout.ComputedWidth,
      FLayout.CachedLayout.ComputedHeight, MarginAxisRow, MarginAxisColumn)) then
    begin
      CachedResults := @FLayout.CachedLayout;
    end
    else
    begin
      { Try to use the measurement cache. }
      for I := 0 to FLayout.NextCachedMeasurementsIndex - 1 do
      begin
        if (CanUseCachedMeasurement(AWidthMeasureMode, AAvailableWidth,
          AHeightMeasureMode, AAvailableHeight,
          FLayout.CachedMeasurements[I].WidthMeasureMode,
          FLayout.CachedMeasurements[I].AvailableWidth,
          FLayout.CachedMeasurements[I].HeightMeasureMode,
          FLayout.CachedMeasurements[I].AvailableHeight,
          FLayout.CachedMeasurements[I].ComputedWidth,
          FLayout.CachedMeasurements[I].ComputedHeight,
          MarginAxisRow, MarginAxisColumn)) then
        begin
          CachedResults := @FLayout.CachedMeasurements[I];
          Break;
        end;
      end;
    end;
  end
  else if (APerformLayout) then
  begin
    if (FLayout.CachedLayout.WidthMeasureMode = AWidthMeasureMode)
      and (FLayout.CachedLayout.HeightMeasureMode = AHeightMeasureMode)
      and YogaEqual(FLayout.CachedLayout.AvailableWidth, AAvailableWidth)
      and YogaEqual(FLayout.CachedLayout.AvailableHeight, AAvailableHeight)
    then
      CachedResults := @FLayout.CachedLayout;
  end
  else
  begin
    for I := 0 to FLayout.NextCachedMeasurementsIndex - 1 do
    begin
      if (FLayout.CachedMeasurements[I].WidthMeasureMode = AWidthMeasureMode)
        and (FLayout.CachedMeasurements[I].HeightMeasureMode = AHeightMeasureMode)
        and YogaEqual(FLayout.CachedMeasurements[I].AvailableWidth, AAvailableWidth)
        and YogaEqual(FLayout.CachedMeasurements[I].AvailableHeight, AAvailableHeight) then
      begin
        CachedResults := @FLayout.CachedMeasurements[I];
        Break;
      end;
    end;
  end;

  if (not NeedToVisitNode) and (CachedResults <> nil) then
  begin
    FLayout.MeasuredDimensions[TDimension.Width] := CachedResults.ComputedWidth;
    FLayout.MeasuredDimensions[TDimension.Height] := CachedResults.ComputedHeight;
  end
  else
  begin
    LayoutImpl(AAvailableWidth, AAvailableHeight, AParentDirection,
      AWidthMeasureMode, AHeightMeasureMode, AParentWidth, AParentHeight,
      APerformLayout);

    FLayout.LastParentDirection := AParentDirection;
    if (CachedResults = nil) then
    begin
      if (FLayout.NextCachedMeasurementsIndex = MAX_CACHED_RESULT_COUNT) then
        FLayout.NextCachedMeasurementsIndex := 0;

      if (APerformLayout) then
        { Use the single layout cache entry. }
        NewCacheEntry := @FLayout.CachedLayout
      else
      begin
        { Allocate a new measurement cache entry. }
        NewCacheEntry := @FLayout.CachedMeasurements[FLayout.NextCachedMeasurementsIndex];
        Inc(FLayout.NextCachedMeasurementsIndex);
      end;

      NewCacheEntry.AvailableWidth := AAvailableWidth;
      NewCacheEntry.AvailableHeight := AAvailableHeight;
      NewCacheEntry.WidthMeasureMode := AWidthMeasureMode;
      NewCacheEntry.HeightMeasureMode := AHeightMeasureMode;
      NewCacheEntry.ComputedWidth := FLayout.MeasuredDimensions[TDimension.Width];
      NewCacheEntry.ComputedHeight := FLayout.MeasuredDimensions[TDimension.Height];
    end;
  end;

  if (APerformLayout) then
  begin
    FLayout.Dimensions := FLayout.MeasuredDimensions;
    FHasNewLayout := True;
    SetDirty(False);
  end;

  Dec(GDepth);
  FLayout.GenerationCount := GCurrentGenerationCount;
  Result := NeedToVisitNode or (CachedResults = nil);
end;

function TYogaNode.MarginLeadingValue(
  const AAxis: TYogaFlexDirection): TYogaValue;
begin
  if (AAxis.IsRow) and (FStyle.Margin[TYogaEdge.Start].Units <> TYogaUnit.Undefined) then
    Result := FStyle.Margin[TYogaEdge.Start]
  else
    Result := FStyle.Margin[LEADING[AAxis]];
end;

function TYogaNode.MarginTrailingValue(
  const AAxis: TYogaFlexDirection): TYogaValue;
begin
  if (AAxis.IsRow) and (FStyle.Margin[TYogaEdge.Stop].Units <> TYogaUnit.Undefined) then
    Result := FStyle.Margin[TYogaEdge.Stop]
  else
    Result := FStyle.Margin[TRAILING[AAxis]];
end;

procedure TYogaNode.MarkDirty;
begin
  Assert(Assigned(FOnMeasure), 'Only leaf nodes with custom measure functions should manually mark themselves as dirty');
  MarkDirtyAndPropogate;
end;

procedure TYogaNode.MarkDirtyAndPropogate;
begin
  if (not FIsDirty) then
  begin
    SetDirty(True);
    FLayout.ComputedFlexBasis.Init;
    if (FParent <> nil) then
      FParent.MarkDirtyAndPropogate;
  end;
end;

function TYogaNode.PaddingForAxis(const AAxis: TYogaFlexDirection;
  const AWidthSize: Single): Single;
begin
  Result := (GetLeadingPadding(AAxis, AWidthSize) + GetTrailingPadding(AAxis, AWidthSize)).Unwrap;
end;

function TYogaNode.RelativePosition(const AAxis: TYogaFlexDirection;
  const AAxisSize: Single): TFloatOptional;
{ If both left and right are defined, then use left. Otherwise return
  +left or -right depending on which is defined. }
begin
  if (IsLeadingPositionDefined(AAxis)) then
    Exit(GetLeadingPosition(AAxis, AAxisSize));

  Result := GetTrailingPosition(AAxis, AAxisSize);
  if (not Result.IsUndefined) then
    Result.SetValue(-Result.Value);
end;

procedure TYogaNode.Remove(const AChild: TYogaNode);
var
  Index: Integer;
begin
  Index := IndexOf(AChild);
  if (Index >= 0) then
    Delete(Index);
end;

procedure TYogaNode.ResolveDimension;
var
  Dim: TDimension;
begin
  for Dim := Low(TDimension) to High(TDimension) do
  begin
    if (FStyle.MaxDimensions[Dim].Units <> TYogaUnit.Undefined)
      and (FStyle.MaxDimensions[Dim] = FStyle.MinDimensions[Dim])
    then
      FResolvedDimensions[Dim] := FStyle.MaxDimensions[Dim]
    else
      FResolvedDimensions[Dim] := FStyle.Dimensions[Dim]
  end;
end;

function TYogaNode.ResolveDirection(
  const AParentDirection: TYogaDirection): TYogaDirection;
begin
  if (FStyle.Direction = TYogaDirection.Inherit) then
  begin
    if (AParentDirection> TYogaDirection.Inherit) then
      Result := AParentDirection
    else
      Result := TYogaDirection.LTR;
  end
  else
    Result := FStyle.Direction;
end;

function TYogaNode.ResolveFlexBasisPtr: TYogaValue;
begin
  Result := FStyle.FlexBasis;
  if (not (Result.Units in [TYogaUnit.Auto, TYogaUnit.Undefined])) then
    Exit;

  if (not FStyle.Flex.IsUndefined) and (FStyle.Flex.Value > 0.0) then
  begin
    {$IFDEF YOGA_NO_WEB_DEFAULTS}
    Exit(YOGA_VALUE_ZERO);
    {$ELSE}
    Exit(YOGA_VALUE_AUTO);
    {$ENDIF}
  end;

  Result := YOGA_VALUE_AUTO;
end;

function TYogaNode.ResolveFlexGrow: Single;
begin
  { Root nodes FlexGrow should always be 0 }
  if (FParent = nil) then
    Exit(0.0);

  if (not FStyle.FlexGrow.IsUndefined) then
    Exit(FStyle.FlexGrow.Value);

  if (not FStyle.Flex.IsUndefined) and (FStyle.Flex.Value > 0.0) then
    Exit(FStyle.Flex.Value);

  Result := DEFAULT_FLEX_GROW;
end;

procedure TYogaNode.ResolveFlexibleLength(
  var ACollectedFlexItemsValues: TCollectFlexItemsRowValues; const AMainAxis,
  ACrossAxis: TYogaFlexDirection; const AMainAxisParentSize,
  AAvailableInnerMainDim, AAvailableInnerCrossDim, AAvailableInnerWidth,
  AAvailableInnerHeight: Single; const AFlexBasisOverflows: Boolean;
  const AMeasureModeCrossDim: TYogaMeasureMode; const APerformLayout: Boolean);
{ Do two passes over the flex items to figure out how to distribute the
  remaining space.
  The first pass finds the items whose min/max constraints trigger, freezes them
  at those sizes, and excludes those sizes from the remaining space. The second
  pass sets the size of each flexible item. It distributes the remaining space
  amongst the items whose min/max constraints didn't trigger in pass 1. For the
  other items, it sets their sizes by forcing their min/max constraints to
  trigger again.

  This two pass approach for resolving min/max constraints deviates from the
  spec. The spec (https://www.w3.org/TR/YG-flexbox-1/#resolve-flexible-lengths)
  describes a process that needs to be repeated a variable number of times. The
  algorithm implemented here won't handle all cases but it was simpler to
  implement and it mitigates performance concerns because we know exactly how
  many passes it'll do.

  At the end of this function the child nodes would have the proper size
  assigned to them. }
var
  OriginalFreeSpace, DistributedFreeSpace: Single;
begin
  OriginalFreeSpace := ACollectedFlexItemsValues.RemainingFreeSpace;

  { First pass: detect the flex items whose min/max constraints trigger }
  DistributeFreeSpaceFirstPass(ACollectedFlexItemsValues, AMainAxis,
    AMainAxisParentSize, AAvailableInnerMainDim, AAvailableInnerWidth);

  { Second pass: resolve the sizes of the flexible items }
  DistributedFreeSpace := DistributeFreeSpaceSecondPass(ACollectedFlexItemsValues,
    AMainAxis, ACrossAxis, AMainAxisParentSize, AAvailableInnerMainDim,
    AAvailableInnerCrossDim, AAvailableInnerWidth, AAvailableInnerHeight,
    AFlexBasisOverflows, AMeasureModeCrossDim, APerformLayout);

  ACollectedFlexItemsValues.RemainingFreeSpace := OriginalFreeSpace - DistributedFreeSpace;
end;

function TYogaNode.ResolveFlexShrink: Single;
begin
  if (FParent = nil) then
    Exit(0.0);

  if (not FStyle.FlexShrink.IsUndefined) then
    Exit(FStyle.FlexShrink.Value);

  {$IFDEF YOGA_NO_WEB_DEFAULTS}
  if (not FStyle.Flex.IsUndefined) and (FStyle.Flex.Value < 0.0) then
    Exit(-FStyle.Flex.Value);
  {$ENDIF}

  Result := DEFAULT_FLEX_SHRINK;
end;

{$IFNDEF YOGA_NO_PIXEL_ALIGN}
procedure TYogaNode.RoundToPixelGrid(const AAbsoluteLeft, AAbsoluteTop: Single);
var
  NodeLeft, NodeTop, NodeWidth, NodeHeight, F: Single;
  AbsoluteNodeLeft, AbsoluteNodeTop, AbsoluteNodeRight, AbsoluteNodeBottom: Single;
  TextRounding, HasFractionalWidth, HasFractionalHeight: Boolean;
  I: Integer;
begin
  NodeLeft := FLayout.Position[TYogaEdge.Left];
  NodeTop := FLayout.Position[TYogaEdge.Top];

  NodeWidth := FLayout.Dimensions[TDimension.Width];
  NodeHeight := FLayout.Dimensions[TDimension.Height];

  AbsoluteNodeLeft := AAbsoluteLeft + NodeLeft;
  AbsoluteNodeTop := AAbsoluteTop + NodeTop;

  AbsoluteNodeRight := AbsoluteNodeLeft + NodeWidth;
  AbsoluteNodeBottom := AbsoluteNodeTop + NodeHeight;

  { If a node has a custom measure function we never want to round down its
    size as this could lead to unwanted text truncation. }
  TextRounding := (FNodeType = TYogaNodeType.Text);

  FLayout.Position[TYogaEdge.Left] := YogaRoundValueToPixelGrid(NodeLeft, False, TextRounding);
  FLayout.Position[TYogaEdge.Top] := YogaRoundValueToPixelGrid(NodeTop, False, TextRounding);

  { We multiply dimension by scale factor and if the result is close to the
    whole number, we don't have any fraction To verify if the result is close
    to whole number we want to check both floor and ceil numbers }
  F := Frac(NodeWidth);
  HasFractionalWidth := (not YogaEqual(F, 0.0)) and (not YogaEqual(F, 1.0));
  F := Frac(NodeHeight);
  HasFractionalHeight := (not YogaEqual(F, 0.0)) and (not YogaEqual(F, 1.0));

  FLayout.Dimensions[TDimension.Width] := YogaRoundValueToPixelGrid(AbsoluteNodeRight,
    TextRounding and HasFractionalWidth, TextRounding and not HasFractionalWidth) -
    YogaRoundValueToPixelGrid(AbsoluteNodeLeft, False, TextRounding);

  FLayout.Dimensions[TDimension.Height] := YogaRoundValueToPixelGrid(AbsoluteNodeBottom,
    TextRounding and HasFractionalHeight, TextRounding and not HasFractionalHeight) -
    YogaRoundValueToPixelGrid(AbsoluteNodeTop, False, TextRounding);

  for I := 0 to FChildCount - 1 do
    FChildren[I].RoundToPixelGrid(AbsoluteNodeLeft, AbsoluteNodeTop);
end;
{$ENDIF}

procedure TYogaNode.SetAlignContent(const AValue: TYogaAlign);
begin
  if (AValue <> FStyle.AlignContent) then
  begin
    FStyle.AlignContent := AValue;
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetAlignItems(const AValue: TYogaAlign);
begin
  if (AValue <> FStyle.AlignItems) then
  begin
    FStyle.AlignItems := AValue;
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetAlignSelf(const AValue: TYogaAlign);
begin
  if (AValue <> FStyle.AlignSelf) then
  begin
    FStyle.AlignSelf := AValue;
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetAspectRatio(const AValue: Single);
begin
  if (AValue <> FStyle.AspectRatio) then
  begin
    FStyle.AspectRatio.Init(AValue);
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetChildTrailingPosition(const AChild: TYogaNode;
  const AAxis: TYogaFlexDirection);
var
  Size: Single;
begin
  Size := AChild.FLayout.MeasuredDimensions[DIM[AAxis]];
  AChild.FLayout.Position[TRAILING[AAxis]] := FLayout.MeasuredDimensions[DIM[AAxis]]
    - Size - AChild.FLayout.Position[POS[AAxis]];
end;

procedure TYogaNode.SetDirection(const AValue: TYogaDirection);
begin
  if (AValue <> FStyle.Direction) then
  begin
    FStyle.Direction := AValue;
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetDirty(const AIsDirty: Boolean);
begin
  if (FIsDirty = AIsDirty) then
    Exit;

  FIsDirty := AIsDirty;
  { TODO : original has a Dirtied function callback you could assign. }
end;

procedure TYogaNode.SetDisplay(const AValue: TYogaDisplay);
begin
  if (AValue <> FStyle.Display) then
  begin
    FStyle.Display := AValue;
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetFlex(const AValue: Single);
begin
  if (AValue <> FStyle.Flex) then
  begin
    if (YogaIsUndefined(AValue)) then
      FStyle.Flex.Init
    else
      FStyle.Flex.Init(AValue);
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetFlexBasis(const AValue: TYogaValue);
var
  Value: TYogaValue;
begin
  case AValue.Units of
    TYogaUnit.Percent:
      if (FStyle.FlexBasis.Value <> AValue.Value) or (FStyle.FlexBasis.Units <> TYogaUnit.Percent) then
      begin
        FStyle.FlexBasis := AValue;
        MarkDirtyAndPropogate;
      end;

    TYogaUnit.Auto:
      if (FStyle.FlexBasis.Units <> TYogaUnit.Auto) then
      begin
        FStyle.FlexBasis.SetAuto;
        MarkDirtyAndPropogate;
      end;
  else
    Value.FValue := YogaSanitize(AValue.Value);
    if (YogaIsUndefined(Value.FValue)) then
      Value.FUnits := TYogaUnit.Undefined
    else
      Value.FUnits := TYogaUnit.Point;

    if (FStyle.FlexBasis.Units <> Value.Units)
      or ((FStyle.FlexBasis.Value <> Value.Value) and (Value.Units <> TYogaUnit.Undefined)) then
    begin
      FStyle.FlexBasis := Value;
      MarkDirtyAndPropogate;
    end;
  end;
end;

procedure TYogaNode.SetFlexDirection(const AValue: TYogaFlexDirection);
begin
  if (AValue <> FStyle.FlexDirection) then
  begin
    FStyle.FlexDirection := AValue;
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetFlexGrow(const AValue: Single);
begin
  if (AValue <> FStyle.FlexGrow) then
  begin
    if (YogaIsUndefined(AValue)) then
      FStyle.FlexGrow.Init
    else
      FStyle.FlexGrow.Init(AValue);
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetFlexShrink(const AValue: Single);
begin
  if (AValue <> FStyle.FlexShrink) then
  begin
    if (YogaIsUndefined(AValue)) then
      FStyle.FlexShrink.Init
    else
      FStyle.FlexShrink.Init(AValue);
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetFlexWrap(const AValue: TYogaWrap);
begin
  if (AValue <> FStyle.FlexWrap) then
  begin
    FStyle.FlexWrap := AValue;
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetHeight(const AValue: TYogaValue);
begin
  case AValue.Units of
    TYogaUnit.Percent:
      SetStyleValuePercent(FStyle.Dimensions[TDimension.Height], AValue.Value);

    TYogaUnit.Auto:
      SetStyleValueAuto(FStyle.Dimensions[TDimension.Height]);
  else
    SetStyleValue(FStyle.Dimensions[TDimension.Height], AValue.Value);
  end;
end;

procedure TYogaNode.SetJustifyContent(const AValue: TYogaJustify);
begin
  if (AValue <> FStyle.JustifyContent) then
  begin
    FStyle.JustifyContent := AValue;
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetMargin(const AIndex: TYogaEdge; const AValue: TYogaValue);
begin
  case AValue.Units of
    TYogaUnit.Percent:
      SetStyleEdgeValuePercent(FStyle.Margin, AIndex, AValue.Value);

    TYogaUnit.Auto:
      SetStyleEdgeValueAuto(FStyle.Margin, AIndex);
  else
    SetStyleEdgeValue(FStyle.Margin, AIndex, AValue.Value);
  end;
end;

procedure TYogaNode.SetMaxHeight(const AValue: TYogaValue);
begin
  case AValue.Units of
    TYogaUnit.Percent:
      SetStyleValuePercent(FStyle.MaxDimensions[TDimension.Height], AValue.Value);
  else
    SetStyleValue(FStyle.MaxDimensions[TDimension.Height], AValue.Value);
  end;
end;

procedure TYogaNode.SetMaxWidth(const AValue: TYogaValue);
begin
  case AValue.Units of
    TYogaUnit.Percent:
      SetStyleValuePercent(FStyle.MaxDimensions[TDimension.Width], AValue.Value);
  else
    SetStyleValue(FStyle.MaxDimensions[TDimension.Width], AValue.Value);
  end;
end;

procedure TYogaNode.SetMinHeight(const AValue: TYogaValue);
begin
  case AValue.Units of
    TYogaUnit.Percent:
      SetStyleValuePercent(FStyle.MinDimensions[TDimension.Height], AValue.Value);
  else
    SetStyleValue(FStyle.MinDimensions[TDimension.Height], AValue.Value);
  end;
end;

procedure TYogaNode.SetMinWidth(const AValue: TYogaValue);
begin
  case AValue.Units of
    TYogaUnit.Percent:
      SetStyleValuePercent(FStyle.MinDimensions[TDimension.Width], AValue.Value);
  else
    SetStyleValue(FStyle.MinDimensions[TDimension.Width], AValue.Value);
  end;
end;

procedure TYogaNode.SetOnMeasure(const AValue: TYogaMeasureEvent);
begin
  FOnMeasure := AValue;
  if (not Assigned(AValue)) then
    FNodeType := TYogaNodeType.Default
  else
  begin
    Assert(FChildCount = 0, 'Cannot set measure function: Nodes with measure functions cannot have children.');
    FNodeType := TYogaNodeType.Text;
  end;
end;

procedure TYogaNode.SetOverflow(const AValue: TYogaOverflow);
begin
  if (AValue <> FStyle.Overflow) then
  begin
    FStyle.Overflow := AValue;
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetPadding(const AIndex: TYogaEdge; const AValue: TYogaValue);
begin
  if (AValue.Units = TYogaUnit.Percent) then
    SetStyleEdgeValuePercent(FStyle.Padding, AIndex, AValue.Value)
  else
    SetStyleEdgeValue(FStyle.Padding, AIndex, AValue.Value);
end;

procedure TYogaNode.SetPos(const AIndex: TYogaEdge; const AValue: TYogaValue);
begin
  if (AValue.Units = TYogaUnit.Percent) then
    SetStyleEdgeValuePercent(FStyle.Position, AIndex, AValue.Value)
  else
    SetStyleEdgeValue(FStyle.Position, AIndex, AValue.Value);
end;

procedure TYogaNode.SetPosition(const ADirection: TYogaDirection;
  const AMainSize, ACrossSize, AParentWidth: Single);
var
  DirectionRespectingRoot: TYogaDirection;
  MainAxis, CrossAxis: TYogaFlexDirection;
  RelativePositionMain, RelativePositionCross: TFloatOptional;
begin
  { Root nodes should be always layouted as LTR, so we don't return negative
    values. }
  if (FParent <> nil) then
    DirectionRespectingRoot := ADirection
  else
    DirectionRespectingRoot := TYogaDirection.LTR;

  MainAxis := FStyle.FlexDirection.Resolve(DirectionRespectingRoot);
  CrossAxis := MainAxis.Cross(DirectionRespectingRoot);

  RelativePositionMain := RelativePosition(MainAxis, AMainSize);
  RelativePositionCross := RelativePosition(CrossAxis, ACrossSize);

  FLayout.Position[LEADING[MainAxis]] :=
    (GetLeadingMargin(MainAxis, AParentWidth) + RelativePositionMain).Unwrap;

  FLayout.Position[TRAILING[MainAxis]] :=
    (GetTrailingMargin(MainAxis, AParentWidth) + RelativePositionMain).Unwrap;

  FLayout.Position[LEADING[CrossAxis]] :=
    (GetLeadingMargin(CrossAxis, AParentWidth) + RelativePositionCross).Unwrap;

  FLayout.Position[TRAILING[CrossAxis]] :=
    (GetTrailingMargin(CrossAxis, AParentWidth) + RelativePositionCross).Unwrap;
end;

procedure TYogaNode.SetPositionType(const AValue: TYogaPositionType);
begin
  if (AValue <> FStyle.PositionType) then
  begin
    FStyle.PositionType := AValue;
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetStyleEdgeValue(var AValues: TEdgeValues;
  const AEdge: TYogaEdge; const AValue: Single);
var
  Value: TYogaValue;
begin
  Value.FValue := YogaSanitize(AValue);
  if (YogaIsUndefined(AValue)) then
    Value.FUnits := TYogaUnit.Undefined
  else
    Value.FUnits := TYogaUnit.Point;

  if (AValues[AEdge].Units <> Value.Units)
    or ((AValues[AEdge].Value <> Value.Value) and (Value.FUnits <> TYogaUnit.Undefined)) then
  begin
    AValues[AEdge] := Value;
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetStyleEdgeValueAuto(var AValues: TEdgeValues;
  const AEdge: TYogaEdge);
begin
  if (AValues[AEdge].Units <> TYogaUnit.Auto) then
  begin
    AValues[AEdge].SetAuto;
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetStyleEdgeValuePercent(var AValues: TEdgeValues;
  const AEdge: TYogaEdge; const AValue: Single);
var
  Value: TYogaValue;
begin
  Value.FValue := YogaSanitize(AValue);
  if (YogaIsUndefined(AValue)) then
    Value.FUnits := TYogaUnit.Undefined
  else
    Value.FUnits := TYogaUnit.Percent;

  if (AValues[AEdge].Units <> Value.Units)
    or ((AValues[AEdge].Value <> Value.Value) and (Value.FUnits <> TYogaUnit.Undefined)) then
  begin
    AValues[AEdge] := Value;
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetStyleValue(var AValue: TYogaValue;
  const ANewValue: Single);
var
  Value: TYogaValue;
begin
  Value.FValue := YogaSanitize(ANewValue);
  if (YogaIsUndefined(ANewValue)) then
    Value.FUnits := TYogaUnit.Undefined
  else
    Value.FUnits := TYogaUnit.Point;

  if (AValue.Units <> Value.Units)
    or ((AValue.Value <> Value.Value) and (Value.Units <> TYogaUnit.Undefined)) then
  begin
    AValue := Value;
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetStyleValueAuto(var AValue: TYogaValue);
begin
  if (AValue.Units <> TYogaUnit.Auto) then
  begin
    AValue.SetAuto;
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetStyleValuePercent(var AValue: TYogaValue;
  const ANewValue: Single);
begin
  if (AValue.Value <> YogaSanitize(ANewValue)) or (AValue.Units <> TYogaUnit.Percent) then
  begin
    if (YogaIsUndefined(ANewValue)) then
      AValue.SetAuto
    else
    begin
      AValue.FValue := ANewValue;
      AValue.FUnits := TYogaUnit.Percent;
    end;
    MarkDirtyAndPropogate;
  end;
end;

procedure TYogaNode.SetWidth(const AValue: TYogaValue);
begin
  case AValue.Units of
    TYogaUnit.Percent:
      SetStyleValuePercent(FStyle.Dimensions[TDimension.Width], AValue.Value);

    TYogaUnit.Auto:
      SetStyleValueAuto(FStyle.Dimensions[TDimension.Width]);
  else
    SetStyleValue(FStyle.Dimensions[TDimension.Width], AValue.Value);
  end;
end;

procedure TYogaNode.ZeroOutLayoutRecursively;
var
  I: Integer;
begin
  FillChar(FLayout, SizeOf(TLayout), 0);
  FHasNewLayout := True;
  for I := 0 to FChildCount - 1 do
    FChildren[I].ZeroOutLayoutRecursively;
end;

{ TYogaNode.TEnumerator }

class function TYogaNode.TEnumerator.Create(
  const ANode: TYogaNode): TEnumerator;
begin
  Result.FNode := ANode;
  Result.FIndex := -1;
end;

function TYogaNode.TEnumerator.GetCurrent: TYogaNode;
begin
  Result := FNode.FChildren[FIndex];
end;

function TYogaNode.TEnumerator.MoveNext: Boolean;
begin
  Result := (FIndex < (FNode.FChildCount - 1));
  if Result then
    Inc(FIndex);
end;

{ TYogaNode.TFloatOptional }

class operator TYogaNode.TFloatOptional.Add(const ALeft,
  ARight: TFloatOptional): TFloatOptional;
begin
  if (ALeft.FIsUndefined) or (ARight.FIsUndefined) then
    Result.Init
  else
    Result.Init(ALeft.FValue + ARight.FValue);
end;

constructor TYogaNode.TFloatOptional.Create(const AValue: Single);
begin
  FIsUndefined := YogaIsUndefined(AValue);
  if (FIsUndefined) then
    FValue := 0.0
  else
    FValue := AValue;
end;

class operator TYogaNode.TFloatOptional.Equal(const ALeft: TFloatOptional;
  const ARight: Single): Boolean;
begin
  if (ALeft.FIsUndefined = YogaIsUndefined(ARight)) then
    Result := (ALeft.FIsUndefined) or (ALeft.FValue = ARight)
  else
    Result := False;
end;

class operator TYogaNode.TFloatOptional.Equal(const ALeft,
  ARight: TFloatOptional): Boolean;
begin
  if (ALeft.FIsUndefined = ARight.FIsUndefined) then
    Result := (ALeft.FIsUndefined) or (ALeft.FValue = ARight.FValue)
  else
    Result := False;
end;

function TYogaNode.TFloatOptional.GetValue: Single;
begin
  {$IFDEF DEBUG}
  if (FIsUndefined) then
    raise EInvalidOpException.Create('Tried to get value of an undefined TFloatOptional');
  {$ENDIF}
  Result := FValue;
end;

class operator TYogaNode.TFloatOptional.GreaterThan(const ALeft,
  ARight: TFloatOptional): Boolean;
begin
  if (ALeft.FIsUndefined) or (ARight.FIsUndefined) then
    Result := False
  else
    Result := (ALeft.FValue > ARight.FValue);
end;

class operator TYogaNode.TFloatOptional.GreaterThanOrEqual(const ALeft,
  ARight: TFloatOptional): Boolean;
begin
  Result := (ALeft = ARight) or (ALeft > ARight);
end;

class operator TYogaNode.TFloatOptional.Implicit(
  const AValue: Single): TFloatOptional;
begin
  Result.Init(AValue);
end;

procedure TYogaNode.TFloatOptional.Init(const AValue: Single);
begin
  FIsUndefined := YogaIsUndefined(AValue);
  if (FIsUndefined) then
    FValue := 0.0
  else
    FValue := AValue;
end;

procedure TYogaNode.TFloatOptional.Init;
begin
  FValue := 0;
  FIsUndefined := True;
end;

class operator TYogaNode.TFloatOptional.LessThan(const ALeft,
  ARight: TFloatOptional): Boolean;
begin
  if (ALeft.FIsUndefined) or (ARight.FIsUndefined) then
    Result := False
  else
    Result := (ALeft.FValue < ARight.FValue);
end;

class operator TYogaNode.TFloatOptional.LessThanOrEqual(const ALeft,
  ARight: TFloatOptional): Boolean;
begin
  Result := (ALeft = ARight) or (ALeft < ARight);
end;

class function TYogaNode.TFloatOptional.Max(const AA,
  AB: TFloatOptional): TFloatOptional;
begin
  if (not AA.IsUndefined) and (not AB.IsUndefined) then
  begin
    if (AA.FValue > AB.FValue) then
      Exit(AA)
    else
      Exit(AB);
  end;

  if (AA.IsUndefined) then
    Result := AB
  else
    Result := AA;
end;

class operator TYogaNode.TFloatOptional.NotEqual(const ALeft,
  ARight: TFloatOptional): Boolean;
begin
  Result := not (ALeft = ARight);
end;

class operator TYogaNode.TFloatOptional.NotEqual(const ALeft: TFloatOptional;
  const ARight: Single): Boolean;
begin
  Result := not (ALeft = ARight);
end;

procedure TYogaNode.TFloatOptional.SetValue(const AValue: Single);
begin
  FValue := AValue;
  FIsUndefined := False;
end;

function TYogaNode.TFloatOptional.Unwrap: Single;
begin
  if (FIsUndefined) then
    Result := YOGA_UNDEFINED
  else
    Result := FValue;
end;

{ TYogaNode.TStyle }

class operator TYogaNode.TStyle.Equal(const ALeft, ARight: TStyle): Boolean;
begin
  Result :=
    (ALeft.Direction = ARight.Direction) and
    (ALeft.FlexDirection = ARight.FlexDirection) and
    (ALeft.JustifyContent = ARight.JustifyContent) and
    (ALeft.AlignContent = ARight.AlignContent) and
    (ALeft.AlignItems = ARight.AlignItems) and
    (ALeft.AlignSelf = ARight.AlignSelf) and
    (ALeft.PositionType = ARight.PositionType) and
    (ALeft.FlexWrap = ARight.FlexWrap) and
    (ALeft.Overflow = ARight.Overflow) and
    (ALeft.Display = ARight.Display) and
    (ALeft.FlexBasis = ARight.FlexBasis) and
    EdgeValuesEqual(ALeft.Margin, ARight.Margin) and
    EdgeValuesEqual(ALeft.Position, ARight.Position) and
    EdgeValuesEqual(ALeft.Padding, ARight.Padding) and
    DimensionValuesEqual(ALeft.Dimensions, ARight.Dimensions) and
    DimensionValuesEqual(ALeft.MinDimensions, ARight.MinDimensions) and
    DimensionValuesEqual(ALeft.MaxDimensions, ARight.MaxDimensions);

  Result := Result and (ALeft.Flex.IsUndefined = ARight.Flex.IsUndefined);
  if (Result) and (not ALeft.Flex.IsUndefined) then
    Result := (ALeft.Flex.Value = ARight.Flex.Value);

  Result := Result and (ALeft.FlexGrow.IsUndefined = ARight.FlexGrow.IsUndefined);
  if (Result) and (not ALeft.FlexGrow.IsUndefined) then
    Result := (ALeft.FlexGrow.Value = ARight.FlexGrow.Value);

  Result := Result and (ALeft.FlexShrink.IsUndefined = ARight.FlexShrink.IsUndefined);
  if (Result) and (not ALeft.FlexShrink.IsUndefined) then
    Result := (ALeft.FlexShrink.Value = ARight.FlexShrink.Value);

  if (not (ALeft.AspectRatio.IsUndefined and ARight.AspectRatio.IsUndefined)) then
    Result := Result and (ALeft.AspectRatio.Value = ARight.AspectRatio.Value);
end;

procedure TYogaNode.TStyle.Init;
begin
  {$IFDEF YOGA_NO_WEB_DEFAULTS}
  FlexDirection := TYogaFlexDirection.Column;
  AlignContent := TYogaAlign.FlexStart;
  {$ELSE}
  FlexDirection := TYogaFlexDirection.Row;
  AlignContent := TYogaAlign.Stretch;
  {$ENDIF}
  AlignItems := TYogaAlign.Stretch;
  Flex.Init;
  FlexGrow.Init;
  FlexShrink.Init;
  FlexBasis.SetAuto;
  Margin := DEFAULT_EDGE_VALUES;
  Position := DEFAULT_EDGE_VALUES;
  Padding := DEFAULT_EDGE_VALUES;
  Dimensions := DEFAULT_DIMENSIONS_AUTO;
  MinDimensions := DEFAULT_DIMENSIONS_UNDEFINED;
  MaxDimensions := DEFAULT_DIMENSIONS_UNDEFINED;
  AspectRatio.Init;
end;

class operator TYogaNode.TStyle.NotEqual(const ALeft, ARight: TStyle): Boolean;
begin
  Result := not (ALeft = ARight);
end;

{ TYogaNode.TCachedMeasurement }

procedure TYogaNode.TCachedMeasurement.Init;
begin
  WidthMeasureMode := TYogaMeasureMode(-1);
  HeightMeasureMode := TYogaMeasureMode(-1);
  ComputedWidth := -1;
  ComputedHeight := -1;
end;

{ TYogaNode.TLayout }

procedure TYogaNode.TLayout.Init;
var
  I: Integer;
begin
  Dimensions[TDimension.Width] := YOGA_UNDEFINED;
  Dimensions[TDimension.Height] := YOGA_UNDEFINED;
  ComputedFlexBasis.Init;
  LastParentDirection := TYogaDirection(-1);
  MeasuredDimensions[TDimension.Width] := YOGA_UNDEFINED;
  MeasuredDimensions[TDimension.Height] := YOGA_UNDEFINED;
  CachedLayout.Init;
  for I := 0 to MAX_CACHED_RESULT_COUNT - 1 do
    CachedMeasurements[I].Init;
end;

{ TYogaNode.TCollectFlexItemsRowValues }

procedure TYogaNode.TCollectFlexItemsRowValues.AddRelativeChild(
  const AChild: TYogaNode);
begin
  if (RelativeChildCount >= Length(RelativeChildren)) then
    SetLength(RelativeChildren, Length(RelativeChildren) * 2);
  RelativeChildren[RelativeChildCount] := AChild;
  Inc(RelativeChildCount);
end;

end.
