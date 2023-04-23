pageextension 80009 "LJA Customer Ledger Entries" extends "Customer Ledger Entries"
{
    layout
    {
        addafter(Description)
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
