codeunit 80000 "LJA Events Intro"
{

    var
        GlobalVar: Boolean;

    procedure DoLogic()
    begin
        OnBeforeDoLogic();
        BaseLogic();
        OnAfterDoLogic();
    end;

    local procedure BaseLogic()
    begin
        Message('BaseLogic()');
        if not GlobalVar then
            GlobalVar := true;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterDoLogic()
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeDoLogic()
    begin
    end;
}
