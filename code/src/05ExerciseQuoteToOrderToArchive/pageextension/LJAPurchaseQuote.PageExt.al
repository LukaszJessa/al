pageextension 80013 "LJA Purchase Quote" extends "Purchase Quote"
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
