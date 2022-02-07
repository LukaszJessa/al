codeunit 80018 "LJA Cust. Grouped By Country"
{
    var
        CustomersByCountryCodeMsg: Label 'List of customers for country code %1 : %2', Comment = '%1 country code, %2 customers';

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
                CustomerNames.Add(Customer.Name);
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
        foreach CountryCode in CustomersGroupedByCountry.Keys do begin
            CustomerNames.Clear();
            foreach CustomerName in CustomersGroupedByCountry.Get(CountryCode) do begin
                CustomerNames.Append(CustomerName);
                CustomerNames.Append('|');
            end;

            SummaryText.AppendLine(StrSubstNo(CustomersByCountryCodeMsg, CountryCode, CustomerNames.ToText()));
        end;
    end;
}
