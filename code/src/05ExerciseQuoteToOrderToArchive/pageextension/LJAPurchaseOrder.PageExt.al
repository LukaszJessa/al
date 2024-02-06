pageextension 80014 "LJA Purchase Order" extends "Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field("LJA Additional Information"; Rec."LJA Additional Information")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Additional Information field.';
            }
        }
    }
}
