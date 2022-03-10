table 80001 "LJA Long Running Data"
{
    Caption = 'LJA Long Running Data';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(10; "Random Text"; Text[2048])
        {
            Caption = 'Random Text';
            DataClassification = ToBeClassified;
        }
        field(11; "Random Integer"; Integer)
        {
            Caption = 'Random Integer';
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
