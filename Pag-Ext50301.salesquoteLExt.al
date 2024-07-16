
pageextension 50301 salesquoteLExt extends "Sales Quote"
{
    actions
    {
        modify(Release)
        {
            trigger OnAfterAction()
            var
                myInt: Integer;
                TheMessage: Codeunit "Email Message";
                Email: Codeunit Email;
                purchase_header: Record "Purchase Header";
                rfq: Record "D01 RFQ";
                Sourcingexecutive: Text;
                op: Text;
                op2: Text;
                se: Text;
                hello: Label 'Hello Sourcing Executive';
                text: Label 'This is to notify you that Sales Quote has been approved by final approver now you can proceed with next step.';
            begin
                Clear(Sourcingexecutive);
                rfq.Reset();
                rfq.SetRange("Opportunity No.", Rec."Opportunity No.");
                if rfq.FindFirst() then begin
                    Sourcingexecutive := rfq."Sourcing Excecutive";
                end;

                op := rec."Opportunity No." + ',' + Rec."No.";

                op2 := hello + ' ' + Sourcingexecutive + ',       ' + '                                                                                      ' +
              '                                                                                                                                                                                                                                                                                        '

              + text;
                TheMessage.Create('riddhish.barot@dhyey.com', op, op2);
                Email.Send(TheMessage);
            end;

        }


    }

}