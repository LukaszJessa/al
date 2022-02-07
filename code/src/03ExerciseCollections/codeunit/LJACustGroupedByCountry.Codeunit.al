codeunit 80018 "LJA Cust. Grouped By Country"
{
    var
        CustomersByCountryCodeMsg: Label 'List of customers grouped by country code';

    procedure GetCustomersGroupedByCountry()
    begin
        PrintCustomersGroupedByCountry(CollectCustomersGroupedByCountry());
    end;

    local procedure CollectCustomersGroupedByCountry(): Dictionary of [Code[20], List of [Text]]
    var
        Customer: Record Customer;
        CustomersGroupedByCountry: Dictionary of [Code[20], List of [Text]];
    begin
        if Customer.FindSet() then
            repeat
                if not CustomersGroupedByCountry.ContainsKey(Customer."Country/Region Code") then
                    CustomersGroupedByCountry.Add(Customer."Country/Region Code", GetCustomerNamesList(Customer."Country/Region Code"));
            until Customer.Next() = 0;
        exit(CustomersGroupedByCountry);
    end;

    local procedure GetCustomerNamesList(CountryCode: Code[20]): List of [Text]
    var
        Customer: Record Customer;
        CustomerNames: List of [Text];
    begin
        Customer.SetRange("Country/Region Code", CountryCode);
        if Customer.FindSet() then
            repeat
                CustomerNames.Add(ShortenCustomerName(Customer.Name));
            until Customer.Next() = 0;

        exit(CustomerNames);
    end;

    local procedure PrintCustomersGroupedByCountry(CustomersGroupedByCountry: Dictionary of [Code[20], List of [Text]])
    var
        CustomerName: Text;
        CountryCode: Code[20];
        CustomerNames: TextBuilder;
        SummaryText: TextBuilder;
    begin
        SummaryText.AppendLine(CustomersByCountryCodeMsg);
        foreach CountryCode in CustomersGroupedByCountry.Keys do begin
            CustomerNames.Clear();
            foreach CustomerName in CustomersGroupedByCountry.Get(CountryCode) do begin
                CustomerNames.Append(CustomerName);
                CustomerNames.Append('|');
            end;

            SummaryText.Append(CountryCode);
            SummaryText.Append(':');
            SummaryText.AppendLine(CustomerNames.ToText());
        end;

        Message(SummaryText.ToText());
    end;

    local procedure ShortenCustomerName(CustomerName: Text): Text
    begin
        if Text.StrLen(CustomerName) > 5 then
            exit(CustomerName.Substring(1, 5));

        exit(CustomerName);
    end;
}
