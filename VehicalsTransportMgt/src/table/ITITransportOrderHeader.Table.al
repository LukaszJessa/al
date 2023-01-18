table 50006 "ITI Transport Order Header"
{
    Caption = 'Transport Order Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }

        field(12; "Ship-from Code"; Code[10])
        {
            Caption = 'Ship-from Code';
            TableRelation = "Ship-to Address";
        }
        field(13; "Ship-from Name"; Text[100])
        {
            Caption = 'Ship-from Name';
        }
        field(14; "Ship-from Name 2"; Text[50])
        {
            Caption = 'Ship-from Name 2';
        }
        field(15; "Ship-from Address"; Text[100])
        {
            Caption = 'Ship-from Address';
        }
        field(16; "Ship-from Address 2"; Text[50])
        {
            Caption = 'Ship-from Address 2';
        }
        field(17; "Ship-from City"; Text[30])
        {
            Caption = 'Ship-from City';
        }
        field(18; "Ship-from Contact"; Text[100])
        {
            Caption = 'Ship-from Contact';
        }

        field(19; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
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
            ITIVehicleTransMgtSetup.TestField("Transport Order Nos.");
            NoSeriesManagement.InitSeries(ITIVehicleTransMgtSetup."Transport Order Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;
}
