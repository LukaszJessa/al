
codeunit 50003 "ITI Create Vehicle Jnl. Line"
{
    internal procedure CreateVehicleJnlLine(var ITITransportOrderLine: Record "ITI Transport Order Line"; HideDialog: Boolean)
    var
        IsHandled: Boolean;
    begin
        if not ConfirmCreateVehicleJnlLine(ITITransportOrderLine, HideDialog) then exit;
        OnBeforeCreateVehicleJnlLine(ITITransportOrderLine, IsHandled);
        DoCreateVehicleJnlLine(ITITransportOrderLine, IsHandled);
        OnAfterCreateVehicleJnlLine(ITITransportOrderLine);
        AcknowledgeCreateVehicleJnlLine(ITITransportOrderLine, HideDialog)
    end;

    local procedure DoCreateVehicleJnlLine(var ITITransportOrderLine: Record "ITI Transport Order Line"; IsHandled: Boolean);
    begin
        if IsHandled then
            exit;

        CheckTransportOrderLine(ITITransportOrderLine);
        CreateVehicleJnlLine(ITITransportOrderLine);
    end;

    local procedure ConfirmCreateVehicleJnlLine(var ITITransportOrderLine: Record "ITI Transport Order Line"; HideDialog: Boolean): Boolean
    var
        ConfirmManagement: Codeunit "Confirm Management";
        ConfirmQst: Label 'Are You Sure?';
        DefaultAnswer: Boolean;
    begin
        DefaultAnswer := true;

        if HideDialog then exit(DefaultAnswer);
        exit(ConfirmManagement.GetResponseOrDefault(ConfirmQst, DefaultAnswer));
    end;

    local procedure AcknowledgeCreateVehicleJnlLine(var ITITransportOrderLine: Record "ITI Transport Order Line"; HideDialog: Boolean)
    var
        AcknowledgeMsg: Label 'You successfully executed "FullMethodName"';
    begin
        if not GuiAllowed or HideDialog then exit;
        Message(AcknowledgeMsg);
    end;

    local procedure CheckTransportOrderLine(var ITITransportOrderLine: Record "ITI Transport Order Line")
    begin
        ;
    end;

    local procedure CreateVehicleJnlLine(var ITITransportOrderLine: Record "ITI Transport Order Line")
    var
        ITIVehicleJournalLine: Record "ITI Vehicle Journal Line";
    begin
        ITIVehicleJournalLine.Init();
        ITIVehicleJournalLine.Validate("Vehicle No.", ITITransportOrderLine."Vehicle No.");
        ITIVehicleJournalLine.Validate("Vehicle Activity Type", ITIVehicleJournalLine."Vehicle Activity Type"::Load);
        ITIVehicleJournalLine.Insert(true);
    end;


    [IntegrationEvent(false, false)]
    local procedure OnBeforeCreateVehicleJnlLine(var ITITransportOrderLine: Record "ITI Transport Order Line"; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCreateVehicleJnlLine(var ITITransportOrderLine: Record "ITI Transport Order Line");
    begin
    end;
}

