
codeunit 50145 "client Doc. Attach" //count on Document Attachment Factbox of client
{
    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure OnBeforeDrillDown1(DocumentAttachment: Record "Document Attachment";
        var RecRef: RecordRef);
    var
        client: Record Client;// table name
    begin
        if DocumentAttachment."Table ID" = 50110 then begin // table id of the table
            RecRef.Open(DATABASE::Client);// table name
            client.Reset();
            client.SetRange("Client No", DocumentAttachment."No."); //table field name(pk)
            if client.FindFirst() then begin
                RecRef.GetTable(client);
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]// specific document no
    procedure OnAfterInitFieldsFromRecRef1(var DocumentAttachment: Record "Document Attachment";
     var RecRef: RecordRef);
    var
        client: Record Client;// change table name
        FieldRef: FieldRef;
        RecNo: Text[50];
        FieldRef1: FieldRef;
        RecNo1: Integer;
    begin
        case RecRef.Number of
            Database::Client:// change table name
                begin
                    FieldRef := RecRef.Field(1);// field  no
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure OnAfterOpenForRecRef1(var DocumentAttachment: Record "Document Attachment";
    var RecRef: RecordRef;
    var FlowFieldsEditable: Boolean);
    var
        FieldRef: FieldRef;
        RecNo: Text[50];
        FieldRef1: FieldRef;
        RecNo1: Integer;
    begin
        case RecRef.Number of
            DATABASE::Client://table name 
                begin
                    FieldRef := RecRef.Field(1);// field no as per the table
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                    FlowFieldsEditable := false;
                end;
        end;
    end;
}