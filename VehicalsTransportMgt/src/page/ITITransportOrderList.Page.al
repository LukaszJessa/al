page 50010 "ITI Transport Order List"
{
    ApplicationArea = All;
    Caption = 'ITI Transport Order List';
    CardPageID = "ITI Transport Order";
    DataCaptionFields = "Car Transporter No.";
    Editable = false;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = "ITI Transport Order Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Origin POI Code"; Rec."Origin POI Code")
                {
                    ToolTip = 'Specifies the value of the Origin POI Code field.';
                }
                field("Car Transporter No."; Rec."Car Transporter No.")
                {
                    ToolTip = 'Specifies the value of the Car Transporter No. field.';
                }
                field("Driver No."; Rec."Driver No.")
                {
                    ToolTip = 'Specifies the value of the Driver No. field.';
                }
                field("Planned Starting Date"; Rec."Planned Starting Date")
                {
                    ToolTip = 'Specifies the value of the Planned Starting Date field.';
                }
                field("Planned Due Date"; Rec."Planned Due Date")
                {
                    ToolTip = 'Specifies the value of the Requested Due Date field.';
                }
            }
        }
    }
}
