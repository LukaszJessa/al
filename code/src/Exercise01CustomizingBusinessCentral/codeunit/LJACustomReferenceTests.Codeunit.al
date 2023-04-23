codeunit 80031 "LJA Custom Reference Tests"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure CheckIfSalesInvoiceCustomReferenceIsCopiedToCustLedgerEntry()
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        Customer: Record Customer;
        Item: Record Item;
        SalesHeader: Record "Sales Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesLine: Record "Sales Line";
        Assert: Codeunit Assert;
        LibrarySales: Codeunit "Library - Sales";
    //CustomReferenceLbl: label 'Custom Reference on Cust. Ledger Entry should be Sales Header %1 is different then ';
    begin
        //[Scenario] Post Sales invoice with Custom Reference filled in and verify if it is copied to Cust. Ledger Entry.
        //[Given] Sales invoice document with Custom Reference 
        LibrarySales.CreateCustomerWithAddress(Customer);
        LibrarySales.CreateSalesDocumentWithItem(SalesHeader, SalesLine, SalesHeader."Document Type"::Invoice, Customer."No.", Item."No.", 100, '', WorkDate());
        SalesHeader.Validate("LJA Custom Reference", SalesHeader."No.");
        //[When] Post Sales Document
        LibrarySales.PostSalesDocument(SalesHeader, false, false);
        //[Then] Custom Reference is copied into Cust. Ledger Entry
        SalesInvoiceHeader.SetRange("Pre-Assigned No.", SalesHeader."No.");
        SalesInvoiceHeader.FindFirst();
        CustLedgerEntry.SetRange("Document No.", SalesInvoiceHeader."No.");
        CustLedgerEntry.FindFirst();
        Assert.AreNotEqual(SalesHeader."LJA Custom Reference", '', 'Custom Reference must not be empty');
        Assert.AreEqual(SalesHeader."LJA Custom Reference", CustLedgerEntry."LJA Custom Reference", 'Custom Reference has not been copied correctly to Cust. Ledger Entry');
    end;
}
