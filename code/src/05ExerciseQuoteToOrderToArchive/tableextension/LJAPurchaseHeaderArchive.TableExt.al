tableextension 80007 "LJA Purchase Header Archive" extends "Purchase Header Archive"
{
    fields
    {
        field(80000; "LJA Additional Information"; Text[100])
        {
            Caption = 'Additional Information';
            DataClassification = CustomerContent;
        }
    }
}
