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
                ToolTip = 'Get total sales grouped by country code Country Code, Cities, Sales';
                Image = Sales;

                trigger OnAction()
                var
                    LJASalesGroupedByCountry: Codeunit "LJA Sales Grouped By Country";
                begin
                    LJASalesGroupedByCountry.GetSalesGroupedByCountry();
                end;
            }
        }
    }
}
