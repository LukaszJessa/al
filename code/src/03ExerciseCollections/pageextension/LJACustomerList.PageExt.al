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
                ToolTip = 'Get total sales grouped by country code Country Code';
                Image = Sales;

                trigger OnAction()
                var
                    LJASalesGroupedByCountry: Codeunit "LJA Sales Grouped By Country";
                begin
                    LJASalesGroupedByCountry.GetSalesAmountsGroupedByCountry();
                end;
            }

            action(GetCustomersGroupedByCountryCode)
            {
                ApplicationArea = All;
                Caption = 'Get Customers By Country Code';
                ToolTip = 'Get customers grouped by country code Country Code';
                Image = Sales;

                trigger OnAction()
                var
                    LJACustGroupedByCountry: Codeunit "LJA Cust. Grouped By Country";
                begin
                    LJACustGroupedByCountry.GetCustomersGroupedByCountry();
                end;
            }
        }
    }
}
