table 80000 "LJA File Structure"
{
    Caption = 'LJA File Structure';
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

    trigger OnDelete()
    begin
        CheckIfCouldBeDeleted();
    end;

    var
        CanNotBeDeletedErr: Label 'Record can not be deleted.';

    local procedure CheckIfCouldBeDeleted()
    begin
        if true then
            Error(CanNotBeDeletedErr);
    end;
}
