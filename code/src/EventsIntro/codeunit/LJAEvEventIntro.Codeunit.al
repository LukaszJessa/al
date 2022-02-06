codeunit 80001 "LJA Ev. Event Intro"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"LJA Events Intro", 'OnAfterDoLogic', '', false, false)]
    local procedure OnAfterAction()
    var
        LJAEventsIntroMgt: Codeunit "LJA Events Intro Mgt.";
    begin
        LJAEventsIntroMgt.ExtraLogic();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"LJA Events Intro", 'OnBeforeDoLogic', '', false, false)]
    local procedure OnBeforeAction(sender: Codeunit "LJA Events Intro")
    var
        LJAEventsIntroMgt: Codeunit "LJA Events Intro Mgt.";
    begin
        LJAEventsIntroMgt.ExtraLogic();
    end;
}
