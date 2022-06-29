pageextension 80004 "LJA Customer List" extends "Customer List"
{
    actions
    {
        addafter("&Customer")
        {
            action(GetSalesGroupedByCountryCode)
            {
                ApplicationArea = All;
                Caption = 'Get Total Sales By Country Code';
                ToolTip = 'Get total sales grouped by country code';
                Image = Sales;

                trigger OnAction()
                var
                    LJASalesGroupedByCountry: Codeunit "LJA Sales Grouped By Country";
                begin
                    LJASalesGroupedByCountry.GetSalesAmountsGroupedByCountry();
                    ShowActionDoneMessage(GetSalesGroupedByCountryCodeSummaryNameLbl)
;
                end;
            }

            action(GetCustomersGroupedByCountryCode)
            {
                ApplicationArea = All;
                Caption = 'Get Customers By Country Code';
                ToolTip = 'Get customers grouped by country code';
                Image = Sales;

                trigger OnAction()
                var
                    LJACustGroupedByCountry: Codeunit "LJA Cust. Grouped By Country";
                begin
                    LJACustGroupedByCountry.GetCustomersGroupedByCountry();
                    ShowActionDoneMessage(GetCustomersGroupedByCountryCodeSummaryNameLbl);
                end;
            }
        }
    }

    var
        ActionDoneMsg: Label '%1 summary has been shown.', Comment = '%1 - name of the summary';
        GetSalesGroupedByCountryCodeSummaryNameLbl: Label 'Sales grouped by country code';
        GetCustomersGroupedByCountryCodeSummaryNameLbl: Label 'Customer grouped by country code';

    local procedure ShowActionDoneMessage(SummaryName: Text)
    begin
        Message(ActionDoneMsg, SummaryName);
    end;
}
