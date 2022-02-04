// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 80001 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
        Init();
    end;

    var
        CustInvoiceDisc: Record "Cust. Invoice Disc.";
        CustomerAmount: Record "Customer Amount";
        VendorAmount: Record "Vendor Amount";

    local procedure Init()
    begin
        CustInvoiceDisc.Init();
    end;
}