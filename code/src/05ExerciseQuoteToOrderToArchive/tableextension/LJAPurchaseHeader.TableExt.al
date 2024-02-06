tableextension 80006 "LJA Purchase Header" extends "Purchase Header"
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
