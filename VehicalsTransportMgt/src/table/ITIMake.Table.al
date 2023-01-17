table 50001 "ITI Make"
{
    Caption = 'Make';
    DataClassification = ToBeClassified;
    DataCaptionFields = Name;
    DrillDownPageID = "ITI Make List";
    LookupPageID = "ITI Make List";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(10; Name; Text[50])
        {
            Caption = 'Name';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
