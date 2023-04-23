codeunit 80030 "LJA Custom Reference Mgt."
{
    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', false, false)]
    local procedure GenJournalLineOnAfterCopyGenJnlLineFromSalesHeader(var GenJournalLine: Record "Gen. Journal Line"; SalesHeader: Record "Sales Header")
    begin
        GenJournalLine.Validate("Custom Reference", SalesHeader."Custom Reference");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', false, false)]
    local procedure CustLedgerEntryOnAfterCopyCustLedgerEntryFromGenJnlLine(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        CustLedgerEntry.Validate("Custom Reference", GenJournalLine."Custom Reference");
    end;
}
