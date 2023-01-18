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
                field("Ship-from Name"; Rec."Ship-from Name")
                {
                    ToolTip = 'Specifies the value of the Ship-from Name field.';
                }
                field("Ship-from Name 2"; Rec."Ship-from Name 2")
                {
                    ToolTip = 'Specifies the value of the Ship-from Name 2 field.';
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
