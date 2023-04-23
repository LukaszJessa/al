pageextension 80007 "LJA Sales Invoice" extends "Sales Invoice"
{
    layout
    {
        addafter("Your Reference")
        {
            field("LJA Custom Reference"; Rec."Custom Reference")
            {
                ApplicationArea = Basic, Suite;
                Importance = Promoted;
                ToolTip = 'Field specifies Custom Reference';
            }
        }
    }
}
