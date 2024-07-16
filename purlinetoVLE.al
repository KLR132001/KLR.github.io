codeunit 50408 SOtoVLE
{
        // [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", OnAfterCopyVendLedgerEntryFromGenJnlLine, '', false, false)]
        // local procedure "Vendor Ledger Entry_OnAfterCopyVendLedgerEntryFromGenJnlLine"(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
        // begin
        //     VendorLedgerEntry.value := GenJournalLine.value;
        // end;

        // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnBeforeInitVendLedgEntry, '', false, false)]
        // local procedure "Gen. Jnl.-Post Line_OnBeforeInitVendLedgEntry"(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
        // begin
        //     VendorLedgerEntry.value := GenJournalLine.value;
        // end;

        // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnBeforePostVendorEntry, '', false, false)]
        // local procedure "Purch.-Post_OnBeforePostVendorEntry"(var GenJnlLine: Record "Gen. Journal Line"; var PurchHeader: Record "Purchase Header"; var TotalPurchLine: Record "Purchase Line"; var TotalPurchLineLCY: Record "Purchase Line"; PreviewMode: Boolean; CommitIsSupressed: Boolean; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; var IsHandled: Boolean)
        // begin
        //      VendorLedgerEntry.value := GenJnlLine.value;
        // end;
        
        var
            myInt: Integer;
}