codeunit 80007 "LJA Passing Parameters"
{

    #region Pass by value
    procedure PassParamByValueExecute()
    var
        myInteger: Integer;
        myResult: Integer;
    begin
        myInteger := 23;
        myResult := MyByValueFunction(myInteger);

        Message('myInteger: %1', myInteger);  // Displays 23
        Message('myResult: %1', myResult);    // Displays 17
    end;

    procedure MyByValueFunction(paramA: Integer): Integer
    begin
        paramA := 17;
        Exit(paramA);
    end;

    #endregion

    #region Pass by reference
    procedure PassParamByReferenceExecute()
    var
        myInteger: Integer;
        myResult: Integer;
    begin
        myInteger := 23;
        myResult := MyByReferenceFunction(myInteger);

        Message('myInteger: %1', myInteger);  // Displays 17
        Message('myResult: %1', myResult);    // Displays 17
    end;

    procedure MyByReferenceFunction(var paramA: Integer): Integer
    begin
        paramA := 17;
        exit(paramA);
    end;
    #endregion
}
