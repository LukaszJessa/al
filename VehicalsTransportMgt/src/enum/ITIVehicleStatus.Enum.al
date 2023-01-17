enum 50000 "ITI Vehicle Status"
{
    Caption = 'Vehicle Status';
    Extensible = true;

    value(0; "New")
    {
        Caption = 'New';
    }

    value(1; "Preserved")
    {
        Caption = 'Preserved';
    }

    value(2; "Ready")
    {
        Caption = 'Ready';
    }

    value(3; "Closed")
    {
        Caption = 'Closed';
    }
}