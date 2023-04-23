tableextension 80001 "LJA Sales Invoice" extends "Sales Header"
{
    fields
    {
        field(80000; "Custom Reference"; Text[80])
        {
            Caption = 'Custom Reference';
            DataClassification = ToBeClassified;
        }
    }
}
