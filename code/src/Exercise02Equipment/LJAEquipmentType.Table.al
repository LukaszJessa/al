table 80005 "LJA Equipment Type"
{
    Caption = 'Equipment Type';
    DataClassification = ToBeClassified;

    fields
    {
        /// <summary>
        /// For instance Machines, Handheld, Others
        /// </summary>
        field(1; "Equip. Category Code"; Code[10])
        {
            Caption = 'Equipment Category Code';
            DataClassification = ToBeClassified;
            TableRelation = "LJA Equipment Category";
        }

        field(2; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }

        field(10; "Name"; Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }

        field(11; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(12; "Next Maintenance Date Formula"; DateFormula)
        {
            Caption = 'Next Maintenance Date Formula';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Equip. Category Code", Code)
        {
            Clustered = true;
        }
    }
}
