unit FMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Rtti,
  System.Generics.Collections,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Layouts,
  FMX.TabControl,
  FMX.Edit,
  FMX.ListBox,
  Neslib.Yoga,
  UPropInfo,
  UTile;

type
  TFormMain = class(TForm)
    TabControl: TTabControl;
    TabItemFlex: TTabItem;
    GridPanelLayoutFlex: TGridPanelLayout;
    LabelDirection: TLabel;
    SpeedButtonInherit: TSpeedButton;
    SpeedButtonLtr: TSpeedButton;
    SpeedButtonRtl: TSpeedButton;
    LabelFlexDirection: TLabel;
    ComboBoxFlexDirection: TComboBox;
    LabelBasis: TLabel;
    LabelGrow: TLabel;
    LabelShrink: TLabel;
    EditBasis: TEdit;
    EditGrow: TEdit;
    EditShrink: TEdit;
    LabelFlexWrap: TLabel;
    SpeedButtonNoWrap: TSpeedButton;
    SpeedButtonWrap: TSpeedButton;
    SpeedButtonWrapReverse: TSpeedButton;
    TabItemAlignment: TTabItem;
    GridPanelLayoutAlignment: TGridPanelLayout;
    LabelJustifyContent: TLabel;
    LabelAlignItems: TLabel;
    ComboBoxAlignItems: TComboBox;
    LabelAlignSelf: TLabel;
    LabelAlignContent: TLabel;
    VertScrollBoxFlex: TVertScrollBox;
    VertScrollBoxAlignment: TVertScrollBox;
    ComboBoxJustifyContent: TComboBox;
    ComboBoxAlignSelf: TComboBox;
    ComboBoxAlignContent: TComboBox;
    TabItemLayout: TTabItem;
    VertScrollBoxLayout: TVertScrollBox;
    GridPanelLayoutLayout: TGridPanelLayout;
    LabelWidthHeight: TLabel;
    LabelMaxWidthHeight: TLabel;
    LabelMinWidthHeight: TLabel;
    LabelAspectRatio: TLabel;
    EditWidth: TEdit;
    EditHeight: TEdit;
    EditMaxWidth: TEdit;
    EditMaxHeight: TEdit;
    EditMinWidth: TEdit;
    EditMinHeight: TEdit;
    EditAspectRatio: TEdit;
    GridPanelLayoutPadding: TGridPanelLayout;
    EditPaddingTop: TEdit;
    LabelPadding: TLabel;
    EditPaddingRight: TEdit;
    EditPaddingBottom: TEdit;
    EditPaddingLeft: TEdit;
    GridPanelLayoutMargin: TGridPanelLayout;
    EditMarginTop: TEdit;
    LabelMargin: TLabel;
    EditMarginRight: TEdit;
    EditMarginBottom: TEdit;
    EditMarginLeft: TEdit;
    GridPanelLayoutPositionType: TGridPanelLayout;
    LabelPositionType: TLabel;
    SpeedButtonRelative: TSpeedButton;
    SpeedButtonAbsoute: TSpeedButton;
    GridPanelLayoutPosition: TGridPanelLayout;
    EditPositionTop: TEdit;
    LabelPosition: TLabel;
    EditPositionRight: TEdit;
    EditPositionBottom: TEdit;
    EditPositionLeft: TEdit;
    LayoutProperties: TLayout;
    GridPanelLayoutCommands: TGridPanelLayout;
    ButtonAddChildNode: TButton;
    ButtonRemoveNode: TButton;
    LayoutContainer: TLayout;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ControlChange(Sender: TObject);
    procedure ButtonAddChildNodeClick(Sender: TObject);
    procedure ButtonRemoveNodeClick(Sender: TObject);
  private
    { Private declarations }
    FPropsByName: TObjectDictionary<String, TPropertyInfo>;
    FPropsByControl: TDictionary<TControl, TPropertyInfo>;
    FTiles: TList<TTile>;
    FRoot: TTile;
    FSelected: TTile;
    FShowingProperties: Boolean;
  private
    function AddTile(const AParent: TTile; const AWidth, AHeight: Single): TTile;
    procedure SelectTile(const ATile: TTile);
    procedure ShowProperties(const ATile: TTile);
    procedure TileClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

function TFormMain.AddTile(const AParent: TTile; const AWidth,
  AHeight: Single): TTile;
