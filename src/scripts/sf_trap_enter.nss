 //:://////////////////////////////////////////////////
//:: Scarface's Real Respawning/Disarmable/Detectable
//::               Trap System V1.2
//::                sf_trap_enter
//:://////////////////////////////////////////////////
/*
    * Note *
    This system will ONLY work with the new 1.67 patch
    which is currently BETA but it will be officially
    released REAL soon :D

    This system will set and reset traps when a player enters an
    area that no players are currently in. does'nt use any
    laggy heartbeat scripts, just a simple OnEnter script

    Instructions:
    1) Import the erf into a 1.67 patched module

    2) Placing The Script:

       Place this script in the OnEnter event node of the
       areas that you want your traps respawning traps.

    3) This ONLY applies to Ground Traps:

       For Ground Traps you need to place a "Trap Set"
       placeable down at the location you want the Ground Trap
       to be set. The "Trap Set placeable is located in:
       Placeables >> Custom >> Special >> Custom 1

    4) Setting Variables:

       GROUND TRAPS:
       Right click on the placed "Trap Set" and select "Variables".

       DOOR & PLACEABLE TRAPS:
       Right click the door or placeable and select "Variables"

       In the variables tab you need to set the variables that
       will make the trap work. These are the variables you must
       set for the system to work properly:

       Trappable:

       Firstly this variable just confirms that this is a trap
       Name: IS_TRAP      Type: int     Value: 1 = YES : 0 = NO

       Trap type:

       This is for the type of trap that will be set
       Name: TRAP_TYPE    Type = int    Value = Between 0 - 43
       (Check the trap type numbers in the list below)

       Detectable:

       This is if you want the trap to be detectable
       Name: DETECTABLE   Type: int   Value: 1 = YES : 0 = NO

       Disarmable:

       This is if you want the trap to be disarmable
       Name: DISARMABLE   Type: int   Value: 1 = YES : 0 = NO

       Detect DC:

       Set the detect DC of the trap
       Name: DETECT_DC    Type: int   Value: between 0 - 127

       Disarm DC:

       Set the disarm DC of the trap
       Name: DISARM_DC    Type: int   Value: between 0 - 127

       Trap Size:

       Set the size of the trap
       Name: TRAP_SIZE    Type: float  Value = anything from 1.0 upwards
                                        (Must be a float i.e. have a decimal)

    Trap Type numbers:

    Minor Spike         = 0
    Average Spike       = 1
    Strong Spike        = 2
    Deadly Spike        = 3
    Minor Holy          = 4
    Average Holy        = 5
    Strong Holy         = 6
    Deadly Holy         = 7
    Minor Tangle        = 8
    Average Tangle      = 9
    Strong Tangle       = 10
    Deadly Tangle       = 11
    MinorAcid           = 12
    Average Acid        = 13
    Strong Acid         = 14
    Deadly Acid         = 15
    Minor Fire          = 16
    Average Fire        = 17
    Strong Fire         = 18
    Deadly Fire         = 19
    Minor Electrical    = 20
    Average Electrical  = 21
    Strong Electrical   = 22
    Deadly Electrical   = 23
    Minor Gas           = 24
    Average Gas         = 25
    Strong Gas          = 26
    Deadly Gas          = 27
    Minor Frost         = 28
    Average Frost       = 29
    Strong Frost        = 30
    Deadly Frost        = 31
    Minor Negative      = 32
    Average Negative    = 33
    Strong Negative     = 34
    Deadly Negative     = 35
    Minor Sonic         = 36
    Average Sonic       = 37
    Strong Sonic        = 38
    Deadly Sonic        = 39
    Minor AcidS plash   = 40
    Average Acid Splash = 41
    Strong Acid Splash  = 42
    Deadly Acid Splash  = 43
*/

// Declair Function
void ResetTrap(object oObject);
void main()
{
    // Vars
    object oPC = GetEnteringObject(),
           oObject;
    int iIsTrap;

    // Make sure its a PC entering the area
    if (!GetIsPC(oPC) && !GetIsPossessedFamiliar(oPC)) return;

    // Check if there are players already in the area
    oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,
                                    PLAYER_CHAR_IS_PC, oPC);

    if (GetIsObjectValid(oPC)) return;

    // Loop through all objects in the area
    oObject = GetFirstObjectInArea();

    while (GetIsObjectValid(oObject))
    {
        iIsTrap = GetLocalInt(oObject, "IS_TRAP");
        // Check if the object needs its trap reset
        if (iIsTrap)
        {
            // Reset the trap if needed
            ResetTrap(oObject);
        }
        oObject = GetNextObjectInArea();
    }
}
// Trap Setting Functions
void ResetTrap(object oObject)
{
    // Vars
    object oTrap;
    float fSize, fDist;
    int iTrapType = GetLocalInt(oObject, "TRAP_TYPE"),
        iTrapDetectable = GetLocalInt(oObject, "DETECTABLE"),
        iTrapDetectDC = GetLocalInt(oObject, "DETECT_DC"),
        iTrapDisarmable = GetLocalInt(oObject, "DISARMABLE"),
        iTrapDisarmDC = GetLocalInt(oObject, "DISARM_DC");

    // If this is a "Trap Set" object then check if its trap
    // is still active
    if (GetTag(oObject) == "TrapSet")
    {
        oTrap = GetNearestTrapToObject(oObject, FALSE);
        fDist = GetDistanceBetween(oObject, oTrap);
        if (fDist > 0.1 || !GetIsObjectValid(oTrap))
        {
            fSize = GetLocalFloat(oObject, "TRAP_SIZE");
            oTrap = CreateTrapAtLocation(iTrapType, GetLocation(oObject), fSize);
        }
    }
    // Make sure the object doesnt already have a trap set
    else if (!GetIsTrapped(oObject))
    {
        CreateTrapOnObject(iTrapType, oObject);
        oTrap = GetNearestTrapToObject(oObject, FALSE);
    }
    // Set the status of the trap based on the vars set
    if (iTrapDetectable)
    {
        SetTrapDetectable(oTrap);
        SetTrapDetectDC(oTrap, iTrapDetectDC);
    }
    if (iTrapDisarmable)
    {
        SetTrapDisarmable(oTrap);
        SetTrapDisarmDC(oTrap, iTrapDisarmDC);
    }
    SetTrapActive(oTrap, TRUE);
}
