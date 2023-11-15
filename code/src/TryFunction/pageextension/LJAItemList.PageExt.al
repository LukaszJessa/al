/// <summary>
/// PageExtension LJA Customer List (ID 80093) extends Record Customer List.
/// </summary>
pageextension 80093 "LJA Item List" extends "Item List"
{
    actions
    {
        addfirst(Availability)
        {
            action(LJARunImportTryFunction)
            {
                ApplicationArea = All;
                Caption = 'Update Item Description [TryFunction]';
                ToolTip = 'Executes the LJARunImport action.';
                Image = Import;
                trigger OnAction()
                var
                    ImportMgt: Codeunit "Import Mgt.";
                begin
                    if ImportMgt.UpdateItemDescriptions() then
                        Message('Import finished successfully.')
                    else
                        Message('Import failed...');
                end;
            }

            action(LJARunImportOnRun)
            {
                ApplicationArea = All;
                Caption = 'Update Item Description [OnRun]';
                ToolTip = 'Executes the LJARunImport action.';
                Image = Import;
                trigger OnAction()
                var
                    ImportMgt: Codeunit "Import Mgt.";
                begin
                    if ImportMgt.Run() then
                        Message('Import finished successfully.')
                    else
                        Message('Import failed...');
                end;
            }

            action(LJAClearDescription)
            {
                ApplicationArea = All;
                Caption = 'Clear Item Description';
                ToolTip = 'Clear Item Description.';
                Image = ClearFilter;
                trigger OnAction()
                var
                    Item: Record Item;
                begin
                    Item.ModifyAll("Description 2", '');
                end;
            }
        }

        addafter(AdjustInventory_Promoted)
        {
            actionref(LJARunImportTryFunctionRef; LJARunImportTryFunction) { }
            actionref(LJARunImportOnRunRef; LJARunImportOnRun) { }
            actionref(LJAClearDescriptionRef; LJAClearDescription) { }
        }
    }
}
