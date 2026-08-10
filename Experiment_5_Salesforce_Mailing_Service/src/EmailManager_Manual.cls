public class EmailManager {
    public static void sendMail() {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        mail.setToAddresses(new String[] {'YOUR_EMAIL_ADDRESS'});
        mail.setSubject('Salesforce Apex Test');
        mail.setPlainTextBody('Hello! This email was sent using Apex.');

        Messaging.SendEmailResult[] results =
            Messaging.sendEmail(
                new Messaging.SingleEmailMessage[] {mail}
            );

        System.debug('SEND RESULT: ' + results[0].isSuccess());

        if (!results[0].isSuccess()) {
            for (Messaging.SendEmailError err : results[0].getErrors()) {
                System.debug('EMAIL ERROR: ' + err.getMessage());
            }
        }
    }
}