pageextension 80012 "CUK Purchase Order Subform" extends "Purchase Order Subform"
{
    actions
    {
        addlast("&Line")
        {
            action(CUKShowProfilesPopulateSampleData)
            {
                ApplicationArea = All;
                Caption = 'Profiles - Init';
                Image = Insert;
                ToolTip = 'Populate sample data';
                trigger OnAction()
                var
                    CUKProfileMgt: codeunit "CUK Profile Mgt.";
                begin
                    CUKProfileMgt.PopulateSampleData(Enum::"CUK Profile Document Type"::"Purchase Order", Rec."Document No.", Rec."Line No.");
                end;
            }

            action(CUKShowProfiles)
            {
                ApplicationArea = All;
                Caption = 'Profiles';
                Image = Setup;
                ToolTip = 'Shows sales line profiles';
                trigger OnAction()
                var
                    CUKProfileMgt: codeunit "CUK Profile Mgt.";
                begin
                    CUKProfileMgt.ShowProfilesPage(Enum::"CUK Profile Document Type"::"Purchase Order", Rec."Document No.", Rec."Line No.");
                end;
            }
        }
    }
}
