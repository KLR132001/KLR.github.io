pageextension 50310 salorder extends "Sales Order"//sent mail form sales order with attachments and standard purchase report
{
    actions
    {
        addafter("&Print")
        {
            action("Send Email")
            {
                ApplicationArea = All;
                Caption = 'Send Email Test';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Email;

                trigger OnAction()
                var
                    DocumentAttachment: Record "Document Attachment";
                    TempBlob: Codeunit "Temp Blob";
                    EmailMessage: Codeunit "Email Message";
                    Email: Codeunit Email;
                    FullFileName: Text;
                    CustomerRec: Record Customer;
                    CustomerEmailList: List of [Text];
                    EmailSubject: Text;
                    CustomerName: Text;
                    EmailBody: Text;
                    CheckValue: Text;
                    CC: List of [Text];
                    BCC: List of [Text];
                    Hello: Label 'Hi';
                    Text: Label 'We have sent a Sales Order via E-mail to You. Kindly Check and Confirm.';
                    SalesConfirmationReport: Report "Standard Sales - Order Conf.";
                    OutStream: OutStream;
                    InStream: InStream;
                    SalesHeader: Record "Sales Header";
                    EmailAddresses: List of [Text];
                    EmailAddress: Text;
                begin
                    CustomerRec.Reset();
                    CustomerRec.SetRange("No.", Rec."Sell-to Customer No.");
                    if CustomerRec.FindFirst() then begin
                        EmailAddresses := CustomerRec."E-Mail".Split(';');//one email sent to multiple ids //spliting email address
                        foreach EmailAddress in EmailAddresses do begin //foreach loop excecutes as per the email add
                            CustomerEmailList.Add(LowerCase((EmailAddress)));//converts the emailadd in lowercase
                        end;
                    end;


                    Clear(CustomerName);
                    CustomerRec.Reset();
                    CustomerRec.SetRange("No.", Rec."Sell-to Customer No.");
                    if CustomerRec.FindFirst() then begin
                        CustomerName := CustomerRec.Name;
                    end;

                    if CustomerEmailList.Count() > 0 then begin //checking no of elements
                        EmailSubject := Hello;
                        EmailBody := Hello + ' ' + CustomerName + ',' + '</br></br>' + Text;

                        EmailMessage.Create(CustomerEmailList, EmailSubject, EmailBody, true, CC, BCC);


                        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
                        SalesHeader.SetRange("No.", Rec."No.");
                        SalesHeader.SetRange("Bill-to Customer No.", Rec."Bill-to Customer No.");
                        SalesConfirmationReport.SetTableView(SalesHeader);


                        TempBlob.CreateOutStream(OutStream);//the report generation and adding it as an attachment
                        SalesConfirmationReport.SaveAs('SalesConfirmation_', ReportFormat::Pdf, OutStream);

                        TempBlob.CreateInStream(InStream);
                        FullFileName := 'SalesConfirmation_' + Rec."No." + '.pdf';
                        EmailMessage.AddAttachment(FullFileName, 'PDF', InStream);

                        // aTTach  documents if 
                        DocumentAttachment.Reset();
                        DocumentAttachment.SetRange("No.", Rec."No.");
                        if DocumentAttachment.FindSet() then begin
                            repeat
                                if DocumentAttachment."Document Reference ID".HasValue then begin
                                    TempBlob.CreateOutStream(OutStream);
                                    TempBlob.CreateInStream(InStream);
                                    FullFileName := DocumentAttachment."File Name" + '.' + DocumentAttachment."File Extension";
                                    if DocumentAttachment."Document Reference ID".ExportStream(OutStream) then begin
                                        EmailMessage.AddAttachment(FullFileName, 'PDF', InStream);
                                    end;
                                end;
                            until DocumentAttachment.Next() = 0;
                        end;


                        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);// $end is use to repond the mail
                        Message('Email has been sent.');
                    end else begin
                        Message('Sorry, no email addresses are defined!');
                    end;
                end;
            }
        }
    }
}