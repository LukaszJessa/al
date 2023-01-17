page 50004 "ITI Vehicle Trans. Mgt. RC"
{
    ApplicationArea = All;
    Caption = 'Vehicle Transport Mgt. RC';
    PageType = RoleCenter;

    layout
    {
    }

    actions
    {
        area(Processing)
        {
            action("Vehicles")
            {
                Caption = 'Vehicles';
                Image = Setup;
                RunObject = Page "ITI Vehicle List";
                ToolTip = 'Vehicle list';
            }
            action("Makes")
            {
                Caption = 'Makes';
                Image = Setup;
                RunObject = Page "ITI Make List";
                ToolTip = 'Make list';
            }

            action("Models")
            {
                Caption = 'Models';
                Image = Setup;
                RunObject = Page "ITI Model List";
                ToolTip = 'Model list';
            }
            action("Vehicle Transport Mgt. Setup")
            {
                Caption = 'Vehicle Transport Mgt. Setup';
                Image = Setup;
                RunObject = Page "ITI Vehicle Trans. Mgt. Setup";
                ToolTip = 'Vehicle Transport Mgt. Setup';
            }
        }
    }
}
