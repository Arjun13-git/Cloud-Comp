public class ASRTechAccountManager {

    // CREATE
    public static Id createASRTech() {
        Account asrTech = new Account(
            Name = 'ASR Tech',
            Industry = 'Technology',
            Phone = '+91 9876543210',
            Website = 'https://www.asrtech.example',
            BillingCity = 'Mangaluru',
            BillingCountry = 'India',
            Description = 'Technology company created for Apex laboratory experiment.'
        );

        insert asrTech;

        System.debug('ASR Tech Account Created');
        System.debug('Account ID: ' + asrTech.Id);

        return asrTech.Id;
    }

    // READ
    public static Account getASRTech(Id accountId) {
        Account asrTech = [
            SELECT Id, Name, Industry, Phone, Website,
                   BillingCity, BillingCountry, Description
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];

        System.debug('ASR Tech Account Details:');
        System.debug(asrTech);

        return asrTech;
    }

    // UPDATE
    public static void updateASRTech(Id accountId) {
        Account asrTech = [
            SELECT Id, Name, Industry, Phone, Description
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];

        asrTech.Phone = '+91 8765432109';
        asrTech.Industry = 'Software Technology';
        asrTech.Description =
            'ASR Tech account updated using Apex DML operations.';

        update asrTech;

        System.debug('ASR Tech Account Updated');
    }

    // DELETE
    public static void deleteASRTech(Id accountId) {
        Account asrTech = [
            SELECT Id, Name
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];

        delete asrTech;

        System.debug('ASR Tech Account Deleted');
    }
}