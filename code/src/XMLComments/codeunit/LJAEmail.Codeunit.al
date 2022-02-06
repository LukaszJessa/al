/// <summary>
/// Provides functionality to create and send e-mails.
/// </summary>
codeunit 80013 "LJA Email"
{
    /// <summary>
    /// Enqueues an email in the outbox to be sent in the background.
    /// </summary>
    /// <param name="EmailMessageId">The ID of the email to enqueue</param>        
    procedure Enqueue(EmailMessageId: Guid)
    begin
        Message('Enqueue()');
    end;
}
