table 50004 "ITI Vehicle Journal Line"
{
    Caption = 'Vehicle Journal Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }

        field(10; "Vehicle No."; Code[20])
        {
            Caption = 'Account No.';
            DataClassification = ToBeClassified;
            TableRelation = "ITI Vehicle";
        }
        field(11; "Vehicle Event Type"; Enum "ITI Vehicle Event Type")
        {
            Caption = 'Vehicle Event Type';
            DataClassification = ToBeClassified;
        }

        field(12; "Event DateTime"; DateTime)
        {
            Caption = 'Event DateTime';
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
        key(PK; "Line No.")
        {
            Clustered = true;
        }
    }
}
