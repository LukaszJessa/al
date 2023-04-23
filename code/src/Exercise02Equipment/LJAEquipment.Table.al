table 80003 "LJA Equipment"
{
    Caption = 'LJA Equipment';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }

        field(10; "Equip. Category Code"; Code[10])
        {
            Caption = 'Equipment Category Code';
            DataClassification = ToBeClassified;
        }

        field(11; "Equip. Type Code"; Code[10])
        {
            TableRelation = "LJA Equipment Type"."Code" WHERE("Equip. Category Code" = field("Equip. Category Code"));
            Caption = 'Equipment Type Code';
            DataClassification = ToBeClassified;
        }
        field(12; "Description"; Code[20])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }

        field(13; "Serial Number"; Code[20])
        {
            Caption = 'Serial Number';
            DataClassification = ToBeClassified;
        }

        field(14; "Last Maintenance Date"; Date)
        {
            Caption = 'Last Maintenance Date';
            DataClassification = ToBeClassified;
        }

        field(15; "Next Maintenance Date"; Date)
        {
            Caption = 'Next Maintenance Date';
            DataClassification = ToBeClassified;
        }

        field(16; "Next Maintenance Date Formula"; DateFormula)
        {
            Caption = 'Next Maintenance Date Formula';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }

        key(SerialNumber; "Serial Number")
        {
            Unique = true;
        }
    }
}
