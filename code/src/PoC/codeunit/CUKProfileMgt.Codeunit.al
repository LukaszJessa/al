codeunit 80022 "CUK Profile Mgt."
{
    procedure ShowProfilesPage(CUKProfileDocumentType: Enum "CUK Profile Document Type"; DocumentNo: Code[20]; LineNo: Integer)
    var
        CUKProfile: Record "CUK Profile";
    begin
        CUKProfile.SetRange("Profile Document Type", CUKProfileDocumentType);
        CUKProfile.SetRange("Document No.", DocumentNo);
        CUKProfile.SetRange("Line No.", LineNo);
        Page.RunModal(Page::"CUK Profiles", CUKProfile);
    end;

    internal procedure PopulateSampleData(CUKProfileDocumentType: Enum "CUK Profile Document Type"; DocumentNo: Code[20]; LineNo: Integer)
    var
        CUKProfile: Record "CUK Profile";
        Counter: Integer;
    begin
        for Counter := 1 to Random(10) do begin
            Clear(CUKProfile);
            CUKProfile.Init();
            CUKProfile."Profile Document Type" := CUKProfileDocumentType;
            CUKProfile."Document No." := DocumentNo;
            CUKProfile."Line No." := LineNo;
            CUKProfile."Option Code" := StrSubstNo('Option%1', Counter);
            CUKProfile."Option Value" := StrSubstNo('Option%1 Value', Counter);
            CUKProfile.Insert();
        end;
    end;
}
