tableextension 80003 "LJA Cust. Ledger Entry" extends "Cust. Ledger Entry"
{
    fields
    {
        field(80000; "LJA Custom Reference"; Text[80])
        {
            Caption = 'Custom Reference';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
