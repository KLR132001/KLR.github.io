codeunit 50139 valueentry
{
    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", OnAfterCopyItemJnlLineFromPurchLine, '', false, false)]
    local procedure "Item Journal Line_OnAfterCopyItemJnlLineFromPurchLine"(var ItemJnlLine: Record "Item Journal Line"; PurchLine: Record "Purchase Line")
    begin
        ItemJnlLine.Quantity := (-PurchLine.Quantity);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnAfterInitValueEntry, '', false, false)]
    local procedure "Item Jnl.-Post Line_OnAfterInitValueEntry"(var ValueEntry: Record "Value Entry"; var ItemJournalLine: Record "Item Journal Line"; var ValueEntryNo: Integer; var ItemLedgEntry: Record "Item Ledger Entry")
    begin
        ValueEntry.test := (-ItemJournalLine.Quantity);
    end;

    var
        myInt: Integer;
}
// rb to pass quantity from sales and purchase in value entry in negative