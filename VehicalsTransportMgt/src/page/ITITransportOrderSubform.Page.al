page 50008 "ITI Transport Order Subform"
{
    AutoSplitKey = true;
    ApplicationArea = All;
    Caption = 'Transport Order Subform';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "ITI Transport Order Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Origin POI Code"; Rec."Origin POI Code")
                {
                    ToolTip = 'Specifies the value of the Origin POI Code field.';
                }
                field("Destination POI Code"; Rec."Destination POI Code")
                {
                    ToolTip = 'Specifies the value of the Destination POI Code field.';
                }
                field("Requested Delivery Date"; Rec."Requested Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Requested Delivery Date field.';
                }
                field("Planned Delivery Date"; Rec."Planned Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Requested Delivery Date field.';
                }
            }
        }
    }
}
