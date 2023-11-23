//TODO Subscriber to copy Profiles when post Purchase Invoice.
//TODO Remove profiles when related SO/PO lines are deleted. 
//TODO Purchase order confirmation printout layout.
//TODO Fact box on SO and PO. 

/// <summary>
/// Codeunit CUK Profile Mgt. (ID 80022).
/// </summary>
codeunit 80022 "CUK Profile Mgt."
{

    /// <summary>
    /// PopulateSampleData.
    /// </summary>
    /// <param name="CUKProfileDocumentType">Enum "CUK Profile Document Type".</param>
    /// <param name="DocumentNo">Code[20].</param>
    /// <param name="LineNo">Integer.</param>
    procedure PopulateSampleData(CUKProfileDocumentType: Enum "CUK Profile Document Type"; DocumentNo: Code[20]; LineNo: Integer)
    var
        Counter: Integer;
    begin
        for Counter := 1 to Random(10) do
            CreateProfileEntry(CUKProfileDocumentType, DocumentNo, LineNo, StrSubstNo('OptionCode%1', Counter), StrSubstNo('OptionValueTxt%1', Counter));
    end;
    /// <summary>
    /// ShowProfilesPage.
    /// </summary>
    /// <param name="CUKProfileDocumentType">Enum "CUK Profile Document Type".</param>
    /// <param name="DocumentNo">Code[20].</param>
    /// <param name="LineNo">Integer.</param>
    procedure ShowProfilesPage(CUKProfileDocumentType: Enum "CUK Profile Document Type"; DocumentNo: Code[20]; LineNo: Integer)
    var
        CUKProfile: Record "CUK Profile";
    begin
        CUKProfile.SetRange("Profile Document Type", CUKProfileDocumentType);
        CUKProfile.SetRange("Document No.", DocumentNo);
        CUKProfile.SetRange("Line No.", LineNo);
        Page.RunModal(Page::"CUK Profiles", CUKProfile);
    end;

    local procedure CopyProfiles(var FromSalesLine: Record "Sales Line"; var ToPurchaseLine: Record "Purchase Line")
    var
        CUKProfile: Record "CUK Profile";
    begin
        CUKProfile.SetRange("Profile Document Type", CUKProfile."Profile Document Type"::"Sales Order");
        CUKProfile.SetRange("Document No.", FromSalesLine."Document No.");
        CUKProfile.SetRange("Line No.", FromSalesLine."Line No.");
        if CUKProfile.FindSet() then
            repeat
                CreateProfileEntry(Enum::"CUK Profile Document Type"::"Purchase Order", ToPurchaseLine."Document No.", ToPurchaseLine."Line No.", CUKProfile."Option Code", CUKProfile."Option Value");
            until CUKProfile.Next() = 0;
    end;

    local procedure CreateProfileEntry(CUKProfileDocumentType: Enum "CUK Profile Document Type"; DocumentNo: Code[20]; LineNo: Integer; OptionCode: Code[50]; OptionValue: Text[50])
    var
        CUKProfile: Record "CUK Profile";
    begin
        CUKProfile.Init();
        CUKProfile."Profile Document Type" := CUKProfileDocumentType;
        CUKProfile."Document No." := DocumentNo;
        CUKProfile."Line No." := LineNo;
        CUKProfile."Option Code" := OptionCode;
        CUKProfile."Option Value" := OptionValue;
        CUKProfile.Insert();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Get Drop Shpt.", OnAfterSalesLineModify, '', true, true)]
    local procedure PurchGetDropShpt_OnAfterSalesLineModify(var SalesLine: Record "Sales Line"; var PurchaseLine: Record "Purchase Line")
    begin
        CopyProfiles(SalesLine, PurchaseLine);
    end;
}
