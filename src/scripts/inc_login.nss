//#include "nwnx_realtime"
#include "aps_include"
#include "_colour_codes"
#include "jail_timer"
#include "sf_hack_inc"

int HastheItem(object oCreature, string s)
{
    return  GetIsObjectValid(GetItemPossessedBy(oCreature, s));
}

void DestroyItems(object oPC, string sItem)
{
    if(HastheItem(oPC, sItem) == TRUE)
    {
        string sName = GetName(oPC);
        string sCDKEY = GetPCPublicCDKey(oPC);

        SendMessageToAllDMs("<có  >WARNING!!! PLAYER: </c>" +sName+
        "<có  > ID: </c>" +sCDKEY+ "<có  > possibly duped an item.  <c ó >Detected an destroyed!");
        SendMessageToPC(oPC, "<có  >SERVER Message: </c>Duplicate Item Destroyed!" +
        "  Action reported to <có  >SERVER </c>and <có  >{DM}'s.");
        FloatingTextStringOnCreature("<có  >SERVER Message: </c>Duplicate Item Destroyed!" +
        "  Action reported to <có  >SERVER </c>and <có  >{DM}'s.", oPC, FALSE);
        DestroyObject(GetItemPossessedBy(oPC, sItem));
    }
}

void Apollo(object oPC)
{
    if (GetPersistentInt(oPC, "WAS_CRAFTING", "Hermes") == TRUE)
    {
        string sCraftedItem = GetPersistentString(oPC, "CRAFT_OBJECT", "Hermes");
        DestroyItems(oPC, sCraftedItem);
        DeletePersistentVariable(oPC, "WAS_CRAFTING", "Hermes");
        DeletePersistentVariable(oPC, "CRAFT_OBJECT", "Hermes");
    }
}

void NameChecker(object oPC)
{
    string sName = GetStringUpperCase(GetName(oPC));

    if (FindSubString(sName, "SERVER")      >= 0  ||
        FindSubString(sName, "BITCH")       >= 0  ||
        FindSubString(sName, "FUCK")        >= 0  ||
        FindSubString(sName, "SHIT")        >= 0  ||
        FindSubString(sName, "ASSHOLE")     >= 0  ||
        FindSubString(sName, "FAGGOT")      >= 0)
    {
        SpeakString("<cÌwþ> Entering Player: " + sName+
       "<có  > NAME IS PROHIBITED.", TALKVOLUME_SHOUT);
        ClearAllActions(FALSE);
        PopUpDeathGUIPanel(oPC, FALSE, FALSE, 0, "Error!!!!  NAMES (SERVER, "+
        " BITCH, FUCK, SHIT, ASSHOLE"+
        " IS PROHIBITED");
        EffectCutsceneGhost();
        EffectCutsceneImmobilize();
    }
}

void ReEquipItem(object oItem, object oPC)
{
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, ActionUnequipItem(oItem));
    AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_NECK));
}

