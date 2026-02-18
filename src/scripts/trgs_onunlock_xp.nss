// Handles unlocking of a chest or door to give the player experience for
// unlocking it. The formula by default is 5xp * the DC (minus 10) of the chest minus
// 5 * the number of Rogue levels the PC has. Low-levels and non-rogues are
// rewarded more for excelling in lock-picking because it is easier for real
// rogues, who don't need to use potions or lockpicks to succeed.
#include "trgs_i0_respawn"
void main()
{
    object oPicked = OBJECT_SELF;
    object oPicker = GetLastUnlocked();
    string sOnce = "UNLOCK_DO_ONCE";
    if ( !GetLocalInt( oPicked, sOnce ) )
    {
        object oPC = GetLastUnlocked();
        int nThief = GetLevelByClass( CLASS_TYPE_ARCANE_ARCHER, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_ASSASSIN, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_BARBARIAN, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_BARD, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_CLERIC, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_DIVINE_CHAMPION, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_DIVINECHAMPION, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_DRAGON_DISCIPLE, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_DRAGONDISCIPLE, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_DRUID, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_DWARVEN_DEFENDER, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_DWARVENDEFENDER, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_FIGHTER, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_HARPER, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_MONK, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_PALADIN, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_PALE_MASTER, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_PALEMASTER, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_RANGER, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_ROGUE, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_SHADOWDANCER, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_SHIFTER, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_SORCERER, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_WEAPON_MASTER, oPicker ) ||
                     GetLevelByClass( CLASS_TYPE_WIZARD, oPicker );

        int nDC = ( GetLockUnlockDC( oPicked ) - 10 );
        if ( nDC < 10 )
            nDC = 10;
        int nXP = ( nDC * DEFAULT_UNLOCK_XP ) - ( nThief * DEFAULT_UNLOCK_XP );
        if ( nXP < DEFAULT_UNLOCK_XP )
            nXP = DEFAULT_UNLOCK_XP;
        GiveXPToCreature( oPicker, nXP );
        SetLocalInt( oPicked, sOnce, TRUE );
    }
}
