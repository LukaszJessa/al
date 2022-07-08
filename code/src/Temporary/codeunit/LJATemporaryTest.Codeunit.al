codeunit 80029 "LJA Temporary Test"
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterValidateEvent', 'Order Date', false, false)]
    local procedure PurchaseHeaderOnAfterValidateEventOrderDate(var xRec: Record "Purchase Header"; var Rec: Record "Purchase Header")
    begin
        //if Rec.IsTemporary then
        //exit;
        if xRec."Order Date" <> Rec."Order Date" then begin
            Rec."Vendor Order No." := 'TemporaryTest';
            Rec.Modify();
        end;
    end;

    procedure TriggerTemporaryTest()
    var
        TempPurchaseHeader: Record "Purchase Header" temporary;
        PurchaseHeader: Record "Purchase Header";
    begin
        if PurchaseHeader.FindFirst() then begin
            TempPurchaseHeader := PurchaseHeader;
            TempPurchaseHeader.Insert();
            TempPurchaseHeader.Validate("Order Date", Today);
            Message(TempPurchaseHeader."No.");
        end;
    end;
}
