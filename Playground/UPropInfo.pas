unit UPropInfo;

interface

uses
  System.Rtti,
  FMX.Controls,
  FMX.StdCtrls;

type
  TPropertyInfo = class
  {$REGION 'Internal Declarations'}
  private
    FProp: TRttiProperty;
    FControl: TControl;
    FButton1: TSpeedButton;
    FButton2: TSpeedButton;
  {$ENDREGION 'Internal Declarations'}
  public
    constructor Create(const AProp: TRttiProperty);

    property Prop: TRttiProperty read FProp;
    property Control: TControl read FControl write FControl;
    property Button1: TSpeedButton read FButton1 write FButton1;
    property Button2: TSpeedButton read FButton2 write FButton2;
  end;

implementation

{ TPropertyInfo }

constructor TPropertyInfo.Create(const AProp: TRttiProperty);
begin
  inherited Create;
  FProp := AProp;
end;

end.
