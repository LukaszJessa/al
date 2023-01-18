page 50000 "ITI Vehicle Trans. Mgt. Setup"
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
                field("Transport Order Nos."; Rec."Transport Order Nos.")
                {
                    ToolTip = 'Specifies the value of the Transport Order Nos. field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
