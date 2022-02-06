codeunit 80003 "LJA Ev. Customer"
{
    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterValidateEvent', 'Address', false, false)]
    local procedure OnAfterValidateEventAddress(var xRec: Record Customer; var Rec: Record Customer)
    var
        LJASalesMgt: Codeunit "LJA Sales Mgt.";
    begin
        LJASalesMgt.ValidateCustomer(Rec);
    end;
}
