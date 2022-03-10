codeunit 80021 "LJA Lazy Evaluation"
{
    var
        NiceMessageMsg: Label 'Nice message.';
    #region Lazy Evaluation AND
    procedure NoLazyEvaluationAND()
    begin
        if SomeConditionWhichFails() and SomeConditionWithHeavyLogic() then
            Message(NiceMessageMsg);
    end;

    procedure WorkaroundLazyEvaluationAND()
    begin
        if SomeConditionWhichFails() then
            if SomeConditionWithHeavyLogic() then
                Message(NiceMessageMsg);
    end;
    #endregion

    #region Lazy Evaluation OR
    procedure NoLazyEvaluationOR()
    begin
        if WillGetTrue() or SomeConditionWithHeavyLogic() then exit;
    end;

    procedure WorkaroundLazyEvaluationOR()
    begin
        if WillGetTrue() then exit;
        if SomeConditionWithHeavyLogic() then exit;
    end;
    #endregion

    #region Local methods
    local procedure SomeConditionWhichFails(): Boolean
    begin
        Exit(false);
    end;

    local procedure WillGetTrue(): Boolean
    begin
        Exit(true);
    end;

    local procedure SomeConditionWithHeavyLogic(): Boolean
    begin
        Sleep(2000);
    end;
    #endregion
}
