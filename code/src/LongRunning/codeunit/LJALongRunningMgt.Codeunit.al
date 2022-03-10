codeunit 80027 "LJA Long Running Mgt."
{
    var
        NumberSequenceName: Text;
        ProcessingFinishedWithNoOfSQLStatementsMsg: Label 'Processing finished. Number of SQL Statements = %1', Comment = '%1 - Number of SQL statements';
        ProcessingFinishedWithTimeMsg: Label 'Processing finished. Processing time = %1', Comment = '%1 - Processing time';

        ProcessingFinishedMsg: Label 'Processing finished.';
        EntryNoMsg: Label 'Entry No. is %1', Comment = '%1 - Entry No.';

    #region Bulk insert
    procedure GenerateEntriesWithNumberSequence(NumberOfEntries: Integer)
    var
        i: Integer;
        SQLStatementsNoBefore: BigInteger;
        SQLStatementsNoAfter: BigInteger;
    begin
        Initialize();
        DeleteAllEntries();
        SQLStatementsNoBefore := SessionInformation.SqlStatementsExecuted;
        for i := 1 to NumberOfEntries do
            CreateEntry();

        SQLStatementsNoAfter := SessionInformation.SqlStatementsExecuted;
        ShowEndOfProcessingMessage(SQLStatementsNoAfter - SQLStatementsNoBefore);
    end;
    #endregion 

    procedure ProcessTextsOldFashionedWay()
    var
        LJALongRunningData: Record "LJA Long Running Data";
        TextVar: Text;
        DateTimeBefore: DateTime;
        DateTImeAfter: DateTime;
        Counter: Integer;
    begin
        DateTimeBefore := CurrentDateTime;
        if LJALongRunningData.FindSet() then
            repeat
                Counter += 1;
                if (Counter mod 1000) = 0 then
                    TextVar := '';
                TextVar := TextVar + LJALongRunningData."Random Text";
            until LJALongRunningData.Next() = 0;
        DateTImeAfter := CurrentDateTime;
        ShowEndOfProcessingMessage(DateTImeAfter - DateTimeBefore)

    end;

    procedure ProcessTextsWithTextBuilders()
    var
        LJALongRunningData: Record "LJA Long Running Data";
        TextVar: TextBuilder;
        DateTimeBefore: DateTime;
        DateTImeAfter: DateTime;
        Counter: Integer;
    begin
        DateTimeBefore := CurrentDateTime;
        if LJALongRunningData.FindSet() then
            repeat
                Counter += 1;
                if (Counter mod 1000) = 0 then
                    TextVar.Clear();
                TextVar.Append(LJALongRunningData."Random Text");
            until LJALongRunningData.Next() = 0;
        DateTImeAfter := CurrentDateTime;
        ShowEndOfProcessingMessage(DateTImeAfter - DateTimeBefore)
    end;

    procedure GetAllRecords()
    var
        LJALongRunningData: Record "LJA Long Running Data";
        EntryNo: Integer;
        NoOfRecords: Integer;
    begin
#pragma warning disable AA0206
        SelectLatestVersion();

        LJALongRunningData.SetFilter("Random Text", '@*2*');
        LJALongRunningData.SetFilter("Random Integer", '5000..60000');
        NoOfRecords := LJALongRunningData.Count();

        if LJALongRunningData.FindSet() then
            repeat
                EntryNo := LJALongRunningData."Entry No.";
            until LJALongRunningData.Next() = 0;
        ShowEndOfProcessingMessage();
#pragma warning restore        
    end;

    local procedure CreateEntry()
    var
        LJALongRunningData: Record "LJA Long Running Data";
    begin
        Randomize();
        LJALongRunningData.Init();
        LJALongRunningData."Entry No." := NumberSequence.Next(NumberSequenceName);
        LJALongRunningData."Random Text" := StrSubstNo(EntryNoMsg, LJALongRunningData."Entry No.");
        LJALongRunningData."Random Integer" := Random(100000);
        LJALongRunningData.Insert(true);
    end;

    local procedure DeleteAllEntries()
    var
        LJALongRunningData: Record "LJA Long Running Data";
    begin
        LJALongRunningData.DeleteAll();
    end;

    local procedure ShowEndOfProcessingMessage()
    begin
        Message(ProcessingFinishedMsg);
    end;

    local procedure ShowEndOfProcessingMessage(NoOfSQLStatements: BigInteger)
    begin
        Message(ProcessingFinishedWithNoOfSQLStatementsMsg, NoOfSQLStatements);
    end;


    local procedure ShowEndOfProcessingMessage(ProcessingTime: DateTime)
    begin
        Message(ProcessingFinishedWithNoOfSQLStatementsMsg, ProcessingTime);
    end;

    local procedure Initialize()
    begin
        NumberSequenceName := 'EntryNumberSequence';
        if not NumberSequence.Exists(NumberSequenceName) then
            NumberSequence.Insert(NumberSequenceName);
    end;
}
