table 50003 "ITI Vehicle"
{
    Caption = 'Vehicle';
    DataClassification = ToBeClassified;
    DataCaptionFields = "No.", Description;
    DrillDownPageID = "ITI Make List";
    LookupPageID = "ITI Make List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description';
        }

        field(11; "Description 2"; Text[100])
        {
            Caption = 'Description 2';
        }

        field(12; "Search Description"; Code[100])
        {
            Caption = 'Search Description';
        }

        field(13; "VIN"; Code[17])
        {
            Caption = 'VIN';
        }
        field(14; "Serial Nos."; Code[20])
        {
            Caption = 'Serial Nos.';
            TableRelation = "No. Series";
        }

        field(15; "Vehicle Status"; Enum "ITI Vehicle Status")
        {
            Caption = 'Vehicle Status';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
