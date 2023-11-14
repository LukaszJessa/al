pageextension 80006 "LJA Purchase Header" extends "Purchase Order"
{
    actions
    {
        addfirst("F&unctions")
        {
            action(TemporaryTest)
            {
                ApplicationArea = All;
                ToolTip = 'Temporary Test';

                trigger OnAction()
                var
                    LJATemporaryTest: Codeunit "LJA Temporary Test";
                begin
                    LJATemporaryTest.TriggerTemporaryTest();
                end;
            }
        }
    }
}
