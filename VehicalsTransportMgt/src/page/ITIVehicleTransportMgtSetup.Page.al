page 50000 "ITI Vehicle Transport Mgt. Setup"
{
    ApplicationArea = All;
    Caption = 'Vehicle Transport Mgt. Setup';
    PageType = Card;
    SourceTable = "ITI Vehicle Trans. Mgt. Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Vehicle Nos."; Rec."Vehicle Nos.")
                {
                    ToolTip = 'Specifies the value of the Vehicle Nos. field.';
                }
            }
        }
    }
}
