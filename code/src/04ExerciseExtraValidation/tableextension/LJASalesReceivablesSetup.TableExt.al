tableextension 80000 "LJA Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(80000; "LJA S. Per. Man. on SO Release"; Boolean)
        {
            Caption = 'Sales Person Mandatory on SO Release';
            DataClassification = ToBeClassified;
        }
        field(80001; "LJA R. Del. Date Man. on SO R."; Boolean)
        {
            Caption = 'Requested Delivery Date Mandatory on SO Release';
            DataClassification = ToBeClassified;
        }
    }
}
