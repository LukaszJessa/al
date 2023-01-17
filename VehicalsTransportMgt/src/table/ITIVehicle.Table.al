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
            Caption = 'Make Code';
            TableRelation = "ITI Make";
        }

        field(14; "Model Code"; Code[20])
        {
            Caption = 'Model Code';
            TableRelation = "ITI Model".Code where("Make Code" = field("Make Code"));
        }

        field(15; "VIN"; Code[30])
        {
            Caption = 'VIN';
        }
        field(16; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }

        field(17; "Vehicle Status"; Enum "ITI Vehicle Status")
        {
            Caption = 'Vehicle Status';

            trigger OnValidate()
            begin
                UpdateStatus();
            end;
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

    var
        EmptyVINConfirmationQst: Label '%1 is empty. Do you want to continue?', Comment = '%1 - Vehicle VIN field caption';

    procedure UpdateStatus()
    begin
        if Rec."Vehicle Status" = xRec."Vehicle Status" then
            exit;

        if Rec."Vehicle Status" = Rec."Vehicle Status"::Ready then
            SetStatusReady();
    end;

    procedure SetStatusReady()
    var
        ConfirmManagement: Codeunit "Confirm Management";
    begin
        if Rec.VIN = '' then
            if not ConfirmManagement.GetResponseOrDefault(StrSubstNo(EmptyVINConfirmationQst, Rec.FieldCaption(VIN)), true) then
                Error('');
    end;
}
