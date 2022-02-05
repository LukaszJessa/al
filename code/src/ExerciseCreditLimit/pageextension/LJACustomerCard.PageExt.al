pageextension 80002 "LJA Customer Card" extends "Customer Card"
{
    actions
    {
        addafter("F&unctions")
        {
            action(UpdateCreditLimit)
            {
                ApplicationArea = All;
                Caption = 'Update credit limit';
                ToolTip = 'Update credit limit';
                Image = UpdateDescription;

                trigger OnAction()
                var
                    LJACreditLimitMgt: Codeunit "LJA Credit Limit Mgt.";
                begin
                    LJACreditLimitMgt.ValidateCustomerCreditLimit(Rec);
                end;
            }
        }
    }
}
