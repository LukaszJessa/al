
codeunit 50001 "ITI Vehicle Register Meth"
{
    internal procedure Register(var ITIVehicleJournalLine: Record "ITI Vehicle Journal Line"; HideDialog: Boolean)
    var
        IsHandled: Boolean;
    begin
        if not ConfirmRegister(ITIVehicleJournalLine, HideDialog) then exit;
        OnBeforeRegister(ITIVehicleJournalLine, IsHandled);
        DoRegister(ITIVehicleJournalLine, IsHandled);
        OnAfterRegister(ITIVehicleJournalLine);
        AcknowledgeRegister(ITIVehicleJournalLine, HideDialog)
    end;

    local procedure DoRegister(var ITIVehicleJournalLine: Record "ITI Vehicle Journal Line"; IsHandled: Boolean);
    begin
        if IsHandled then
            exit;
    end;

    local procedure ConfirmRegister(var ITIVehicleJournalLine: Record "ITI Vehicle Journal Line"; HideDialog: Boolean): Boolean
    var
        ConfirmManagement: Codeunit "Confirm Management";
        ConfirmQst: Label 'Are You Sure?';
        DefaultAnswer: Boolean;
    begin
        DefaultAnswer := true;

        if HideDialog then exit(DefaultAnswer);
        exit(ConfirmManagement.GetResponseOrDefault(ConfirmQst, DefaultAnswer));
    end;

    local procedure AcknowledgeRegister(var ITIVehicleJournalLine: Record "ITI Vehicle Journal Line"; HideDialog: Boolean)
    var
        AcknowledgeMsg: Label 'You successfully executed "FullMethodName"';
    begin
        if not GuiAllowed or HideDialog then exit;
        Message(AcknowledgeMsg);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeRegister(var ITIVehicleJournalLine: Record "ITI Vehicle Journal Line"; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterRegister(var ITIVehicleJournalLine: Record "ITI Vehicle Journal Line");
    begin
    end;
}
