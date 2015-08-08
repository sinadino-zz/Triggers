// Inspect whether Lead or contact has a duplicate

trigger DetectDupes on Lead (before insert, before update) {
  // for every lead calling the trigger do
  for (Lead l : Trigger.new) {
    // if lead has a name we will inquire
    if (l.FirstName != null && l.LastName != null) {
      List<Lead> dupeLeads = [SELECT Id FROM Lead
                               WHERE FirstName = :l.FirstName
                                 AND LastName  = :l.LastName
                                 AND Id != :l.Id];
      // if the result/match is found
      if (dupeLeads.size() > 0) {
        l.Potential_Lead_Dupe__c = dupeLeads[0].Id;
      } else {
        l.Potential_Lead_Dupe__c = null;
      }
      // similar process for contacts
      List<Contact> dupeCts = [SELECT Id FROM Contact
                                WHERE FirstName = :l.FirstName
                                  AND LastName  = :l.LastName];
      if (dupeCts.size() > 0) {
        l.Potential_Contact_Dupe__c = dupeCts[0].Id;
      } else {
        l.Potential_Contact_Dupe__c = null;
      }
    }
  }
}
