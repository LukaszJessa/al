pageextension 80008 "LJA Posted Sales Invoice" extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Your Reference")
        {
            field("LJA Custom Reference"; Rec."LJA Custom Reference")
            {
                ApplicationArea = Basic, Suite;
                Importance = Promoted;
                ToolTip = 'Field specifies Custom Reference';
            }
        }
    }
}
