codeunit 80024 "LJA Company Address Provider" implements "LJA IAddressProvider"
{

    procedure GetAddress(): Text
    begin
        exit('My Company address');
    end;

}
