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
            Caption = 'Event Date';
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

    procedure Post(HideDialog: Boolean)
    var
        ITIVehicleJournalPostMeth: Codeunit "ITI Vehicle Journal Post";
    begin
        ITIVehicleJournalPostMeth.Post(Rec, HideDialog);
    end;

    procedure Post()
    begin
        Post(false);
    end;
}
