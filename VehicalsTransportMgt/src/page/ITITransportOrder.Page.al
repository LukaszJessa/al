page 50007 "ITI Transport Order"
{
    ApplicationArea = All;
    Caption = 'ITI Transport Order';
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
                field("Origin POI Name"; Rec."Origin POI Name")
                {
                    ToolTip = 'Specifies the value of the POI Name field.';
                }
                field("Origin POI Name 2"; Rec."Origin POI Name 2")
                {
                    ToolTip = 'Specifies the value of the POI Name 2 field.';
                }
            }

            part("ITI Transport Order Subform"; "ITI Transport Order Subform")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Document No." = FIELD("No.");
                UpdatePropagation = Both;
            }
        }
    }
}
