codeunit 80020 "LJA Sales Order Mgt."
{
    var
        SalesPersonMandatoryErr: Label 'Sales person is mandatory';
        RequestedDeliveryDateMandatoryErr: Label 'Requested delivery date is mandatory';

    procedure ValidateSalesOrderOnRelease(var SalesHeader: Record "Sales Header")
    begin
        if SalesHeader."Document Type" <> SalesHeader."Document Type"::Order then
            exit;

        CheckMandatoryFields(SalesHeader);
    end;

    [ErrorBehavior(ErrorBehavior::Collect)]
    local procedure CheckMandatoryFields(var SalesHeader: Record "Sales Header")
    var
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        SalesPersonErrorInfo: ErrorInfo;
        RequestedDeliveryDateErrorInfo: ErrorInfo;
    begin
        if not SalesReceivablesSetup.Get() then
            SalesReceivablesSetup.Init();

        if SalesReceivablesSetup."LJA S. Per. Man. on SO Release" then
            if SalesHeader."Salesperson Code" = '' then begin
                SalesPersonErrorInfo := ErrorInfo.Create(SalesPersonMandatoryErr);
                SalesPersonErrorInfo.ErrorType := ErrorType::Client;
                SalesPersonErrorInfo.Verbosity := Verbosity::Error;
                SalesPersonErrorInfo.Collectible(true);
                Error(SalesPersonErrorInfo);
            end;

        if SalesReceivablesSetup."LJA R. Del. Date Man. on SO R." then
            if SalesHeader."Requested Delivery Date" = 0D then begin
                RequestedDeliveryDateErrorInfo := ErrorInfo.Create(RequestedDeliveryDateMandatoryErr);
                RequestedDeliveryDateErrorInfo.ErrorType := ErrorType::Client;
                RequestedDeliveryDateErrorInfo.Verbosity := Verbosity::Error;
                RequestedDeliveryDateErrorInfo.Collectible(true);
                Error(RequestedDeliveryDateErrorInfo);
            end;
    end;
}
