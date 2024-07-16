codeunit 50135 passquantity  
{

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", OnAfterCopyItemJnlLineFromPurchLine, '', false, false)]
    local procedure "Item Journal Line_OnAfterCopyItemJnlLineFromPurchLine"(var ItemJnlLine: Record "Item Journal Line"; PurchLine: Record "Purchase Line")
    begin
        ItemJnlLine.Quantity := (-PurchLine.Quantity);
    end;


    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", OnAfterCopyItemJnlLineFromSalesLine, '', false, false)]
    local procedure "Item Journal Line_OnAfterCopyItemJnlLineFromSalesLine"(var ItemJnlLine: Record "Item Journal Line"; SalesLine: Record "Sales Line")
    begin
        ItemJnlLine.Quantity := (-SalesLine.Quantity);
    end;
    

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnAfterInitItemLedgEntry, '', false, false)]
    local procedure "Item Jnl.-Post Line_OnAfterInitItemLedgEntry"(var NewItemLedgEntry: Record "Item Ledger Entry"; var ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer)
    begin
        NewItemLedgEntry.Quantity := (-ItemJournalLine.Quantity);
    end;

    var
        myInt: Integer;
}
// rb to pass quantity from sales and purchase in ile in negative