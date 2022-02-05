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
}
