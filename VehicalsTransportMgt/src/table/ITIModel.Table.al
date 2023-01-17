table 50002 "ITI Model"
{
    Caption = 'Model';
    DataClassification = ToBeClassified;
    DataCaptionFields = "Make Code", Name;
    DrillDownPageID = "ITI Model List";
    LookupPageID = "ITI Model List";

    fields
    {
        field(1; "Make Code"; Code[20])
        {
            Caption = 'Make Code';
            NotBlank = true;
            TableRelation = "ITI Make";
        }
        field(2; "Code"; Code[20])
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
        key(PK; "Code", "Make Code")
        {
            Clustered = true;
        }
    }
}
