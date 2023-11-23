codeunit 80022 "CUK Profile Mgt."
{
    procedure ShowProfilesPage(CUKProfileDocumentType: Enum "CUK Profile Document Type"; DocumentNo: Code[20]; LineNo: Integer)
    var
        CUKProfile: Record "CUK Profile";
    begin
        Page.RunModal(Page::"CUK Profiles", CUKProfile);
    end;
}
