//strip char to level 1 & restore xp for total level rebuild
// Invalid Protection by Elwoodini

void main()
{
    object oPC = GetPCSpeaker();
    object oItem;
    int iSlot = 0;
    int iXP = GetXP(oPC);
    SendMessageToAllDMs(GetName(oPC) + "<cóó > has used Rebuild All Levels Script.");
    //apply visual effect to PC
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_NATURES_BALANCE), oPC);     //default   VFX_FNF_DECK

    if( !GetIsDM( oPC ) && GetIsPC( oPC ) && ( iXP != 0 ) )
    {   //2nd, make sure player's equpment is not equipped (so they don't get invalidated).
        for (iSlot; iSlot < NUM_INVENTORY_SLOTS; iSlot++)
        {
            oItem = GetItemInSlot(iSlot, oPC);
            //unequip if valid
            if ( GetIsObjectValid(oItem) )
            {
                AssignCommand(oPC, ActionUnequipItem(oItem));
            }
        }
    }
    //zap and restore xp for rebuild
    SetXP(oPC, 0);
    DelayCommand(1.0, SetXP(oPC, iXP));
}

