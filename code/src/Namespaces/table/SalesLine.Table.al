/// <summary>
/// Unknown ColumbusGlobal.
/// </summary>
namespace ColumbusGlobal.Cronus.DataModel;

/// <summary>
/// Sale Line
/// </summary>
table 80091 "Sales Line"
{
    Caption = 'Sales Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Valid Entry"; Boolean)
        {
            Caption = 'Valid Entry';
            DataClassification = ToBeClassified;
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description';
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
