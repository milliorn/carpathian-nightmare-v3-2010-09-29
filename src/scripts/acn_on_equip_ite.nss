//::///////////////////////////////////////////////
//:: Example XP2 OnItemEquipped
//:: x2_mod_def_equ
//:: (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Put into: OnEquip Event
*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-07-16
//:://////////////////////////////////////////////
#include "x2_inc_switches"
#include "x2_inc_itemprop"
//#include "x2_inc_intweapon"
#include "sfsubr_functs"
#include "inc_set_items"
//#include "acn_ilr"

void main()
{

    object oItem = GetPCItemLastEquipped();
    object oPC   = GetPCItemLastEquippedBy();
    int    iRefund = GetGoldPieceValue(oItem);
    string sPlayerName = GetName (oPC);

    CheckSetItemEquip(oPC, oItem);
    SF_SubraceOnEquipItem(oPC);
    //(oPC, oItem);

    if (GetTag(oItem) == "sf_sockets" &&
        IPGetNumberOfItemProperties(oItem) > 6 &&
        GetBaseItemType(oItem) == BASE_ITEM_MAGICSTAFF)
    {
        GiveGoldToCreature(oPC, iRefund);
        DestroyObject(oItem, 0.3);
        SendMessageToPC(oPC, "<cú>Socket Items with 4 Slots are PROHIBITED!.</c>");
        SpeakString(sPlayerName + ", <cú>Socket Items with 4 Slots are PROHIBITED!.</c>", TALKVOLUME_SHOUT);
        FloatingTextStringOnCreature("<cú>Socket Items with 4 Slots are PROHIBITED!.</c>", oPC);
        return;
    }

    if (GetTag(oItem) == "x2_it_epicdragcl" &&
        GetTag(oItem) == "NW_IT_CREITEMDRC" &&
        GetTag(oItem) == "NW_IT_CREITEMDRM" &&
        GetTag(oItem) == "NW_IT_CREITEMDRA" &&
        GetTag(oItem) == "NW_IT_CREITEMDRI" &&
        GetTag(oItem) == "NW_IT_CREWPS017")
    {
        IPRemoveMatchingItemProperties(oItem, ITEM_PROPERTY_DAMAGE_REDUCTION, DURATION_TYPE_PERMANENT);
    }
/*
    // -------------------------------------------------------------------------
    // Intelligent Weapon System
    // -------------------------------------------------------------------------
    if (IPGetIsIntelligentWeapon(oItem))
    {
        IWSetIntelligentWeaponEquipped(oPC,oItem);
        // prevent players from reequipping their weapon in
        if (IWGetIsInIntelligentWeaponConversation(oPC))
        {
                object oConv =   GetLocalObject(oPC,"X2_O_INTWEAPON_SPIRIT");
                IWEndIntelligentWeaponConversation(oConv, oPC);
        }
        else
        {
            //------------------------------------------------------------------
            // Trigger Drain Health Event
            //------------------------------------------------------------------
            if (GetLocalInt(oPC,"X2_L_ENSERRIC_ASKED_Q3")==1)
            {
                //ExecuteScript ("x2_ens_dodrain",oPC);
            }
            else
            {
                IWPlayRandomEquipComment(oPC,oItem);
            }
        }
    }

*/
     // -------------------------------------------------------------------------
     // Generic Item Script Execution Code
     // If MODULE_SWITCH_EXECUTE_TAGBASED_SCRIPTS is set to TRUE on the module,
     // it will execute a script that has the same name as the item's tag
     // inside this script you can manage scripts for all events by checking against
     // GetUserDefinedItemEventNumber(). See x2_it_example.nss
     // -------------------------------------------------------------------------
     if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
     {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_EQUIP);
        int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
           return;
        }
     }

}
