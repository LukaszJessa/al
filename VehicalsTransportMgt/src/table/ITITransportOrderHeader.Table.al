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
        field(12; "Origin POI Code"; Code[10])
        {
            Caption = 'Origin POI Code';
            TableRelation = "ITI POI".Code;
        }
        field(13; "Origin POI Name"; Text[100])
        {
            Caption = 'Origin POI Name';
        }
        field(14; "Origin POI Name 2"; Text[50])
        {
            Caption = 'Origin POI Name 2';
        }
        field(15; "Origin POI Address"; Text[100])
        {
            Caption = 'Origin POI Address';
        }
        field(16; "Origin POI Address 2"; Text[50])
        {
            Caption = 'Origin POI Address 2';
        }
        field(17; "Origin POI City"; Text[30])
        {
            Caption = 'Origin POI City';
        }
        field(18; "Origin POI Contact"; Text[100])
        {
            Caption = 'Origin POI Contact';
        }

        field(19; "Origin POI Post Code"; Code[20])
        {
            Caption = 'Origin POI Post Code';
        }

        field(20; "Origin POI Country/Region Code"; Code[10])
        {
            Caption = 'Origin POI Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(21; "Origin POI County"; Text[30])
        {
            Caption = 'Origin POI County';
        }

        field(22; "Requested Starting Date"; Date)
        {
            Caption = 'Requested Starting Date';
        }
        field(23; "Planned Starting Date"; Date)
        {
            Caption = 'Planned Starting Date';
        }
        field(24; "Requested Due Date"; Date)
        {
            Caption = 'Requested Due Date';
        }

        field(25; "Planned Due Date"; Date)
        {
            Caption = 'Requested Due Date';
        }
        field(26; "Car Transporter No."; Code[20])
        {
            Caption = 'Car Transporter No.';
            TableRelation = Resource."No." where(Type = const(Machine));
        }
        field(27; "Driver No."; Code[20])
        {
            Caption = 'Driver No.';
            TableRelation = Resource."No." where(Type = const(Person));
        }
        field(100; "No. Series"; Code[20])
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

    procedure Post(HideDialog: Boolean)
    var
        ITITransOrderPostMeth: Codeunit "ITI Trans. Order Post Meth";
    begin
        ITITransOrderPostMeth.Post(Rec, HideDialog);
    end;

    procedure Post()
    begin
        Post(false);
    end;
}
