codeunit 80023 "LJA Test Sales Extra Valid."
{
    Subtype = Test;

    var
        LibrarySales: Codeunit "Library - Sales";
        Assert: Codeunit Assert;
        SalesPersonMandatoryErr: Label 'Sales person is mandatory';

    [Test]
    procedure CheckSalesPersonIsMandatoryOnSalesOrderRelease()
    var
        Customer: Record Customer;
        SalesHeader: record "Sales Header";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        SalesOrderPage: TestPage "Sales Order";
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
        SalesOrderPage.OpenEdit();
        SalesOrderPage.GoToRecord(SalesHeader);
        SalesOrderPage.Reopen.Invoke();
        // [When]         
        asserterror SalesOrderPage.Release.Invoke();
        // [Then]
        Assert.ExpectedError(SalesPersonMandatoryErr);
    end;

    [Test]
    procedure CheckSalesPersonIsNotMandatoryOnSalesOrderRelease()
    var
        Customer: Record Customer;
        SalesHeader: record "Sales Header";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        SalesOrderPage: TestPage "Sales Order";
    begin
        // [Scenario] 
        // [Given] 
        LibrarySales.CreateCustomer(Customer);
        if not SalesReceivablesSetup.Get() then
            SalesReceivablesSetup.Init();

        SalesReceivablesSetup."LJA S. Per. Man. on SO Release" := false;
        SalesReceivablesSetup.Modify();
        LibrarySales.CreateSalesOrder(SalesHeader);
        SalesHeader."Salesperson Code" := '';
        SalesHeader.Modify();
        SalesOrderPage.OpenEdit();
        SalesOrderPage.GoToRecord(SalesHeader);
        SalesOrderPage.Reopen.Invoke();
        // [When]         
        asserterror SalesOrderPage.Release.Invoke();
        // [Then]
        Assert.IsFalse(StrPos(GetLastErrorText(), SalesPersonMandatoryErr) > 0, 'Sales order does not release because of mandatory sales person.');


    end;
}
