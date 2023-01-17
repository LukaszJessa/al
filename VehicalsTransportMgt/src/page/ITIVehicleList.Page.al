page 50005 "ITI Vehicle List"
{
    ApplicationArea = All;
    Caption = 'Vehicles';
    CardPageID = "ITI Vehicle Card";
    Editable = false;
    PageType = List;
    SourceTable = "ITI Vehicle";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Make Code"; Rec."Make Code")
                {
                    ToolTip = 'Specifies the value of the Search Description field.';
                }
                field("Model Code"; Rec."Model Code")
                {
                    ToolTip = 'Specifies the value of the Search Description field.';
                }
                field(VIN; Rec.VIN)
                {
                    ToolTip = 'Specifies the value of the VIN field.';
                }
                field("Vehicle Status"; Rec."Vehicle Status")
                {
                    ToolTip = 'Specifies the value of the Vehicle Status field.';
                }
            }
        }
    }
}
