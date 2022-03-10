table 80002 "LJA Long Running Auto Inc."
{
    Caption = 'LJA Long Running Data Auto Inc.';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
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
