codeunit 80006 "LJA Returning Complex Type"
{
    procedure GetCustomerByName(Name: Text): record Customer;
    var
        Customer: record Customer;
    begin
        Customer.SetFilter(Name, '@' + Name + '*');
        Customer.FindFirst();
        exit(Customer);
    end;

    #region Call member
    procedure CallMemberOnTheReturnedVariable(Customer: Record Customer)
    begin
        GetCustomerByName('SomeName').GetSalesLCY();
    end;
    #endregion
}
