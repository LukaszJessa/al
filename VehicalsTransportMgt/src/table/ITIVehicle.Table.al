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

        field(11; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }

        field(12; "Search Description"; Code[100])
        {
            Caption = 'Search Description';
        }

        field(13; "Make Code"; Code[20])
        {
            Caption = 'Search Description';
            TableRelation = "ITI Make";
        }

        field(14; "Model Code"; Code[20])
        {
            Caption = 'Search Description';
            TableRelation = "ITI Model".Code where("Make Code" = field("Make Code"));
        }

        field(15; "VIN"; Code[17])
        {
            Caption = 'VIN';
        }
        field(16; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }

        field(17; "Vehicle Status"; Enum "ITI Vehicle Status")
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

    trigger OnInsert()
    var
        ITIVehicleTransMgtSetup: Record "ITI Vehicle Trans. Mgt. Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            ITIVehicleTransMgtSetup.Get();
            ITIVehicleTransMgtSetup.TestField("Vehicle Nos.");
            NoSeriesManagement.InitSeries(ITIVehicleTransMgtSetup."Vehicle Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;
}
