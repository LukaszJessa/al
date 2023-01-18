table 50007 "ITI Transport Order Line"
{
    Caption = 'ITI Transport Order Line';
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
            Caption = 'Vehicle No.';
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
        field(13; "Origin POI Code"; Code[10])
        {
            Caption = 'Origin POI Code';
            TableRelation = "ITI POI".Code;
        }
        field(14; "Destination POI Code"; Code[10])
        {
            Caption = 'Destination POI Code';
            TableRelation = "ITI POI".Code;
        }

        field(15; "Requested Delivery Date"; Date)
        {
            Caption = 'Requested Delivery Date';
        }

        field(16; "Planned Delivery Date"; Date)
        {
            Caption = 'Requested Delivery Date';
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    procedure CreateVehicleJnlLine(HideDialog: Boolean)
    var
        ITICreateVehicleJnlLine: Codeunit "ITI Create Vehicle Jnl. Line";
    begin
        ITICreateVehicleJnlLine.CreateVehicleJnlLine(Rec, HideDialog);
    end;

    procedure CreateVehicleJnlLine()
    begin
        CreateVehicleJnlLine(false);
    end;
}
