pageextension 80015 "LJA Purchase Quote Archive" extends "Purchase Quote Archive"
{
    layout
    {
        addlast(General)
        {
            field("LJA Additional Information"; Rec."LJA Additional Information")
            {
                ToolTip = 'Specifies the value of the Additional Information field.';
            }
        }
    }
}
