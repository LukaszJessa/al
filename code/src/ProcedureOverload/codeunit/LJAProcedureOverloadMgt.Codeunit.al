codeunit 80012 "LJA Procedure Overload Mgt."
{
    #region NonOverload Procedure
    procedure ToStringNoOverload(VariantValue: Variant): Text;
    begin
        if VariantValue.IsInteger then
            Exit(IntegerToString(VariantValue))
        else
            if VariantValue.IsDate then
                Exit(DateToString(VariantValue))
            else
                if VariantValue.IsText then
                    Exit(TextToString(VariantValue))
                else
                    Exit('');
    end;

    local procedure DateToString(value: Date): Text;
    begin
        Exit(Format(value));
    end;

    local procedure IntegerToString(value: Integer): Text;
    begin
        Exit(Format(value));
    end;

    local procedure TextToString(value: Text): Text;
    begin
        Exit(value);
    end;
    #endregion NonOverload Procedure

    #region Overloaded Procedures     
    procedure ToString(value: Text): Text;
    begin
        Exit(value);
    end;

    procedure ToString(value: Date): Text;
    begin
        Exit(Format(value));
    end;

    procedure ToString(value: Integer): Text;
    begin
        Exit(Format(value));
    end;
    #endregion Overloaded Procedures
}
