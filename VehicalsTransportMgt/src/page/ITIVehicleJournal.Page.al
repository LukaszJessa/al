page 50006 "ITI Vehicle Journal"
{
    ApplicationArea = All;
    AutoSplitKey = true;
    Caption = 'Vehicle Journals';
    DelayedInsert = true;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = "ITI Vehicle Journal Line";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Vehicle Activity Type"; Rec."Vehicle Activity Type")
                {
                    ToolTip = 'Specifies the value of the Vehicle Event Type field.';
                }
                field("Activity Date"; Rec."Activity Date")
                {
                    ToolTip = 'Specifies the value of the Event DateTime field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
            }
        }
    }
}
