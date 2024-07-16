codeunit 50908 MyCodeunit
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnAfterReleasePurchaseDoc', '', false, false)]
    local procedure "Release Purchase Document_OnAfterReleasePurchaseDoc"(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; var LinesWereModified: Boolean; SkipWhseRequestOperations: Boolean)
    begin
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Quote then
            sentemail(PurchaseHeader);
    end;

    local procedure sentemail(var purchaseheader: Record "Purchase Header")
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
        text: Label 'This is to notify you that Purchase Quote has been approved by final approver now you can proceed with next step.';
    begin
        Clear(Sourcingexecutive);
        rfq.Reset();
        rfq.SetRange("Opportunity No.", purchaseheader."Opportunity No.");
        if rfq.FindFirst() then begin
            Sourcingexecutive := rfq."Sourcing Excecutive";
        end;

        op := purchaseheader."Opportunity No." + ',' + purchaseheader."No.";

        op2 := hello + ' ' + Sourcingexecutive + ',       ' + '                                                                                      ' +
      '                                                                                                                                                                                                                                                                                        '

      + text;
        TheMessage.Create('riddhish.barot@dhyey.com', op, op2);
        Email.Send(TheMessage);
    end;


   
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Wrk Response Handling-cs", 'OnAfterReleaseFreightDocument', '', false, false)]
    local procedure "Wrk Response Handling-cs_OnAfterReleaseFreightDocument"(var FreightHeader: Record "Freight Sheet Header")
    begin
        fright(FreightHeader);
    end;


    local procedure fright(frightheader: Record "Freight Sheet Header")
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
        text: Label 'This is to notify you that Freight Sheet has been approved by final approver now you can proceed with next step.';
    begin
        Clear(Sourcingexecutive);
        rfq.Reset();
        rfq.SetRange("Opportunity No.", frightheader."Reference No.");
        if rfq.FindFirst() then begin
            Sourcingexecutive := rfq."Sourcing Excecutive";
        end;

        op := frightheader."Reference No." + ',' + frightheader."No.";

        op2 := hello + ' ' + Sourcingexecutive + ',       ' + '                                                                                      ' +
      '                                                                                                                                                                                                                                                                                        '

      + text;
        TheMessage.Create('riddhish.barot@dhyey.com', op, op2);
        Email.Send(TheMessage);
    end;




    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', false, false)]
    local procedure "Workflow Response Handling_OnReleaseDocument"(RecRef: RecordRef; var Handled: Boolean)
    var
        costheader: Record "Cost Sheet Header";
    begin
       
        case RecRef.Number of
            DATABASE::"Cost Sheet Header":
                begin
                    RecRef.SetTable(costheader);
                    costsheet1(costheader);
                end;
        end;
    end;

    local procedure costsheet1(var costheader: Record "Cost Sheet Header")
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
        text: Label 'This is to notify you that Cost sheet has been approved by final approver now you can proceed with next step.';
    begin
        Clear(Sourcingexecutive);
        rfq.Reset();
        rfq.SetRange("Opportunity No.", costheader."Opportunity No.");
        if rfq.FindFirst() then begin
            Sourcingexecutive := rfq."Sourcing Excecutive";
        end;

        op := costheader."Opportunity No." + ',' + costheader."No.";

        op2 := hello + ' ' + Sourcingexecutive + ',       ' + '                                                                                      ' +
      '                                                                                                                                                                                                                                                                                        '

      + text;
        TheMessage.Create('riddhish.barot@dhyey.com', op, op2);
        Email.Send(TheMessage);

    end;

}