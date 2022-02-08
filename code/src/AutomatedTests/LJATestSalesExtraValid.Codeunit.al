codeunit 80023 "LJA Test Sales Extra Valid."
{
    Subtype = Test;

    var
        LibrarySales: Codeunit "Library - Sales";
        Assert: Codeunit Assert;


    [Test]
    procedure CheckSalesPersonIsMandatoryOnSalesOrderRelease()
    var
        Customer: Record Customer;
        SalesHeader: record "Sales Header";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        SalesOrderPage: TestPage "Sales Order";
        SalesPersonMandatoryErr: Label 'Sales person is mandatory';
    begin
        // [Scenario] 
        // [Given] 
        LibrarySales.CreateCustomer(Customer);
        if not SalesReceivablesSetup.Get() then
            SalesReceivablesSetup.Init();

        SalesReceivablesSetup."LJA S. Per. Man. on SO Release" := true;
        LibrarySales.CreateSalesOrder(SalesHeader);
        SalesHeader."Salesperson Code" := '';
        SalesHeader.Modify();
        SalesOrderPage.GoToRecord(SalesHeader);
        // [When]         
        SalesOrderPage.Release.Invoke();
        // [Then]
        Assert.ExpectedError(SalesPersonMandatoryErr);
    end;
}
