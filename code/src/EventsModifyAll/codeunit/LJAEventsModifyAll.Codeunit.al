codeunit 80005 "LJA Events Modify All"
{
    procedure ReplaceCustomerAddresses(OldAddress: Text[100]; NewAddress: Text[100])
    var
        Customer: Record Customer;
    begin
        Customer.SetRange(Address, OldAddress);
        Customer.ModifyAll(Address, NewAddress);
    end;

    #region Actual execute
    procedure ReplaceCustomerAddressesActualExecute(OldAddress: Text[100]; NewAddress: Text[100])
    var
        Customer: Record Customer;
    begin
        Customer.SetRange(Address, OldAddress);
        if Customer.FindSet() then
            repeat
                Customer.Address := NewAddress;
                Customer.Modify();
            until Customer.Next() = 0;
    end;

    #endregion

    #region ReplaceCustomerAddressesImproved
    procedure ReplaceCustomerAddressesImproved(OldAddress: Text[100]; NewAddress: Text[100])
    var
        Customer: Record Customer;
        LJASalesMgt: Codeunit "LJA Sales Mgt.";
    begin
        Customer.SetRange(Address, OldAddress);
        UnbindSubscription(LJASalesMgt);
        Customer.ModifyAll(Address, NewAddress);
        BindSubscription(LJASalesMgt);
    end;

    #endregion
}
