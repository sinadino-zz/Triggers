//Write a query that gets a Contact’s Account owner’s username 
and their best friend 
as well as all related Tasks that were created in the last 90 days 
or have both a comment that contains the words ‘nutella’ and ‘krispy kreme’ 
and the Task creator’s title is populated. 
Oh yes – all the contacts have to weigh more than 120 pounds and have a best friend whose owner’s name ends in a ‘d’.
No more than 100 records please… whew!

[SELECT Id, Account.Owner.Username, Best_Friend__c,
(
SELECT Id FROM Tasks
    WHERE CreatedDate = LAST_90_DAYS 
      OR (Description LIKE '%nutella%' 
         AND Description LIKE '%kripsy kreme%'
         AND CreatedBy.Title != null)

) 
FROM Contact
WHERE Weight__c > 120
AND Best_Friend__r.Onwer.LastName LIKE '%d'


