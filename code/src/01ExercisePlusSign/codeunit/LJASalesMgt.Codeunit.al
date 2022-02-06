codeunit 80004 "LJA Sales Mgt."
{
    procedure ValidateCustomer(Customer: Record Customer)
    begin
        ValidateCustomerAddress(Customer.Address);
    end;

    local procedure CheckForPlusSign(TextToCheck: Text): Boolean
    begin
        if StrPos(TextToCheck, '+') > 0 then
            exit(true);

    end;

    local procedure ValidateCustomerAddress(Address: Text[100])
    begin
        if CheckForPlusSign(Address) then
            Message('CheckForPlusSign()');
    end;
}
