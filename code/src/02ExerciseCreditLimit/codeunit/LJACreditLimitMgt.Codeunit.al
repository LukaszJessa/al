codeunit 80009 "LJA Credit Limit Mgt."
{
    procedure ValidateCustomerCreditLimit(Customer: Record Customer)
    var
        RoundedCreditLimit: Decimal;
        BaseCreditLimit: Decimal;
    begin
        BaseCreditLimit := CalculateBaseCreditLimit(Customer);
        RoundedCreditLimit := RoundCreditLimit(BaseCreditLimit);
        if RoundedCreditLimit = Customer."Credit Limit (LCY)" then begin
            Message(CreditLimitUpToDateTxt);
            exit;
        end;

        if GuiAllowed() then
            if not Confirm(AreYouSureQst, false, Customer.FieldCaption("Credit Limit (LCY)"), RoundedCreditLimit) then
                exit;

        if BaseCreditLimit <> RoundedCreditLimit then
            Message(CreditLimitRoundedTxt, RoundedCreditLimit);
        UpdateCreditLimit(Customer, RoundedCreditLimit);
    end;

    local procedure UpdateCreditLimit(Customer: Record Customer; NewCreditLimit: Decimal)
    begin
        Customer.Validate("Credit Limit (LCY)", NewCreditLimit);
        Customer.Modify();
    end;

    local procedure CalculateBaseCreditLimit(Customer: Record Customer): Decimal
    begin
        Customer.SetRange("Date Filter", CalcDate('<-12M>', WorkDate()), WorkDate());
        Customer.CalcFields("Sales (LCY)", "Balance (LCY)");
        exit(Round(Customer."Sales (LCY)" * 0.5));
    end;

    local procedure RoundCreditLimit(BaseCreditLimit: Decimal): Decimal
    var
        RoundedCreditLimit: Decimal;
    begin
        RoundedCreditLimit := Round(BaseCreditLimit, 100);
        exit(RoundedCreditLimit);
    end;

    var
        AreYouSureQst: Label 'Are you sure that you want to set the %1 to %2?', Comment = '%1 value1 %2 value 2';
        CreditLimitRoundedTxt: Label 'The credit limit was rounded to %1 to comply with company policies.', Comment = '%1 value1';
        CreditLimitUpToDateTxt: Label 'The credit limit is up to date.';
}