begin
  Result := TTile.Create(Self, AParent, AWidth, AHeight);
  Result.OnClick := TileClick;
  FTiles.Add(Result);
  if (AParent = nil) then
    LayoutContainer.AddObject(Result);
end;

procedure TFormMain.ButtonAddChildNodeClick(Sender: TObject);
begin
  if (FSelected <> nil) then
  begin
    AddTile(FSelected, 100, 100);
    FRoot.CalculateLayout;
  end;
end;

procedure TFormMain.ButtonRemoveNodeClick(Sender: TObject);
begin
  if (FSelected <> nil) then
  begin
    FTiles.Remove(FSelected);
    FSelected.Remove;
    FRoot.UpdateText;
    FRoot.CalculateLayout;
    SelectTile(FRoot);
  end;
end;

procedure TFormMain.ControlChange(Sender: TObject);
var
  Info: TPropertyInfo;
  Value: TValue;
  YogaValue: TYogaValue;
  FloatValue: Single;
  OrdValue: Cardinal;
  Text: String;
begin
  if (FShowingProperties) or (FSelected = nil) then
    Exit;

  if (not FPropsByControl.TryGetValue(TControl(Sender), Info)) then
    raise Exception.CreateFmt('Cannot find TYogaNode property for control %s', [TControl(Sender).Name]);

  if (Sender is TEdit) then
  begin
    Text := TEdit(Sender).Text.Trim;
    if (Info.Prop.PropertyType.TypeKind = tkRecord) then
    begin
      Assert(Info.Prop.PropertyType.Handle = TypeInfo(TYogaValue));
      if (Text = '') then
        YogaValue.SetUndefined
      else if (Text.EndsWith('%')) then
      begin
        SetLength(Text, Text.Length - 1);
        if (not TryStrToFloat(Text, FloatValue)) then
          Exit;
        YogaValue.SetPercent(FloatValue);
      end
      else
      begin
        if (not TryStrToFloat(Text, FloatValue)) then
          Exit;
        YogaValue.SetPoint(FloatValue);
      end;
      Value := TValue.From(YogaValue);
    end
    else
    begin
      Assert(Info.Prop.PropertyType.TypeKind = tkFloat);
      if (Text = '') then
        Value := YOGA_UNDEFINED
      else
      begin
        if (not TryStrToFloat(Text, FloatValue)) then
          Exit;
        Value := FloatValue;
      end;
    end;
  end
  else
  begin
    OrdValue := 0;
    if (Sender is TSpeedButton) then
      OrdValue := TSpeedButton(Sender).Tag
    else if (Sender is TComboBox) then
      OrdValue := TComboBox(Sender).ItemIndex
    else
      Assert(False);

    Value := TValue.FromOrdinal(Info.Prop.PropertyType.Handle, OrdValue);
  end;

  Info.Prop.SetValue(FSelected.Node, Value);
  FRoot.CalculateLayout;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  I: Integer;
  Component: TComponent;
  Control: TControl absolute Component;
  Context: TRttiContext;
  NodeType: TRttiType;
  Prop: TRttiProperty;
  Info: TPropertyInfo;
begin
  TabControl.TabIndex := 0;
  ReportMemoryLeaksOnShutdown := True;

  FPropsByName := TObjectDictionary<String, TPropertyInfo>.Create([doOwnsValues]);
  FPropsByControl := TDictionary<TControl, TPropertyInfo>.Create;
  FTiles := TList<TTile>.Create;

  { Set up some poor man's data binding between controls on the form and
    properties of TYogaNode. We use the StyleName property of controls to
    bind to the corresponding property of TYogaNode.
    (I tried to use the HelpKeyword property instead, but the IDE will delete
    this property when saving). }
  Context := TRttiContext.Create;
  NodeType := Context.GetType(TYogaNode);
  if (NodeType = nil) then
    raise Exception.Create('No type information for TYogaNode');

  for I := 0 to ComponentCount - 1 do
  begin
    Component := Components[I];
    if (Component is TControl) and (Control.StyleName <> '') then
    begin
      Prop := NodeType.GetProperty(Control.StyleName);
      if (Prop = nil) then
        raise Exception.CreateFmt('Property TYogaNode.%s does not exist', [Control.StyleName]);

      if (FPropsByName.TryGetValue(Prop.Name, Info)) then
      begin
        { Only a group of speed buttons can have the same property name }
        if (not (Control is TSpeedButton)) then
          raise Exception.CreateFmt('Multiple controls map to the same property TYogaNode.%s', [Prop.Name]);
      end
      else
      begin
        Info := TPropertyInfo.Create(Prop);
        FPropsByName.Add(Prop.Name, Info);
      end;

      { The Tag property is used to determine whether to set Info.Control,
        Button1 or Button2. Only speed buttons have a tag of 1 or 2. }
      if (Control.Tag = 0) then
        Info.Control := Control
      else
      begin
        if (Control.Tag > 2) then
          raise Exception.Create('Invalid control tag');
        if (not (Control is TSpeedButton)) then
          raise Exception.Create('Only speed buttons can have a non-zero control tag');
        if (Control.Tag = 1) then
          Info.Button1 := TSpeedButton(Control)
        else
          Info.Button2 := TSpeedButton(Control);
      end;

      FPropsByControl.Add(Control, Info);
    end;
  end;

  FRoot := AddTile(nil, 500, 500);
  AddTile(FRoot, 100, 100);
  AddTile(FRoot, 100, 100);
  AddTile(FRoot, 100, 100);
  FRoot.CalculateLayout;
  SelectTile(FRoot);
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  if (FRoot <> nil) then
    { This frees all nodes }
    FRoot.Node.Free;

  FPropsByName.Free;
  FPropsByControl.Free;
  FTiles.Free;
