codeunit 80023 "LJA Test Sales Extra Valid."
{
    Subtype = Test;

    var
        LibrarySales: Codeunit "Library - Sales";
        Assert: Codeunit Assert;
        SalesPersonMandatoryErr: Label 'Sales person is mandatory';

    [Test]
    procedure CheckSalesPersonIsMandatoryOnSalesOrderReleaseForEmptySalesPerson()
    var
        Customer: Record Customer;
        SalesHeader: record "Sales Header";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        SalesOrderPage: TestPage "Sales Order";
    begin
        // [Scenario] Sales order without sales person defined. Sales Person is setup to be mandatory in sales & receivables. 
        // [Given] Sales Person Mandatory on SO Release enabled in sales & receivables setup. Sales Order created with empty sales person.
        LibrarySales.CreateCustomer(Customer);
        if not SalesReceivablesSetup.Get() then
            SalesReceivablesSetup.Init();

        SalesReceivablesSetup."LJA S. Per. Man. on SO Release" := true;
        SalesReceivablesSetup.Modify();
        LibrarySales.CreateSalesOrder(SalesHeader);
        SalesHeader."Salesperson Code" := '';
        SalesHeader.Modify();
        SalesOrderPage.OpenEdit();
        SalesOrderPage.GoToRecord(SalesHeader);
        SalesOrderPage.Reopen.Invoke();
        // [When] Release a sales order.         
        asserterror SalesOrderPage.Release.Invoke();
        // [Then] Error should be raised that sales person is mandatory. 
        Assert.ExpectedError(SalesPersonMandatoryErr);
    end;

    [Test]
    procedure CheckSalesPersonIsMandatoryOnSalesOrderReleaseForNonEmptySalesPerson()
    var
        Customer: Record Customer;
        SalesHeader: record "Sales Header";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        SalesOrderPage: TestPage "Sales Order";
    begin
        // [Scenario] Sales order with sales person defined. Sales Person is setup to be mandatory in sales & receivables. 
        // [Given] Sales Person Mandatory on SO Release enabled in sales & receivables setup. Sales Order created with sales person.
        LibrarySales.CreateCustomer(Customer);
        if not SalesReceivablesSetup.Get() then
            SalesReceivablesSetup.Init();

        SalesReceivablesSetup."LJA S. Per. Man. on SO Release" := true;
        SalesReceivablesSetup.Modify();
        LibrarySales.CreateSalesOrder(SalesHeader);
        SalesHeader."Salesperson Code" := 'SalesPersonName';
        SalesHeader.Modify();
        SalesOrderPage.OpenEdit();
        SalesOrderPage.GoToRecord(SalesHeader);
        SalesOrderPage.Reopen.Invoke();
        // [When] Release an sales order.         
        asserterror SalesOrderPage.Release.Invoke();
        // [Then] There should be no error with Sales Person mandatory message.
        Assert.IsFalse(StrPos(GetLastErrorText(), SalesPersonMandatoryErr) > 0, 'Sales order does not release because of mandatory sales person.');
    end;

    [Test]
    procedure CheckSalesPersonIsNotMandatoryOnSalesOrderReleaseForEmptySalesPerson()
    var
        Customer: Record Customer;
        SalesHeader: record "Sales Header";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        SalesOrderPage: TestPage "Sales Order";
    begin
        // [Scenario] Sales order without sales person defined. Sales Person is setup to be mandatory in sales & receivables. 
        // [Given] Sales Person Mandatory on SO Release disabled in sales & receivables setup. Sales Order created with empty sales person.
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
        // [When] Release an sales order.     
        asserterror SalesOrderPage.Release.Invoke();
        // [Then] There should be no error with Sales Person mandatory message.
        Assert.IsFalse(StrPos(GetLastErrorText(), SalesPersonMandatoryErr) > 0, 'Sales order does not release because of mandatory sales person.');
    end;
}
