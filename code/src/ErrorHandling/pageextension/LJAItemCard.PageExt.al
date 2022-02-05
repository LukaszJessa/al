pageextension 80003 "LJA Item Card" extends "Item Card"
{
    actions
    {
        addafter("&Bin Contents")
        {
            action(RiseAnError)
            {
                ApplicationArea = All;
                Caption = 'Rise an error';
                ToolTip = 'Rise an error';
                Image = Error;

                trigger OnAction()
                var
                    LJAErrorHandlingMgt: Codeunit "LJA Error Handling Mgt.";
                begin
                    LJAErrorHandlingMgt.RiseAnError();
                end;
            }
        }
    }
}