end;

procedure TFormMain.SelectTile(const ATile: TTile);
var
  Tile: TTile;
begin
  FSelected := ATile;
  for Tile in FTiles do
    Tile.Selected := (Tile = ATile);
  ButtonRemoveNode.Enabled := (ATile <> FRoot);
  ShowProperties(ATile);
end;

procedure TFormMain.ShowProperties(const ATile: TTile);
var
  Info: TPropertyInfo;
  Value: TValue;
  FloatValue: Single;
  YogaValue: TYogaValue;
  Edit: TEdit;
  B: Boolean;
begin
  FShowingProperties := True;
  try
    for Info in FPropsByName.Values do
    begin
      Value := Info.Prop.GetValue(ATile.Node);
      Assert(not Value.IsEmpty);

      if (Info.Button1 <> nil) then
      begin
        { This is an enum property presented as a speed button group. }
        case Value.AsOrdinal of
          0: (Info.Control as TSpeedButton).IsPressed := True;
          1: Info.Button1.IsPressed := True;
          2: Info.Button2.IsPressed := True;
        else
          Assert(False);
        end;
      end
      else if (Info.Control is TComboBox) then
        TComboBox(Info.Control).ItemIndex := Value.AsOrdinal
      else
      begin
        Assert(Info.Control is TEdit);
        Edit := TEdit(Info.Control);
        if (Value.Kind = tkRecord) then
        begin
          Assert(Value.TypeInfo = TypeInfo(TYogaValue));
          YogaValue := Value.AsType<TYogaValue>;
          case YogaValue.Units of
            TYogaUnit.Undefined,
            TYogaUnit.Auto:
              Edit.Text := '';
            TYogaUnit.Point:
              Edit.Text := FloatToStr(YogaValue.Value);
            TYogaUnit.Percent:
              Edit.Text := FloatToStr(YogaValue.Value) + '%';
          else
            Assert(False);
          end;
        end
        else
        begin
          Assert(Value.Kind = tkFloat);
          FloatValue := Value.AsExtended;
          if (YogaIsUndefined(FloatValue)) then
            Edit.Text := ''
          else
            Edit.Text := FloatToStr(FloatValue);
        end;
      end;
    end;

    { These properties only apply to non-root items }
    B := (ATile.Node.Parent <> nil);
    EditBasis.Enabled := B;
    EditGrow.Enabled := B;
    EditShrink.Enabled := B;
    ComboBoxAlignSelf.Enabled := B;
    EditMarginLeft.Enabled := B;
    EditMarginTop.Enabled := B;
    EditMarginRight.Enabled := B;
    EditMarginBottom.Enabled := B;
    SpeedButtonRelative.Enabled := B;
    SpeedButtonAbsoute.Enabled := B;
    EditPositionLeft.Enabled := B;
    EditPositionTop.Enabled := B;
    EditPositionRight.Enabled := B;
    EditPositionBottom.Enabled := B;
  finally
    FShowingProperties := False;
  end;
end;

procedure TFormMain.TileClick(Sender: TObject);
begin
  SelectTile(Sender as TTile);
end;

end.
