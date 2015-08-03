trigger PositonC_AssignRecruiterRegion on Position__c ( before insert, before update)
{

  for (Position__c position : Trigger.New)
  {
    // This will use a Utilities class to create necessary environment for test.
    PositionC_Utilities.assignRegion1(position);
    //PositionC_Utilities.assignRegion2(position);

  }

}
