table 80050 "CUK Profile"
{
    Caption = 'CUK Profiles';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }

        field(10; "Profile Document Type"; Enum "CUK Profile Document Type")
        {
            Caption = 'CUK Profile Document Type';
        }
        field(11; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(12; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(13; "Option Code"; Code[50])
        {
            Caption = 'Option Code';
        }
        field(14; "Option Value"; Text[50])
        {
            Caption = 'Option Value';
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
