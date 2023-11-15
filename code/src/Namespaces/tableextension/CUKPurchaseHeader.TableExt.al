/// <summary>
/// TableExtension CUK Sales Header (ID 80091) extends Record Sales Header.
/// </summary>
tableextension 80091 "CUK Purchase Header" extends "Purchase Header"
{
    fields
    {
        field(80000; "CUK Extra Counter"; Integer)
        {
            Caption = 'Extra Counter';
            DataClassification = CustomerContent;
        }
    }
}
