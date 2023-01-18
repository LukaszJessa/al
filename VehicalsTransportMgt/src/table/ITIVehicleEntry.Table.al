table 50005 "ITI Vehicle Entry"
{
    Caption = 'ITI Vehicle Entry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }

        field(10; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            DataClassification = ToBeClassified;
            TableRelation = "ITI Vehicle";
        }
        field(11; "Vehicle Activity Type"; Enum "ITI Vehicle Activity Type")
        {
            Caption = 'Vehicle Activity Type';
            DataClassification = ToBeClassified;
        }

        field(12; "Activity Date"; Date)
        {
            Caption = 'Activity Date';
            DataClassification = ToBeClassified;
        }

        field(13; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            DataClassification = ToBeClassified;
        }

        field(14; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(15; "Register Date"; Date)
        {
            Caption = 'Register Date';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
