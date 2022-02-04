codeunit 80001 "ALJ Ev. Event Intro"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"ALJ Events Intro", 'OnBeforeAction', '', false, false)]
    local procedure OnBeforeAction(sender: Codeunit "ALJ Events Intro")
    var
        ALJEventsIntroMgt: Codeunit "ALJ Events Intro Mgt.";
    begin
        ALJEventsIntroMgt.ExtraLogic();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"ALJ Events Intro", 'OnAfterAction', '', false, false)]
    local procedure OnAfterAction()
    var
        ALJEventsIntroMgt: Codeunit "ALJ Events Intro Mgt.";
    begin
        ALJEventsIntroMgt.ExtraLogic();
    end;
}
