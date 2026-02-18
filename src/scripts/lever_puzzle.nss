 void main()
{
    // Author: Stumble 13 Aug 2002  stumble@nznights.com


    // Event OnUsed: A lever has been used

    // Note that all levers must have a tag of the form: "LEVER_1", LEVER_2", etc

    // Put here the order in which the levers must be activated
    // Note that any order of any levers will work. For example:
    // "1234" or "1142" or "1122421" or "14" are all valid
    // ========================================================
    string sLeverSequence = "1234";
    // ========================================================

    // The door we will open when the puzzle is solved
    object oDoor = GetObjectByTag ("lever_door");

    // The object where the "last lever used" is stored
    object oLeverStatus = GetObjectByTag ("LEVER_1");

    // Get the count of the number of valid levers used so far (0 if none)
    int iLeverCount = GetLocalInt (oLeverStatus, "LEVER_COUNT");

    // Get the number of the lever being used right now
    int iThisLever = StringToInt (GetSubString (GetTag (OBJECT_SELF), 6, 1));

    // Get the number of the lever we expect to be used
    int iNextLeverExpected = StringToInt (GetSubString (sLeverSequence, iLeverCount, 1));


    // Do the lever animation stuff for the lever we just used
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);

    // See if the lever used was what we expected
    if (iThisLever == iNextLeverExpected)
    {
        // We got the lever we expected. Increment the lever count
        iLeverCount++;

        // Check if we have completed the puzzle
        if (iLeverCount >= GetStringLength (sLeverSequence))
        {
            // No more levers to use, puzzle is complete !!

            // Reset the lever count
            iLeverCount = 0;

            // Open the door !!
            AssignCommand (oDoor, ActionOpenDoor(oDoor));
            SetLocked (oDoor, FALSE);
        }
    }
    else
    {
        // The lever used was *not* what we expected. So, reset the lever count
        iLeverCount = 0;
    }
    // Store the current lever count
    SetLocalInt (oLeverStatus, "LEVER_COUNT", iLeverCount);
}
