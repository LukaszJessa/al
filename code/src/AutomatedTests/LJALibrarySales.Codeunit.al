codeunit 80026 "LJA Library - Sales"
{
    var
        LibrarySales: Codeunit "Library - Sales";

    procedure CreateCustomer(var Customer: Record Customer)
    begin
        LibrarySales.CreateCustomer(Customer);
        // 
    end;
}
