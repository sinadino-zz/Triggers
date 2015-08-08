//Write a trigger that transfers every new contact to an Account named “Sfdc99″

trigger TransferAccount on Contact (before insert) {
    for (Contact contact : Trigger.new) {
        // this will ensure all contacts are added to their respoective parent account
        contact.AccountId = 'some parent account';
        
    }
 }