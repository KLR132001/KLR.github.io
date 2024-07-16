codeunit 50193 bankaccountledgerentry
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", OnPostBankAccOnBeforeBankAccLedgEntryInsert, '', false, false)]
    local procedure "Gen. Jnl.-Post Line_OnPostBankAccOnBeforeBankAccLedgEntryInsert"(var BankAccountLedgerEntry: Record "Bank Account Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line"; BankAccount: Record "Bank Account"; var TempGLEntryBuf: Record "G/L Entry" temporary; var NextTransactionNo: Integer; GLRegister: Record "G/L Register")
    begin
        BankAccountLedgerEntry.Amount := (-GenJournalLine.Amount);
    end;
    
    var
        myInt: Integer;
}