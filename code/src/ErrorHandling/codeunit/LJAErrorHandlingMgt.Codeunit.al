codeunit 80011 "LJA Error Handling Mgt."
{
    var
        SelfExplainedInfo1Err: Label 'Description of what went wrong 1';
        SelfExplainedInfo2Err: Label 'Description of what went wrong 2';

    [ErrorBehavior(ErrorBehavior::Collect)]
    procedure RiseAnError()
    var
        MyErrorInfo1: ErrorInfo;
        MyErrorInfo2: ErrorInfo;
        SomeCondition1: Boolean;
        SomeCondition2: Boolean;
    begin
        if not SomeCondition1 then begin
            MyErrorInfo1 := ErrorInfo.Create(SelfExplainedInfo1Err);
            MyErrorInfo1.ErrorType := ErrorType::Client;
            MyErrorInfo1.Verbosity := Verbosity::Error;
            MyErrorInfo1.Collectible(true);
            Error(MyErrorInfo1);
        end;

        if not SomeCondition2 then begin
            MyErrorInfo2 := ErrorInfo.Create(SelfExplainedInfo2Err);
            MyErrorInfo2.ErrorType := ErrorType::Client;
            MyErrorInfo2.Verbosity := Verbosity::Error;
            MyErrorInfo2.Collectible(true);
            Error(MyErrorInfo2);
        end;
    end;

}
