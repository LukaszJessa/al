page 80001 "LJA Long Running Data"
{
    ApplicationArea = All;
    Caption = 'LJA Long Running Data';
    PageType = List;
    SourceTable = "LJA Long Running Data";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                    ApplicationArea = All;
                }
                field("Random Decimal"; Rec."Random Integer")
                {
                    ToolTip = 'Specifies the value of the Random Decimal field.';
                    ApplicationArea = All;
                }
                field("Random Text"; Rec."Random Text")
                {
                    ToolTip = 'Specifies the value of the Random Text field.';
                    ApplicationArea = All;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                    ApplicationArea = All;
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                    ApplicationArea = All;
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                    ApplicationArea = All;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                    ApplicationArea = All;
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
            group(SequenceNumber)
            {
                Caption = 'Sequence Number';
                action(CreateOneEntry)
                {
                    ToolTip = 'Create one entry';
                    Caption = 'Create one entry';

                    trigger OnAction()
                    var
                        LJALongRunningMgt: Codeunit "LJA Long Running Mgt.";
                    begin
                        LJALongRunningMgt.GenerateEntriesWithNumberSequence(1);
                    end;
                }
                action(Create10k)
                {
                    ToolTip = 'Create 10k entries';
                    Caption = 'Create 10k entries';

                    trigger OnAction()
                    var
                        LJALongRunningMgt: Codeunit "LJA Long Running Mgt.";
                    begin
                        LJALongRunningMgt.GenerateEntriesWithNumberSequence(10000);
                    end;
                }

                action(Create1000k)
                {
                    ToolTip = 'Create 1000k entries';
                    Caption = 'Create 1000k entries';

                    trigger OnAction()
                    var
                        LJALongRunningMgt: Codeunit "LJA Long Running Mgt.";
                    begin
                        LJALongRunningMgt.GenerateEntriesWithNumberSequence(1000000);
                    end;
                }

                action(GetAllRecords)
                {
                    ToolTip = 'Get all records';

                    trigger OnAction()
                    var
                        LJALongRunningMgt: Codeunit "LJA Long Running Mgt.";
                    begin
                        LJALongRunningMgt.GetAllRecords();
                    end;
                }
                action(TextProcessingOldWay)
                {
                    ToolTip = 'Text processing - old way';
                    Caption = 'Text processing - old way';

                    trigger OnAction()
                    var
                        LJALongRunningMgt: Codeunit "LJA Long Running Mgt.";
                    begin
                        LJALongRunningMgt.ProcessTextsOldFashionedWay();
                        ;
                    end;
                }

                action(TextProcessingTextBuilder)
                {
                    ToolTip = 'Text processing - Text Builder';
                    Caption = 'Text processing - Text Builder';

                    trigger OnAction()
                    var
                        LJALongRunningMgt: Codeunit "LJA Long Running Mgt.";
                    begin
                        LJALongRunningMgt.ProcessTextsWithTextBuilders();
                    end;
                }
            }

            group(AutoIncrement)
            {
                Caption = 'Auto Increment';
                action(CreateOneEntryAutoIncrement)
                {
                    Caption = 'Create one entry';
                    ToolTip = 'Create one entry';

                    trigger OnAction()
                    var
                        LJALongRunAutoIncMgt: Codeunit "LJA Long Run. Auto Inc. Mgt.";
                    begin
                        LJALongRunAutoIncMgt.GenerateEntriesWithAutoIncrement(1);
                    end;
                }


                action(Create10kEntriesAutoIncrement)
                {
                    Caption = 'Create 10k entries';
                    ToolTip = 'Create 10k entries';

                    trigger OnAction()
                    var
                        LJALongRunAutoIncMgt: Codeunit "LJA Long Run. Auto Inc. Mgt.";
                    begin
                        LJALongRunAutoIncMgt.GenerateEntriesWithAutoIncrement(10000);
                    end;
                }
            }
        }
    }
}

