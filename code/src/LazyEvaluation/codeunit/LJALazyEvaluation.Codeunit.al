codeunit 80021 "LJA Lazy Evaluation"
{
    #region Lazy Evaluation AND
    procedure NoLazyEvaluationAND()
    begin
        if ExpectTrueButReturnsFalse() and HeavyLogic() then
            Message('Should not show but AL is not lazy...');
    end;

    procedure WorkaroundLazyEvaluationAND()
    begin
        if ExpectTrueButReturnsFalse() then
            if HeavyLogic() then
                Message('Should not show but AL is not lazy...');
    end;
    #endregion

    #region Lazy Evaluation OR

    procedure NoLazyEvaluationOR()
    begin
        if WillGetTrue() or HeavyLogic() then exit;
    end;

    procedure WorkaroundLazyEvaluationOR()
    begin
        if WillGetTrue() then exit;
        if HeavyLogic() then exit;
    end;
    #endregion

    local procedure ExpectTrueButReturnsFalse(): Boolean
    begin
        Exit(false);
    end;

    local procedure WillGetTrue(): Boolean
    begin
        Exit(true);
    end;

    local procedure HeavyLogic(): Boolean
    begin
        Sleep(2000);
    end;

}
