page 50007 "ITI Transport Order"
{
    ApplicationArea = All;
    Caption = 'Transport Order';
    PageType = Document;
    SourceTable = "ITI Transport Order Header";

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
                field("Car Transporter No."; Rec."Car Transporter No.")
                {
                    ToolTip = 'Specifies the value of the Car Transporter No. field.';
                }
                field("Driver No."; Rec."Driver No.")
                {
                    ToolTip = 'Specifies the value of the Driver No. field.';
                }
                field("Origin POI Code"; Rec."Origin POI Code")
                {
                    ToolTip = 'Specifies the value of the Origin POI Code field.';
                }
                field("Requested Starting Date"; Rec."Requested Starting Date")
                {
                    ToolTip = 'Specifies the value of the Requested Starting Date field.';
                }
                field("Planned Starting Date"; Rec."Planned Starting Date")
                {
                    ToolTip = 'Specifies the value of the Planned Starting Date field.';
                }
                field("Requested Due Date"; Rec."Requested Due Date")
                {
                    ToolTip = 'Specifies the value of the Requested Due Date field.';
                }
                field("Planned Due Date"; Rec."Planned Due Date")
                {
                    ToolTip = 'Specifies the value of the Requested Due Date field.';
                }
            }

            part("ITI Transport Order Subform"; "ITI Transport Order Subform")
            {
                Caption = 'Lines';
                ApplicationArea = Basic, Suite;
                SubPageLink = "Document No." = FIELD("No.");
                UpdatePropagation = Both;
            }
        }
    }
}
