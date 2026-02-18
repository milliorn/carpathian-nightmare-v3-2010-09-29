//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT7
/*
  Default OnDeath event handler for NPCs.

  Adjusts killer's alignment if appropriate and
  alerts allies to our death.
 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////

#include "x2_inc_compon"
#include "x0_i0_spawncond"

void DestroyNPC(object oPC)
{
    if(GetIsObjectValid(GetArea(OBJECT_SELF)))
    {
        // Must be dead.
        if(GetIsDead(OBJECT_SELF))
        {
            // Totally dead - no death file, no raising.
            // Ok, we are going to set we are lootable (maybe)

                // As it is now destroyable, it should destroy itself if it has
                // no inventory. SetLootable is set up on spawn.
                // 75: "[Dead] Setting to selectable/destroyable (so we go) for Bioware corpses."
                SetIsDestroyable(TRUE, FALSE, TRUE);
            }
            else // Destroy self normally
            {
                // Just in case, we set destroyable, but not raiseable.
                SetIsDestroyable(TRUE, FALSE, FALSE);
                // Remove plot/immoral/lootable flags JUST in case.
                SetPlotFlag(OBJECT_SELF, FALSE);
                SetImmortal(OBJECT_SELF, FALSE);
                SetLootable(OBJECT_SELF, FALSE);
                // Destroy ourselves
                DestroyObject(OBJECT_SELF);
            }
        }
}
    // Note: we never do more then one death removal check. DM's can re-raise and kill a NPC if they wish.
/*
// Used in DeleteAllThings.
void ClearSlot(int iSlotID)
{
    object oItem = GetItemInSlot(iSlotID);
    if(GetIsObjectValid(oItem) && !GetDroppableFlag(oItem))
        DestroyObject(oItem);
}
// This will delete all un-droppable items, before they fade out.
void DeleteAllThings()
{
    // Destroy all equipped slots - 0 to 18 (18 = NUM_INVENTORY_SLOTS)
    int iSlotID;
    for(iSlotID = 0; iSlotID <= NUM_INVENTORY_SLOTS; iSlotID++)
    {
        ClearSlot(iSlotID);
    }
    // Destroy all inventory items
    object oItem = GetFirstItemInInventory();
    while(GetIsObjectValid(oItem))
    {
        if(!GetDroppableFlag(oItem))
            DestroyObject(oItem);
        oItem = GetNextItemInInventory();
    }
}
*/

void main()
{
    int nClass = GetLevelByClass(CLASS_TYPE_COMMONER);
    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);
    object oKiller = GetLastKiller();

    // If we're a good/neutral commoner,
    // adjust the killer's alignment evil
/*    if(nClass > 0 && (nAlign == ALIGNMENT_GOOD || nAlign == ALIGNMENT_NEUTRAL))
    {
        AdjustAlignment(oKiller, ALIGNMENT_EVIL, 5);
    }
*/
    // Call to allies to let them know we're dead
    SpeakString("NW_I_AM_DEAD", TALKVOLUME_SILENT_TALK);
    PlayVoiceChat(VOICE_CHAT_DEATH);
    //Shout Attack my target, only works with the On Spawn In setup
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
    ExecuteScript("sf_xp", OBJECT_SELF);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE), OBJECT_SELF);
    DelayCommand(60.0, DestroyNPC(OBJECT_SELF));
}
