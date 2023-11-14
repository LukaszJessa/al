/// <summary>
/// Unknown Jessa.
/// </summary>
namespace Jessa.Playground;
using Microsoft.Inventory.Item;
/// <summary>
/// Import Mgt.
/// </summary>
codeunit 80093 "Import Mgt."
{
    #region OnRun 
    trigger OnRun()
    var
        Item: Record Item;
        Counter: Integer;
        NewDescription: Text[50];
    begin
        NewDescription := '01234567890123456789012345678901234567890123456789';
        if Item.FindSet() then
            repeat
                Counter += 1;
                Item."Description 2" := NewDescription;
                if Counter > 3 then
                    Item."Description 2" := NewDescription + NewDescription;
                Item.Modify();
            until Item.Next() = 0;
    end;
    #endregion OnRun
    /// <summary>
    /// UpdateItemDescriptions.
    /// </summary>
    [TryFunction]
    procedure UpdateItemDescriptions()
    var
        Item: Record Item;
        Counter: Integer;
        NewDescription: Text[50];
    begin
        NewDescription := '01234567890123456789012345678901234567890123456789';
        if Item.FindSet() then
            repeat
                Counter += 1;
                Item."Description 2" := NewDescription;
                if Counter > 3 then
                    Item."Description 2" := NewDescription + NewDescription;
                Item.Modify();
            until Item.Next() = 0;
    end;
}
