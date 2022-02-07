codeunit 80017 "LJA Sales Grouped By Country"
{
    var
        SalesByCountryCodeMsg: Label 'For country code %1 total sales was %2', Comment = '%1 country code, %2 sales amount';

    procedure GetSalesAmountsGroupedByCountry()
    begin
        PrintSalesGroupedByCountry(CalculateSalesGroupedByCountry());
    end;

    local procedure CalculateSalesGroupedByCountry(): Dictionary of [Code[20], Decimal]
    var
        Customer: Record Customer;
        SalesByCountryCode: Dictionary of [Code[20], Decimal];
    begin
        if Customer.FindSet() then
            repeat
                if not SalesByCountryCode.ContainsKey(Customer."Country/Region Code") then
                    SalesByCountryCode.Add(Customer."Country/Region Code", GetCustomerTotalSalesAmount(Customer))
                else
                    SalesByCountryCode.Set(Customer."Country/Region Code", SalesByCountryCode.Get(Customer."Country/Region Code") + GetCustomerTotalSalesAmount(Customer));
            until Customer.Next() = 0;
        exit(SalesByCountryCode);
    end;

    local procedure GetCustomerTotalSalesAmount(Customer: Record Customer): Decimal
    begin
        Customer.CalcFields("Sales (LCY)");
        Exit(Customer."Sales (LCY)");
    end;

    local procedure PrintSalesGroupedByCountry(SalesGroupedByCountry: Dictionary of [Code[20], Decimal])
    var
        CountryCode: Code[20];
        SummaryText: TextBuilder;
    begin
        foreach CountryCode in SalesGroupedByCountry.Keys do
            SummaryText.AppendLine(StrSubstNo(SalesByCountryCodeMsg, CountryCode, SalesGroupedByCountry.Get(CountryCode)));

        Message(SummaryText.ToText());
    end;
}
