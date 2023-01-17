page 50003 "ITI Vehicle Card"
{
    ApplicationArea = All;
    Caption = 'ITI Vehicle Card';
    PageType = Card;
    SourceTable = "ITI Vehicle";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field("Vehicle Status"; Rec."Vehicle Status")
                {
                    ToolTip = 'Specifies the value of the Vehicle Status field.';
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
            }
        }

        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }
}
