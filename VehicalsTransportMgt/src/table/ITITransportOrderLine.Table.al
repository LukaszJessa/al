table 50007 "ITI Transport Order Line"
{
    Caption = 'ITI Transport Order Line';
    //DrillDownPageID = "Sales Lines";
    //LookupPageID = "Sales Lines";
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "ITI Transport Order Header"."No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }

        field(10; "Vehicle No."; Code[20])
        {
            Caption = 'Line No.';
            TableRelation = "ITI Vehicle"."No.";
        }

        field(11; Description; Text[100])
        {
            Caption = 'Description';
        }

        field(12; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
