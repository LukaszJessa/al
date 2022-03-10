codeunit 80028 "LJA Long Run. Auto Inc. Mgt."
{
    var
        ProcessingFinishedWithNoOfSQLStatementsMsg: Label 'Processing finished. Number of SQL Statements = %1', Comment = '%1 - Number of SQL statements';
        EntryNoMsg: Label 'Entry No. is %1.', Comment = '%1 - Entry No.';

    #region Bulk insert
    procedure GenerateEntriesWithAutoIncrement(NumberOfEntries: Integer)
    var
        i: Integer;
        SQLStatementsNoBefore: BigInteger;
        SQLStatementsNoAfter: BigInteger;
    begin
        DeleteAllEntries();
        SQLStatementsNoBefore := SessionInformation.SqlStatementsExecuted;
        for i := 1 to NumberOfEntries do
            CreateEntry();
        SQLStatementsNoAfter := SessionInformation.SqlStatementsExecuted;
        ShowEndOfProcessingMessage(SQLStatementsNoAfter - SQLStatementsNoBefore);
    end;
    #endregion 

    local procedure CreateEntry()
    var
        LJALongRunningAutoInc: Record "LJA Long Running Auto Inc.";
    begin
        Randomize();
        LJALongRunningAutoInc.Init();
        LJALongRunningAutoInc."Entry No." := 0;
        LJALongRunningAutoInc."Random Text" := StrSubstNo(EntryNoMsg, LJALongRunningAutoInc."Entry No.");
        LJALongRunningAutoInc."Random Integer" := Random(100000);
        LJALongRunningAutoInc.Insert(true);
    end;

    local procedure DeleteAllEntries()
    var
        LJALongRunningAutoInc: Record "LJA Long Running Auto Inc.";
    begin
        LJALongRunningAutoInc.DeleteAll();
    end;

    local procedure ShowEndOfProcessingMessage(NoOfSQLStatements: BigInteger)
    begin
        Message(ProcessingFinishedWithNoOfSQLStatementsMsg, NoOfSQLStatements);
    end;
}
