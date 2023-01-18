
codeunit 50001 "ITI Vehicle Journal Post"
{
    internal procedure Post(var ITIVehicleJournalLine: Record "ITI Vehicle Journal Line"; HideDialog: Boolean)
    var
        IsHandled: Boolean;
    begin
        if not ConfirmPost(ITIVehicleJournalLine, HideDialog) then exit;
        OnBeforePost(ITIVehicleJournalLine, IsHandled);
        DoPost(ITIVehicleJournalLine, IsHandled);
        OnAfterPost(ITIVehicleJournalLine);
        AcknowledgePost(ITIVehicleJournalLine, HideDialog)
    end;

    local procedure DoPost(var ITIVehicleJournalLine: Record "ITI Vehicle Journal Line"; IsHandled: Boolean);
    begin
        if IsHandled then
            exit;
    end;

    local procedure ConfirmPost(var ITIVehicleJournalLine: Record "ITI Vehicle Journal Line"; HideDialog: Boolean): Boolean
    var
        ConfirmManagement: Codeunit "Confirm Management";
        ConfirmQst: Label 'Are You Sure?';
        DefaultAnswer: Boolean;
    begin
        DefaultAnswer := true;

        if HideDialog then exit(DefaultAnswer);
        exit(ConfirmManagement.GetResponseOrDefault(ConfirmQst, DefaultAnswer));
    end;

    local procedure AcknowledgePost(var ITIVehicleJournalLine: Record "ITI Vehicle Journal Line"; HideDialog: Boolean)
    var
        AcknowledgeMsg: Label 'You successfully executed "FullMethodName"';
    begin
        if not GuiAllowed or HideDialog then exit;
        Message(AcknowledgeMsg);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePost(var ITIVehicleJournalLine: Record "ITI Vehicle Journal Line"; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterPost(var ITIVehicleJournalLine: Record "ITI Vehicle Journal Line");
    begin
    end;
}
