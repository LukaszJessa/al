codeunit 80009 "LJA Credit Limit Mgt."
{
    procedure ValidateCustomerCreditLimit(Customer: Record Customer)
    var
        CreditLimitCalculated: Decimal;
        CreditLimitActual: Decimal;
    begin
        CreditLimitCalculated := CalculateCreditLimit(Customer);
        if CreditLimitCalculated = Customer."Credit Limit (LCY)" then begin
            Message(CreditLimitUpToDateTxt);
            exit;
        end;

        if GuiAllowed() then
            if not Confirm(AreYouSureQst, false, Customer.FieldCaption("Credit Limit (LCY)"), CreditLimitCalculated) then
                exit;

        CreditLimitActual := CreditLimitCalculated;
        UpdateCreditLimit(Customer, CreditLimitActual);
        if CreditLimitActual <> CreditLimitCalculated then
            Message(CreditLimitROundedTxt, CreditLimitActual);
    end;

    local procedure UpdateCreditLimit(Customer: Record Customer; NewCreditLimit: Decimal)
    begin
        NewCreditLimit := Round(NewCreditLimit, 100);
        Customer.Validate("Credit Limit (LCY)", NewCreditLimit);
        Customer.Modify();
    end;

    local procedure CalculateCreditLimit(Customer: Record Customer): Decimal
    begin
        Customer.SetRange("Date Filter", CalcDate('<-12M>', WorkDate()), WorkDate());
        Customer.CalcFields("Sales (LCY)", "Balance (LCY)");
        exit(Round(Customer."Sales (LCY)" * 0.5));
    end;

    var
        AreYouSureQst: Label 'Are you sure that you want to set the %1 to %2?';
        CreditLimitRoundedTxt: Label 'The credit limit was rounded to %1 to comply with company policies.';
        CreditLimitUpToDateTxt: Label 'The credit limit is up to date.';
}
