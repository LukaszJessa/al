
codeunit 50002 "ITI Trans. Order Post"
{
    internal procedure Post(var ITITransportOrderHeader: Record "ITI Transport Order Header"; HideDialog: Boolean)
    var
        IsHandled: Boolean;
    begin
        if not ConfirmPost(ITITransportOrderHeader, HideDialog) then exit;
        OnBeforePost(ITITransportOrderHeader, IsHandled);
        DoPost(ITITransportOrderHeader, IsHandled);
        OnAfterPost(ITITransportOrderHeader);
        AcknowledgePost(ITITransportOrderHeader, HideDialog)
    end;

    local procedure DoPost(var ITITransportOrderHeader: Record "ITI Transport Order Header"; IsHandled: Boolean);
    begin
        if IsHandled then
            exit;


    end;

    local procedure ConfirmPost(var ITITransportOrderHeader: Record "ITI Transport Order Header"; HideDialog: Boolean): Boolean
    var
        ConfirmManagement: Codeunit "Confirm Management";
        ConfirmQst: Label 'Are You Sure?';
        DefaultAnswer: Boolean;
    begin
        DefaultAnswer := true;

        if HideDialog then exit(DefaultAnswer);
        exit(ConfirmManagement.GetResponseOrDefault(ConfirmQst, DefaultAnswer));
    end;

    local procedure AcknowledgePost(var ITITransportOrderHeader: Record "ITI Transport Order Header"; HideDialog: Boolean)
    var
        AcknowledgeMsg: Label 'You successfully executed "Trans. Order Post"';
    begin
        if not GuiAllowed or HideDialog then exit;
        Message(AcknowledgeMsg);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePost(var ITITransportOrderHeader: Record "ITI Transport Order Header"; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterPost(var ITITransportOrderHeader: Record "ITI Transport Order Header");
    begin
    end;
}
