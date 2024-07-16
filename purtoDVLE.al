// codeunit 50634 DLE
// {

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnAfterFillInvoicePostBuffer, '', false, false)]
//     local procedure "Purch.-Post_OnAfterFillInvoicePostBuffer"(var InvoicePostBuffer: Record "Invoice Post. Buffer" temporary; PurchLine: Record "Purchase Line"; var TempInvoicePostBuffer: Record "Invoice Post. Buffer" temporary; CommitIsSupressed: Boolean; var PurchHeader: Record "Purchase Header"; var GenJnlLineDocNo: Code[20]; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line")
//     begin
//         InvoicePostBuffer.value := PurchLine.value;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostInvPostBuffer, '', false, false)]
//     local procedure "Sales-Post_OnBeforePostInvPostBuffer"(var GenJnlLine: Record "Gen. Journal Line"; var InvoicePostBuffer: Record "Invoice Post. Buffer" temporary; var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PreviewMode: Boolean)
//     begin
//         GenJnlLine.value := InvoicePostBuffer.value;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnBeforeInsertDtldVendLedgEntry, '', false, false)]
//     local procedure "Gen. Jnl.-Post Line_OnBeforeInsertDtldVendLedgEntry"(var DtldVendLedgEntry: Record "Detailed Vendor Ledg. Entry"; GenJournalLine: Record "Gen. Journal Line"; DtldCVLedgEntryBuffer: Record "Detailed CV Ledg. Entry Buffer"; GLRegister: Record "G/L Register")
//     begin
//         DtldVendLedgEntry.value := GenJournalLine.value;
//     end;

//     var
//         myInt: Integer;
// }



