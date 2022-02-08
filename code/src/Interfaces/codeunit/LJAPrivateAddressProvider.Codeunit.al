codeunit 80025 "LJA Private Address Provider" implements "LJA IAddressProvider"
{

    procedure GetAddress(): Text
    begin
        exit('My Home address');
    end;

}
