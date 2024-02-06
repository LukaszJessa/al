/// <summary>
/// Contains functionality specific for the integrations routines.
/// </summary>
namespace MyGlobal.Cronus.DataModel;

using Microsoft.Sales.Document;
/// <summary>
/// Codeunit Customer Mgt. (ID 80023).
/// </summary>
codeunit 80023 "Customer Mgt."
{
    /// <summary>
    /// Import Sales Lines
    /// </summary>
    /// <returns>Return value of type Integer.</returns>
    procedure ImportSalesLines(): Integer
    var
        SalesLine: Record "Sales Line";
        SalesHeader: Record "Sales Header";
        Counter: Integer;
    begin
        Counter := Abs(SalesLine.Count());
        Counter := Abs(SalesHeader.Count());
        exit(Counter);
    end;
}
