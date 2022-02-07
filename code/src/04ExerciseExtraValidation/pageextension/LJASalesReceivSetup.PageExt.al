pageextension 80005 "LJA Sales & Receiv. Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast(General)
        {
            group(LJA)
            {
                Caption = 'LJA';

                field("LJA S. Per. Man. on SO Release"; Rec."LJA S. Per. Man. on SO Release")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether sales person is mandatory on Sales Order release.';
                }

                field("LJA R. Del. Date Man. on SO R."; Rec."LJA R. Del. Date Man. on SO R.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether requested delivery date is mandatory on Sales Order release.';
                }
            }
        }
    }
}
