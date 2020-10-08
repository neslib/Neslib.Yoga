unit UTile;

interface

uses
  System.Classes,
  System.SysUtils,
  System.UITypes,
  FMX.Types,
  FMX.Graphics,
  FMX.Objects,
  FMX.Controls,
  Neslib.Yoga;

type
  TTile = class(TRectangle)
  {$REGION 'Internal Declarations'}
  private
    FNode: TYogaNode;
    FText: TText;
    FPaddingRect: TRectangle;
    FSelected: Boolean;
    procedure ApplyLayout;
    procedure SetSelected(const Value: Boolean);
  {$ENDREGION 'Internal Declarations'}
  public
    constructor Create(const AOwner: TComponent; const AParent: TTile;
      const AWidth, AHeight: Single); reintroduce;
    destructor Destroy; override;

    procedure UpdateText;
    procedure CalculateLayout;
    procedure Remove;

    property Node: TYogaNode read FNode;
    property Selected: Boolean read FSelected write SetSelected;
  end;

implementation

{ TTile }

procedure TTile.ApplyLayout;
var
  I: Integer;
  C: TControl;
  L, T, R, B: Single;
begin
  SetBounds(FNode.LayoutLeft, FNode.LayoutTop, FNode.LayoutWidth, FNode.LayoutHeight);

  L := FNode.LayoutPaddingLeft;
  T := FNode.LayoutPaddingTop;
  R := FNode.LayoutPaddingRight;
  B := FNode.LayoutPaddingBottom;
  if (L = 0) and (T = 0) and (R = 0) and (B = 0) then
    FPaddingRect.Visible := False
  else
  begin
    FPaddingRect.SetBounds(L, T, Width - L - R, Height - T - B);
    FPaddingRect.Visible := True;
  end;

  for I := 0 to Controls.Count - 1 do
  begin
    C := Controls[I];
    if (C is TTile) then
      TTile(C).ApplyLayout;
  end;
end;

procedure TTile.CalculateLayout;
begin
  FNode.CalculateLayout;
  ApplyLayout;
end;

constructor TTile.Create(const AOwner: TComponent; const AParent: TTile;
  const AWidth, AHeight: Single);
begin
  inherited Create(AOwner);
  Stroke.Color := $FFD6D7DA;
  if (AParent = nil) then
    Fill.Color := $FFFFFFFF
  else
    Fill.Color := $080000FF;
  Width := AWidth;
  Height := AHeight;
  HitTest := True;
  Cursor := crHandPoint;

  FText := TText.Create(AOwner);
  FText.Align := TAlignLayout.Client;
  FText.VertTextAlign := TTextAlign.Center;
  FText.HorzTextAlign := TTextAlign.Center;
  FText.Color := $FF303845;
  FText.Font.Size := 18;
  FText.HitTest := False;
  AddObject(FText);

  FPaddingRect := TRectangle.Create(AOwner);
  FPaddingRect.Fill.Kind := TBrushKind.None;
  FPaddingRect.Stroke.Color := $FF8080FF;
  FPaddingRect.HitTest := False;
  FPaddingRect.Visible := False;
  AddObject(FPaddingRect);

  FNode := TYogaNode.Create;
  FNode.Width := AWidth;
  FNode.Height := AWidth;
  FNode.Direction := TYogaDirection.LTR;

  if (AParent <> nil) then
  begin
    AParent.AddObject(Self);
    AParent.FNode.Add(FNode);
  end;

  UpdateText;
end;

destructor TTile.Destroy;
begin
  inherited;
end;

procedure TTile.Remove;
begin
  { Fix for issue #1 }
  if (FNode.Parent <> nil) then
    FNode.Parent.Remove(FNode);

  if (Parent <> nil) then
    Parent.RemoveObject(Self);
  Free;
end;

procedure TTile.SetSelected(const Value: Boolean);
begin
  if (Value <> FSelected) then
  begin
    FSelected := Value;
    if (Value) then
    begin
      Stroke.Thickness := 2;
      Stroke.Color := $FF68CFBB;
    end
    else
    begin
      Stroke.Thickness := 1;
      Stroke.Color := $FFD6D7DA;
    end;
  end;
end;

procedure TTile.UpdateText;
var
  I: Integer;
  C: TControl;
begin
  if (FNode.Parent = nil) then
    FText.Text := 'root'
  else
    FText.Text := (FNode.Parent.IndexOf(FNode) + 1).ToString;

  for I := 0 to Controls.Count - 1 do
  begin
    C := Controls[I];
    if (C is TTile) then
      TTile(C).UpdateText;
  end;
end;

end.
