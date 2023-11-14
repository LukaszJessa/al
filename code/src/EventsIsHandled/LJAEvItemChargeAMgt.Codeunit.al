namespace Jessa.Playground;

using Microsoft.Sales.Document;
codeunit 80016 "LJA Ev. Item Charge A. Mgt."
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeUpdateItemChargeAssgnt', '', false, false)]
    local procedure OnBeforeUpdateItemChargeAssgnt(var SalesLine: Record "Sales Line"; var InHandled: Boolean)
    var
        LJAItemChargeAssgntMgt: Codeunit "LJA Item Charge Assgnt. Mgt.";
    begin
        LJAItemChargeAssgntMgt.DoLogic(SalesLine, InHandled);
    end;
}
