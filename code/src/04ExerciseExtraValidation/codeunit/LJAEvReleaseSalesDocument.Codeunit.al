codeunit 80019 "LJA Ev Release Sales Document"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', false, false)]
    local procedure OnBeforeReleaseSalesDoc(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var IsHandled: Boolean)
    var
        LJASalesOrderMgt: Codeunit "LJA Sales Order Mgt.";
    begin
        LJASalesOrderMgt.ValidateSalesOrderOnRelease(SalesHeader);
    end;
}