void main()
{
    object oItem = GetItemInSlot(INVENTORY_SLOT_NECK, oPC);
    object oPC = GetEnteringObject();
    object oLeftHand = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    object oRightHand = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
    effect eEffect = EffectCutsceneImmobilize();
    string sName = GetName(oPC),
           sLogInName = GetPCPlayerName(oPC),
           sCDKEY = GetPCPublicCDKey(oPC, FALSE);
    string Script = GetLocalString(oPC, "LetoScript");
    string sArea = GetTag(GetArea(oPC));

    if (GetXP(oPC) == 0 && PlayerValidityCheck(oPC) == FALSE)
    {
        SpeakString("<cú>Hacked PC login detected!  <cúúú>"
        +sName+" - "+sAcct+" - "+sKey+
        " <cú># of Feats: <cúú>"             +sFeatTotal+"/"+sNumFeatsClass+
        " <cú># of Skill Points: <cúú>"      +sSkillTotal+"/56"+
        " <cú># of Ability Points: <cúú>"    +sTotalAbility+"/78", TALKVOLUME_SHOUT);

        CreateItemOnObject("hacker", oPC);
        SetXP(oPC, 1);
        ClearAllActions();
        DelayCommand(5.0, AssignCommand(oPC, JumpToLocation(GetLocation(GetWaypointByTag("WP_HACKER")))));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneImmobilize(), oPC, 5.0);

        SpeakString(sName + " <cú> # of Feats: <cúú>"             +sFeatTotal+"/"+sNumFeatsClass+
                            "<cú> # of Skill Points: <cúú>"      +sSkillTotal+"/56"+
                            "<cú> # of Ability Points: <cúú>"    +sTotalAbility+"/78", TALKVOLUME_SHOUT);

        WriteTimestampedLogEntry(sName + " # of Feats: <cúú>"        +sFeatTotal+"/"+sNumFeatsClass+
                                 " # of Skill Points: <cúú>"      +sSkillTotal+"/56"+
                                 " # of Ability Points: <cúú>"    +sTotalAbility+"/78"); return;

    }

    if (GetXP(oPC) == 0 && PlayerValidityCheck(oPC) == TRUE)
    {
        SpeakString("<cú>New Character validated!", TALKVOLUME_SHOUT);
        SendMessageToAllDMs(sName + "<cú> # of Feats: <cúú>"             +sFeatTotal+"/"+sNumFeatsClass+
                            "<cú> # of Skill Points: <cúú>"      +sSkillTotal+"/52"+
                            "<cú> # of Ability Points: <cúú>"    +sTotalAbility+"/78");

        WriteTimestampedLogEntry(sName + " # of Feats: "        +sFeatTotal+"/"+sNumFeatsClass+
                                 "# of Skill Points: "      +sSkillTotal+"/56"+
                                 "# of Ability Points: "    +sTotalAbility+"/78");
    }

    if (sArea == "MemnoksLair" ||
        sArea == "RAVANA_BOSS" ||
        sArea == "GauntletExodus")
    {
        FloatingTextStringOnCreature("<cþf >LOGIN RESTRICTED ON THIS MAP." +
        "YOU HAVE BEEN PORTED OUT BY SCRIPT</c>", oPC, TRUE);
        SendMessageToPC(oPC, "<cþf >LOGIN RESTRICTED ON THIS MAP." +
        "YOU HAVE BEEN PORTED OUT BY SCRIPT</c>");
        SendMessageToAllDMs(GetName(oPC, TRUE)+ "<cþf >as been ported out of a NO LOGIN ZONE: </c>" +sArea);
        AssignCommand(oPC, ClearAllActions(TRUE));
        ActionJumpToLocation(GetStartingLocation());
    }

    if ( Script != "")
    {
        SetLocalString(oPC, "LetoScript", "");
    }

    if (!GetIsObjectValid(GetItemPossessedBy(oPC, "sf_recall")))
    {
        ValidateName(oPC);
    }

    if (GetIsObjectValid(GetItemPossessedBy(oPC, "jail_token")))
    {
        JailPlayer(oPC);
    }

    if (GetIsObjectValid(oItem))
    {
        ReEquipItem(oItem, oPC);
    }

    if (GetIsObjectValid(GetItemPossessedBy(oPC, "hacker")))
    {
        AssignCommand(oPC, JumpToLocation(GetLocation(GetWaypointByTag("WP_HACKER"))));
    }

    if (GetIsObjectValid(oLeftHand) ||
        GetIsObjectValid(oRightHand) ||
        GetIsObjectValid(oArmor))
    {
        IPRemoveAllItemProperties(oLeftHand, DURATION_TYPE_TEMPORARY);
        IPRemoveAllItemProperties(oRightHand, DURATION_TYPE_TEMPORARY);
        IPRemoveAllItemProperties(oArmor, DURATION_TYPE_TEMPORARY);
    }

    SpeakString("<c ó >Player: <cfÌþ>"+sName+
    "<c ó > - Account: <cfÌþ>"+sLogInName+"<c ó > - ID: <cfÌþ>"+sCDKEY, TALKVOLUME_SHOUT);
    WriteTimestampedLogEntry("Player: "+sName+" Account: "+sLogInName+" - ID: "
    +sCDKEY+" IP: "+GetPCIPAddress(oPC));
    SendMessageToAllDMs(GetPCIPAddress(oPC));
    NameChecker(oPC);
    Apollo(oPC);
    ApplyBountyFlag(oPC);
}

/*void main(){}
