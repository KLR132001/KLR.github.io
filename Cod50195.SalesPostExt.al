codeunit 50195 "Sales-Post (Ext)" //pass custom field from sales line to gl entry
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnBeforeInsertGlobalGLEntry, '', false, false)]
    local procedure "Gen. Jnl.-Post Line_OnBeforeInsertGlobalGLEntry"(var GlobalGLEntry: Record "G/L Entry"; GenJournalLine: Record "Gen. Journal Line"; GLRegister: Record "G/L Register")
    begin
        GlobalGLEntry.value := GenJournalLine.value;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostInvPostBuffer, '', false, false)]
    local procedure "Sales-Post_OnBeforePostInvPostBuffer"(var GenJnlLine: Record "Gen. Journal Line"; var InvoicePostBuffer: Record "Invoice Post. Buffer" temporary; var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PreviewMode: Boolean)
    begin
        GenJnlLine.value := InvoicePostBuffer.value;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterFillInvoicePostBuffer, '', false, false)]
    local procedure "Sales-Post_OnAfterFillInvoicePostBuffer"(var InvoicePostBuffer: Record "Invoice Post. Buffer" temporary; SalesLine: Record "Sales Line"; var TempInvoicePostBuffer: Record "Invoice Post. Buffer" temporary; CommitIsSuppressed: Boolean)
    begin
        InvoicePostBuffer.value := SalesLine.value;
    end;
    
} //rb