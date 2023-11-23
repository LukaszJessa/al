pageextension 80011 "CUK Sales Order Subform" extends "Sales Order Subform"
{
    actions
    {
        addlast("&Line")
        {
            action(CUKShowProfiles)
            {
                ApplicationArea = All;
                Caption = 'Profiles';
                ToolTip = 'Shows sales line profiles';
                trigger OnAction()
                var
                    CUKProfileMgt: codeunit "CUK Profile Mgt.";
                begin
                    CUKProfileMgt.ShowProfilesPage(Enum::"CUK Profile Document Type"::"Sales Order", Rec."Document No.", Rec."Line No.");
                end;
            }
        }
    }
}
