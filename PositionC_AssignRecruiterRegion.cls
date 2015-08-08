trigger PositonC_AssignRecruiterRegion on Position__c ( before insert, before update)
{

  for (Position__c position : Trigger.New)
  {
<<<<<<< HEAD
    // This will use a Utilities class method to create necessary environment for test.
=======
    // This will use a Utilities class to create necessary environment for test.
>>>>>>> c3944f2431dcb79b243c92525f123ec24b0fb284
    PositionC_Utilities.assignRegion1(position);
    //PositionC_Utilities.assignRegion2(position);

  }

}
