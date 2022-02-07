codeunit 80010 "LJA Collections"
{
    #region List
    procedure GetCustomerNameList(): List of [Text]
    var
        CustomerNames: List of [Text];
    begin
        CustomerNames.Add('John');
        CustomerNames.Add('Nick');
        CustomerNames.Add('Paul');
        exit(CustomerNames);
    end;
    #endregion List

    #region Dictionary
    procedure GetCountriesDictionary(): Dictionary of [Code[20], List of [Text]]
    var
        CountriesDictionary: Dictionary of [Code[20], List of [Text]];
    begin
        CountriesDictionary.Add('US', GetCustomerNameList());
        CountriesDictionary.Add('DK', GetCustomerNameList());
        exit(CountriesDictionary);
    end;
    #endregion Dictionary

    #region Iteration over List
    procedure PrintCustomerNames(CustomerNamesList: List of [Text])
    var
        CustomerName: Text;
    begin
        foreach CustomerName in CustomerNamesList do
            Message(CustomerName);
    end;

    #endregion

    #region Iteration over dictionary
    procedure PrintCustomerNamesGroupedByCountryCode(CustomerByCountriesDictionary: Dictionary of [Code[20], List of [Text]])
    var
        CustomerName: Text;
        CountryCode: Code[20];
    begin
        foreach CountryCode in CustomerByCountriesDictionary.Keys do
            foreach CustomerName in CustomerByCountriesDictionary.Get(CountryCode) do
                Message(CountryCode + CustomerName);
    end;
    #endregion

}
