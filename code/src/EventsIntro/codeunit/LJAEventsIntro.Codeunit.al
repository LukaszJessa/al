codeunit 80000 "LJA Events Intro"
{
    procedure Action()
    begin
        OnBeforeAction();
        ActualActionLogic();
        OnAfterAction();
    end;

    var
        GlobalVar: Boolean;

    local procedure ActualActionLogic()
    begin
        Message('BaseLogic()');
        if not GlobalVar then
            GlobalVar := true;
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeAction()
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterAction()
    begin
    end;
}
