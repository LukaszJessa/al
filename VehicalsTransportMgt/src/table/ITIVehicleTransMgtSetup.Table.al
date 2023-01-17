table 50000 "ITI Vehicle Trans. Mgt. Setup"
{
    Caption = 'Vehicle Transport Mgt. Setup';
    DrillDownPageID = "Vehicle Transport Mgt. Setup";
    LookupPageID = "Vehicle Transport Mgt. Setup";

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(9; "Vehicle Nos."; Code[20])
        {
            Caption = 'Vehicle Nos.';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}

