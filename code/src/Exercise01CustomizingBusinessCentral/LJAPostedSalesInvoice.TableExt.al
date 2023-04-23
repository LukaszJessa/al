tableextension 80002 "LJA Posted Sales Invoice" extends "Sales Invoice Header"
{
    fields
    {
        field(80000; "Custom Reference"; Text[80])
        {
            Caption = 'Custom Reference';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
