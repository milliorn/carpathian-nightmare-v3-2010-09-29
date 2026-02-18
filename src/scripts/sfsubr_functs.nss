//::///////////////////////////////////////////////
//:: Scarface's Leto Subrace System
//:: Subrace Functions Include
//:: sfsubr_functs
//:://////////////////////////////////////////////
/*
    Written By Scarface

    Thanks to JasonMel and Axe Murderer from
    Bioware forums for help on some of the
    bitwise functions.
*/
//:://////////////////////////////////////////////

#include "sfsubr_leto_inc"

//::////////////////////////////////////////////////////////////////////////////
//:: Function Declarations - Do NOT Touch!!!
//::////////////////////////////////////////////////////////////////////////////

//:: This is the main struct for Scarface's Subrace System, do not modify
//:: this in any way. Doing so will probably cause the subrace system to
//:: malfunction.
struct SF_SubraceMods SF_GetSubraceModifications(object oPC, string sSubrace);

//:: This is the struct for retrieving subrace item information,
//:: i.e. hides and claws.
struct SF_SubraceItems SF_GetSubraceItems(object oPC, string sSubrace);

//:: This function is for creating a new subrace.
//::
//:: PARAMETERS:
//:: ***********
//:: string sSubrace:            The name of the subrace.
//:: int nAppearanceTypeMale:    The appearance type for males.
//:: int nAppearanceTypeFemale:  The appearance type for females.
//::                             * Use the APPEARANCE_TYPE_* constants, or APPEARANCE_TYPE_INVALID
//::                               to keep the players default appearance.
//:: string sHideResRef:         The ResRef of the creature hide associated with this subrace,
//::                             if no ResRef is specified then a default subrace hide will be used.
//:: string sClawResRef:         The ResRef of the creature claws associated with this subrace.
//:: string sItemResRef:         The ResRef of the creature item associated with this subrace.
//:: int bIsUndead:              If this is an undead subrace, then set this TRUE, otherwise you can
//::                             leave this parameter out because it is set FALSE by default.
//:: int nLevelAcquiredSkin:     The level at which the subrace will acquire a subrace skin if applicable, default is level 1.
void SF_CreateNewSubrace(string sSubrace, int nAppearanceTypeMale = APPEARANCE_TYPE_INVALID, int nAppearanceTypeFemale = APPEARANCE_TYPE_INVALID, string sHideResRef = "", string sClawResRef = "", string sItemresRef = "", int bIsUndead = FALSE, int nLevelAcquiredSkin = 1);

//:: This function is for setting a new head type for a subrace
//::
//:: PARAMETERS:
//:: ***********
//:: string sSubrace:   The name of the subrace.
//:: int nMaleHead:     The head type appearance of a particular male subrace.
//:: int nFemaleHead:   The head type appearance of a particular female subrace.
void SF_SetSubraceHeadType(string sSubrace, int nMaleHead, int nFemaleHead);

//:: This function is for setting wings or a tail for a subrace.
//::
//:: PARAMETERS:
//:: ***********
//:: string sSubrace:   The name of the subrace.
//:: int nWingType:     The wing type appearance using the WINGS_TYPE_* constants.
//:: int nTailType:     The wing type appearance using the TAIL_TYPE_* constants.
void SF_SetSubraceBodyAttatchments(string sSubrace, int nWingType, int nTailType);

//:: This function is for setting the skin and hair color for a subrace.
//:: * This will only work on standard type appearances i.e. human, elf etc.
//::
//:: PARAMETERS:
//:: ***********
//:: string sSubrace:   The name of the subrace.
//:: nSkinColor:        The color for the skin.
void SF_SetSubraceAppearanceColor(string sSubrace, int nSkinColor, int nHairColor);

//:: This function is for setting the portrait for a subrace.
//::
//:: PARAMETERS:
//:: ***********
//:: string sSubrace:          The name of the subrace.
//:: string sMalePortrait:     The portrait ResRef for males.
//:: string sFemalePortrait:   The portrait ResRef for females.
void SF_SetSubracePortrait(string sSubrace, string sMalePortrait, string sFemalePortrait);

//:: This function is for setting the appearance for a subrace.
//::
//:: PARAMETERS:
//:: ***********
//:: string sSubrace:       The name of the subrace.
//:: int nMaleVoiceSet:     The voiceset for males.
//:: int nFemaleVoiceset:   The voiceset for females.
void SF_SetSubraceVoiceSet(string sSubrace, int nMaleVoiceSet, int nFemaleVoiceset);

//:: This function is for adding a feat to a subrace feat list.
//::
//:: PARAMETERS:
//:: ***********
//:: string sSubrace:   The name of the subrace.
//:: int nFeatType:     The feat to add to the subrace feat list using the FEAT* constants
//::
//:: *  This function can be used multiple times for the same subrace.
void SF_SetSubraceFeat(string sSubrace, int nFeatType);

//:: This function is for modifying a subrace's character movement speed.
//::
//:: PARAMETERS:
//:: ***********
//:: string sSubrace:   The name of the subrace.
//:: int nNewSpeed:     The movement speed at which the character will be set to
//:: using the CHARACTER_SPEED_* consts.
void SF_SetSubraceMovementSpeed(string sSubrace, int nNewSpeed);


//:: This function is for setting spell resistance for a subrace.
//::
//:: PARAMETERS:
//:: ***********
//:: string sSubrace:   The name of the subrace.
//:: int nSpellResist:  The total spell resistance at level 40, this is progressive
//::                    and will start low, and increase per character level until
//::                    the total SR is reached at level 40.
void SF_SetSubraceSpellResistance(string sSubrace, int nSpellResist);

//:: This function is for adding a class restriction for a subrace.
//::
//:: PARAMETERS:
//:: ***********
//:: string sSubrace:       The name of the subrace.
//:: bAllowUseClasses:        Restrict the subrace to the specified classes?
//::                        ALLOW_USE_TRUE = The subrace can only use the specified classes.
//::                        ALLOW_USE_FALSE = The subrace can't use any of the specified classes.
//:: nRestrictedToClasses:  The class(s) that the subrace is restricted to.
//:: nRestrictUntilLevel:   The level of which the classes are restricted to.
//::
//::                       * Use the CLASS_RESTRICT_* constants seperated by |
//::                         for example, if I wanted a subrace restricted to
//::                         monks and clerics only, I would use the function like
//::                         this:
//::
//::    SF_SetSubraceClassRestriction("Example-Subrace", ALLOW_USE_TRUE, CLASS_RESTRICT_CLERIC | CLASS_RESTRICT_MONK);
//::
//::                       * If I wanted to disallow a subrace to use monk and cleric
//::                         classes, I would use the function like this:
//::
//::    SF_SetSubraceClassRestriction("Example-Subrace", ALLOW_USE_FALSE, CLASS_RESTRICT_CLERIC | CLASS_RESTRICT_MONK);
//::
//::                       * You can do this with as many classes as you like.
//::
//:: If this function isn't used, then the subrace will have no class restrictions
void SF_SetSubraceClassRestriction(string sSubrace, int bAllowUseClasses, int nRestrictedToClasses, int nRestrictUntilLevel);

//:: This function is for adding a race restriction for a subrace.
//::
//:: PARAMETERS:
//:: ***********
//:: string sSubrace:     The name of the subrace.
//:: bAllowUseRaces:      Restrict the subrace to the specified races?
//::                      ALLOW_USE_TRUE = The subrace can only use the specified races.
//::                      ALLOW_USE_FALSE = The subrace can't use any of the specified races.
//:: nRestrictedRaces:    The racial type restrictions:
//::
//::                     * Use the RACE_RESTRICT_* constants seperated by |
//::                       for example, if I wanted a subrace restricted to
//::                       humans and elfs only, I would use the function like
//::                       this:
//::
//::    SF_SetSubraceRaceRestriction("Example-Subrace", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN | RACE_RESTRICT_ELF);
//::
//::                     * If I wanted to dis-allow a subrace to be racial type
//::                       human or elf, I would use the function like this:
//::
//::    SF_SetSubraceRaceRestriction("Example-Subrace", ALLOW_USE_FALSE, RACE_RESTRICT_HUMAN | RACE_RESTRICT_ELF);
//::
//::                       * You can do this with as many races as you like.
//::
//:: If this function isn't used, then the subrace will have no race restrictions
void SF_SetSubraceRaceRestriction(string sSubrace, int bAllowUseRaces, int nRestrictedRaces);

//:: This function is for adding alignment restrictions for a subrace.
//::
//:: PARAMETERS:
//:: ***********
//:: string sSubrace:         The name of the subrace.
//:: bAllowUseEquip:          Restrict the subrace to the specified alignment?
//::                          ALLOW_USE_TRUE = The subrace can only use the specified alignments.
//::                          ALLOW_USE_FALSE = The subrace can't use any of the specified alignments.
//:: nRestrictedAlignments:   The race(s) the subrace is restricted to.
//::
//::                        * Use the ALIGN_RESTRICT_* constants seperated by |
//::                          for example, if I wanted a subrace restricted to
//::                          chaotic evil only, I would use the function like
//::                          this:
//::
//:: SF_SetSubraceAlignmentRestriction("Example-Subrace", ALLOW_USE_TRUE, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
//::
//::                        * If I wanted to disallow a subrace to be
//::                          chaotic evil, I would use the function like
//::                          this:
//::
//:: SF_SetSubraceAlignmentRestriction("Example-Subrace", ALLOW_USE_FALSE, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
//::
//::                       * You can do this with as many alignments as you like.
//::
//::                       * ALIGN_RESTRICT_NEUTRAL1 is in between Good/Evil
//::                       * ALIGN_RESTRICT_NEUTRAL2 is in between Lawful/Chaotic
//::
//:: If this function isn't used, then the subrace will have no alignment restrictions
void SF_SetSubraceAlignmentRestriction(string sSubrace, int bAllowUseAlignment, int nRestrictedAlignments);

//:: This function is for adding equipment restrictions for a subrace.
//::
//:: PARAMETERS:
//:: ***********
//:: string sSubrace:    The name of the subrace.
//:: bAllowUseEquip:     Restrict the subrace to the use specified equipment?
//::                     ALLOW_USE_TRUE = The subrace can only use the specified equipment.
//::                     ALLOW_USE_FALSE = The subrace can't use any of the specified equipment.
//:: nRestrictedEquip:   The equipment the subrace is restricted to.
//::
//::                     * Use the EQUIP_RESTRICT_* constants seperated
//::                       by | for example, if I wanted a subrace restricted
//::                       to using only tiny weapons, cloth armour, and small
//::                       shields, I would use the function like this:
//::
//::    SF_SetSubraceEquipmentRestriction("Example-Subrace", ALLOW_USE_TRUE, EQUIP_RESTRICT_WEAPON_TINY | EQUIP_RESTRICT_ARMOUR_CLOTH | EQUIP_RESTRICT_SHIELD_SMALL);
//::
//::                     * If I wanted to disallow a subrace from using
//::                       tiny weapons, cloth armour, and small
//::                       shields, I would use the function like this:
//::
//::    SF_SetSubraceEquipmentRestriction("Example-Subrace", ALLOW_USE_FALSE, EQUIP_RESTRICT_WEAPON_TINY | EQUIP_RESTRICT_ARMOUR_CLOTH | EQUIP_RESTRICT_SHIELD_SMALL);
//::
//::                       * You can do this with as much equip as you like.
//::
//:: If this function isn't used, then the subrace will have no equip restrictions
void SF_SetSubraceEquipmentRestriction(string sSubrace, int bAllowUseEquip, int nRestrictedEquip);

//:: This function is for adjusting subrace stats.
//::
//:: PARAMETERS:
//:: ***********
//:: string sSubrace:   The name of the subrace.
//:: int nSTR:          The amount of Strength to be adjusted.
//:: int nDEX:          The amount of Dexterity to be adjusted.
//:: int nCON:          The amount of Constitution to be adjusted.
//:: int nINT:          The amount of Intelligence to be adjusted.
//:: int nWIS:          The amount of Wisdom to be adjusted.
//:: int nCHA:          The amount of Charisma to be adjusted.
//::
//:: * These can be positive or negative numbers. It is necessary to - for
//::   negative numbers, but never use + for positive numbers,
//::   for example:
//::
//::   SF_AdjustSubraceStats("Example-Subrace", 2, 4, 0, -2, -6, 2);
//::
//::   Which would mean +2 STR, +4 DEX, CON no change, -2 INT, -6 WIS, +2 CHA.
void SF_AdjustSubraceStats(string sSubrace, int nSTR, int nDEX, int nCON, int nINT, int nWIS, int nCHA);

//:: Apply spell resistance to a subrace.
void SF_ApplySubraceSpellResistance(object oPC);

//:: Apply necessary subrace items to a subrace.
void SF_ApplySubraceItems(object oPC, string sSubrace);

//:: Apply a subrace to a player.
void SF_ApplySubraceToPC(object oPC, string sSubrace);

//:: Capitalize a subrace name for no special reason other than it looks better imo.
string SF_CapitalizeSubraceName(object oPC);

//:: Check a player Onenter.
void SF_SubraceOnEnter(object oPC);

//:: Check a player OnExit.
void SF_SubraceOnExit(object oPC);

//:: Checks alignment/class restrictions as well as applying SR
void SF_SubraceOnLevelUp(object oPC);

//:: Chekcs for equipment restrictions
void SF_SubraceOnEquipItem(object oPC);

//:: Send necessary subrace messages to a player.
void SF_SendSubraceMessage(object oPC, string sMessage);

//:: Check if the player's subrace is valid.
int SF_GetIsSubraceValid(string sSubrace);

//:: Check if the player's class is valid for a subrace.
int SF_GetIsClassValid(object oPC, int nClassPos, string sSubrace);

//:: Check if the player's race is valid for a subrace.
int SF_GetIsRaceValid(object oPC, string sSubrace);

//:: Check if the player's alignment is valid for a subrace.
int SF_GetIsAlignmentValid(object oPC, string sSubrace);

//:: Gets the WEAPON_SIZE_* size of a weapon
int SF_GetWeaponSize(object oItem);

//:: Gets the base type of a piece of armour
int SF_GetArmorBaseType(object oItem);

//:: Returns either TRUE or FALSE whether the subrace is flagged as undead or not.
int SF_GetIsSubraceUndead(object oPC);

//::////////////////////////////////////////////////////////////////////////////
//:: Main Functions - Do NOT Touch!!!
//::////////////////////////////////////////////////////////////////////////////

struct SF_SubraceMods
{
    string Portrait;
    string Appearance;
    string Head;
    string VoiceSet;
    string HairColor;
    string SkinColor;
    string Wings;
    string Tail;
    string IsUndead;
    string Speed;
    string STR;
    string DEX;
    string CON;
    string INT;
    string WIS;
    string CHA;
};


struct SF_SubraceMods SF_GetSubraceModifications(object oPC, string sSubrace)
{
    struct SF_SubraceMods Subrace;

    if (GetGender(oPC) == GENDER_MALE)
    {
        Subrace.Head = GetLocalString(MODULE, "SUBR_HEAD_M_" + sSubrace);
        Subrace.Portrait = GetLocalString(MODULE, "SUBR_POR_M_" + sSubrace);
        Subrace.VoiceSet = GetLocalString(MODULE, "SUBR_VOI_M_" + sSubrace);
        Subrace.Appearance = GetLocalString(MODULE, "SUBR_APP_M_" + sSubrace);
    }
    else
    {
        Subrace.Head = GetLocalString(MODULE, "SUBR_HEAD_F_" + sSubrace);
        Subrace.Portrait = GetLocalString(MODULE, "SUBR_POR_F_" + sSubrace);
        Subrace.VoiceSet = GetLocalString(MODULE, "SUBR_VOI_F_" + sSubrace);
        Subrace.Appearance = GetLocalString(MODULE, "SUBR_APP_F_" + sSubrace);
    }

    Subrace.STR = GetLocalString(MODULE, "SUBR_STR_" + sSubrace);
    Subrace.DEX = GetLocalString(MODULE, "SUBR_DEX_" + sSubrace);
    Subrace.CON = GetLocalString(MODULE, "SUBR_CON_" + sSubrace);
    Subrace.INT = GetLocalString(MODULE, "SUBR_INT_" + sSubrace);
    Subrace.WIS = GetLocalString(MODULE, "SUBR_WIS_" + sSubrace);
    Subrace.CHA = GetLocalString(MODULE, "SUBR_CHA_" + sSubrace);
    Subrace.Wings = GetLocalString(MODULE, "SUBR_WINGS_" + sSubrace);
    Subrace.Tail = GetLocalString(MODULE, "SUBR_TAIL_" + sSubrace);
    Subrace.IsUndead = GetLocalString(MODULE, "SUBR_UNDEAD_" + sSubrace);
    Subrace.HairColor = GetLocalString(MODULE, "SUBR_HAIR_" + sSubrace);
    Subrace.SkinColor = GetLocalString(MODULE, "SUBR_SKIN_" + sSubrace);
    Subrace.Speed = GetLocalString(MODULE, "SUBR_SPEED_" + sSubrace);

    return Subrace;
}

struct SF_SubraceItems
{
    string HideResRef;
    string ClawResRef;
    string ItemResRef;
    int AcquireSkinLevel;
};

struct SF_SubraceItems SF_GetSubraceItems(object oPC, string sSubrace)
{
    struct SF_SubraceItems Subrace;

    Subrace.HideResRef = GetLocalString(MODULE, "SUBR_HIDE_" + sSubrace);
    Subrace.ClawResRef = GetLocalString(MODULE, "SUBR_CLAW_" + sSubrace);
    Subrace.ItemResRef = GetLocalString(MODULE, "SUBR_ITEM_" + sSubrace);
    Subrace.AcquireSkinLevel = GetLocalInt(MODULE, "SUBR_LVLSKIN_" + sSubrace);

    return Subrace;
}

struct SF_SubraceFeats
{
    string Feats;
};

struct SF_SubraceFeats SF_GetSubraceFeats(object oPC, string sSubrace)
{
    struct SF_SubraceFeats Subrace;
    string sFeat = "";
    int nLoop = 1;
    do
    {
        sFeat = GetLocalString(MODULE, "SUBR_FEAT_" + IntToString(nLoop) + sSubrace);
        Subrace.Feats += AddFeat(StringToInt(sFeat));
        nLoop ++;
    }
    while (sFeat != "");

    return Subrace;
}

void SF_CreateNewSubrace(string sSubrace, int nAppearanceTypeMale = APPEARANCE_TYPE_INVALID, int nAppearanceTypeFemale = APPEARANCE_TYPE_INVALID, string sHideResRef = "", string sClawResRef = "", string sItemResRef = "", int bIsUndead = FALSE, int nLevelAcquiredSkin = 1)
{
    sSubrace = GetStringUpperCase(sSubrace);

    if (sHideResRef != "")
    {
        SetLocalString(MODULE, "SUBR_HIDE_" + sSubrace, sHideResRef);
    }
    if (sClawResRef != "")
    {
        SetLocalString(MODULE, "SUBR_CLAW_" + sSubrace, sClawResRef);
    }
    if (sItemResRef != "")
    {
        SetLocalString(MODULE, "SUBR_ITEM_" + sSubrace, sItemResRef);
    }
    if (bIsUndead)
    {
        SetLocalString(MODULE, "SUBR_UNDEAD_" + sSubrace, "1");
    }

    SetLocalInt(MODULE, "SUBR_LVLSKIN_" + sSubrace, nLevelAcquiredSkin);
    SetLocalInt(MODULE, "SUBR_NAME_" + sSubrace, TRUE);

    if (nAppearanceTypeMale != APPEARANCE_TYPE_INVALID)
    {
        SetLocalString(MODULE, "SUBR_APP_M_" + sSubrace, IntToString(nAppearanceTypeMale));
    }
    if (nAppearanceTypeFemale != APPEARANCE_TYPE_INVALID)
    {
        SetLocalString(MODULE, "SUBR_APP_F_" + sSubrace, IntToString(nAppearanceTypeFemale));
    }

}

void SF_SetSubraceHeadType(string sSubrace, int nMaleHead, int nFemaleHead)
{
    sSubrace = GetStringUpperCase(sSubrace);
    SetLocalString(MODULE, "SUBR_HEAD_M_" + sSubrace, IntToString(nMaleHead));
    SetLocalString(MODULE, "SUBR_HEAD_F_" + sSubrace, IntToString(nFemaleHead));
}

void SF_SetSubraceBodyAttatchments(string sSubrace, int nWingType, int nTailType)
{
    sSubrace = GetStringUpperCase(sSubrace);
    SetLocalString(MODULE, "SUBR_WINGS_" + sSubrace, IntToString(nWingType));
    SetLocalString(MODULE, "SUBR_TAIL_" + sSubrace, IntToString(nTailType));
}

void SF_SetSubraceAppearanceColor(string sSubrace, int nSkinColor, int nHairColor)
{
    sSubrace = GetStringUpperCase(sSubrace);
    SetLocalString(MODULE, "SUBR_SKIN_" + sSubrace, IntToString(nSkinColor));
    SetLocalString(MODULE, "SUBR_HAIR_" + sSubrace, IntToString(nHairColor));
}

void SF_SetSubracePortrait(string sSubrace, string sMalePortrait, string sFemalePortrait)
{
    sSubrace = GetStringUpperCase(sSubrace);
    SetLocalString(MODULE, "SUBR_POR_M_" + sSubrace, sMalePortrait);
    SetLocalString(MODULE, "SUBR_POR_F_" + sSubrace, sFemalePortrait);
}

void SF_SetSubraceVoiceSet(string sSubrace, int nMaleVoiceSet, int nFemaleVoiceset)
{
    sSubrace = GetStringUpperCase(sSubrace);
    SetLocalString(MODULE, "SUBR_VOI_M_" + sSubrace, IntToString(nMaleVoiceSet));
    SetLocalString(MODULE, "SUBR_VOI_F_" + sSubrace, IntToString(nFemaleVoiceset));
}

void SF_SetSubraceFeat(string sSubrace, int nFeatType)
{
    sSubrace = GetStringUpperCase(sSubrace);
    int nFeat = GetLocalInt(MODULE, "SUBR_FEAT_" + sSubrace) + 1;
    SetLocalString(MODULE, "SUBR_FEAT_" + IntToString(nFeat) + sSubrace, IntToString(nFeatType));
    SetLocalInt(MODULE, "SUBR_FEAT_" + sSubrace, nFeat);
}

void SF_SetSubraceMovementSpeed(string sSubrace, int nNewSpeed)
{
    sSubrace = GetStringUpperCase(sSubrace);
    SetLocalString(MODULE, "SUBR_SPEED_" + sSubrace, IntToString(nNewSpeed));
}

void SF_SetSubraceSpellResistance(string sSubrace, int nSpellResist)
{
    sSubrace = GetStringUpperCase(sSubrace);
    SetLocalInt(MODULE, "SUBR_SR_" + sSubrace, nSpellResist);
}

void SF_SetSubraceClassRestriction(string sSubrace, int bAllowUseClasses, int nRestrictedToClasses, int nRestrictUntilLevel)
{
    sSubrace = GetStringUpperCase(sSubrace);
    SetLocalInt(MODULE, "SUBR_CLASS_" + sSubrace, nRestrictedToClasses | bAllowUseClasses);
    SetLocalInt(MODULE, "SUBR_CL_TIL_" + sSubrace, nRestrictUntilLevel);
}

void SF_SetSubraceRaceRestriction(string sSubrace, int bAllowUseRaces, int nRestrictedToRaces)
{
    sSubrace = GetStringUpperCase(sSubrace);
    SetLocalInt(MODULE, "SUBR_RACE_" + sSubrace, nRestrictedToRaces | bAllowUseRaces);
}

void SF_SetSubraceAlignmentRestriction(string sSubrace, int bAllowUseAlignment, int nRestrictedAlignments)
{
    sSubrace = GetStringUpperCase(sSubrace);
    SetLocalInt(MODULE, "SUBR_ALIGN_" + sSubrace, nRestrictedAlignments | bAllowUseAlignment);
}

void SF_SetSubraceEquipmentRestriction(string sSubrace, int bAllowUseEquipment, int nRestrictedEquip)
{
    sSubrace = GetStringUpperCase(sSubrace);
    SetLocalInt(MODULE, "SUBR_EQUIP_" + sSubrace, nRestrictedEquip | bAllowUseEquipment);
}

void SF_AdjustSubraceStats(string sSubrace, int nSTR, int nDEX, int nCON, int nINT, int nWIS, int nCHA)
{
    sSubrace = GetStringUpperCase(sSubrace);
    SetLocalString(MODULE, "SUBR_STR_" + sSubrace, IntToString(nSTR));
    SetLocalString(MODULE, "SUBR_DEX_" + sSubrace, IntToString(nDEX));
    SetLocalString(MODULE, "SUBR_CON_" + sSubrace, IntToString(nCON));
    SetLocalString(MODULE, "SUBR_INT_" + sSubrace, IntToString(nINT));
    SetLocalString(MODULE, "SUBR_WIS_" + sSubrace, IntToString(nWIS));
    SetLocalString(MODULE, "SUBR_CHA_" + sSubrace, IntToString(nCHA));
}

void SF_SendSubraceMessage(object oPC, string sMessage)
{
    FloatingTextStringOnCreature(sMessage, oPC, FALSE);
}

void SF_ApplySubraceSpellResistance(object oPC)
{
    string sSubrace = GetStringUpperCase(GetSubRace(oPC));

    if (sSubrace == "")
    {
        return;
    }

    int nSpellResist = GetLocalInt(MODULE, "SUBR_SR_" + sSubrace);

    if (!nSpellResist)
    {
        return;
    }

    SF_SendSubraceMessage(oPC, APPLYING_SPELL_RESISTANCE);

    effect eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect))
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_SPELL_RESISTANCE_INCREASE &&
            GetEffectSubType(eEffect) == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
            break;
        }
        eEffect = GetNextEffect(oPC);
    }

    nSpellResist = nSpellResist / 40 * GetHitDice(oPC);

    if (!nSpellResist)
    {
        return;
    }

    effect eSpellResist = SupernaturalEffect(EffectSpellResistanceIncrease(nSpellResist));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eSpellResist, oPC);

}

void SF_ApplySubraceItems(object oPC, string sSubrace)
{
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneImmobilize(), oPC, 2.0);
    struct SF_SubraceItems Subrace = SF_GetSubraceItems(oPC, sSubrace);

    int nLevel = GetHitDice(oPC);
    object oHide = GetItemInSlot(INVENTORY_SLOT_CARMOUR, oPC);
    object oClaw1 = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oPC);
    object oClaw2 = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oPC);

    string sSubrace = GetStringUpperCase(GetSubRace(oPC));
    if (sSubrace == "") { return; }

    if (GetIsObjectValid(oHide))
    {
        DestroyObject(oHide);
    }
    if (GetIsObjectValid(oClaw1))
    {
        DestroyObject(oClaw1);
    }
    if (GetIsObjectValid(oClaw2 ))
    {
        DestroyObject(oClaw2);
    }

    AssignCommand(oPC, ClearAllActions());

    if (nLevel >= Subrace.AcquireSkinLevel)
    {
        SF_SendSubraceMessage(oPC, APPLYING_SUBRACE_SKIN);

        if (Subrace.HideResRef == "")
        {
            oHide = GetItemPossessedBy(oPC, DEFAULT_SUBRACE_HIDE);

            if (GetIsObjectValid(oHide))
            {
                DestroyObject(oHide);
            }

            oHide = CreateItemOnObject(DEFAULT_SUBRACE_HIDE, oPC);
            AssignCommand(oPC, ActionEquipItem(oHide, INVENTORY_SLOT_CARMOUR));
        }
        else
        {
            oHide = GetItemPossessedBy(oPC, Subrace.HideResRef);

            if (GetIsObjectValid(oHide))
            {
                DestroyObject(oHide);
            }

            oHide = CreateItemOnObject(Subrace.HideResRef, oPC);
            AssignCommand(oPC, ActionEquipItem(oHide, INVENTORY_SLOT_CARMOUR));
        }
    }
    if (Subrace.ClawResRef != "")
    {
        AssignCommand(oPC, ActionDoCommand(SF_SendSubraceMessage(oPC, APPLYING_SUBRACE_CLAW)));
        oClaw1 = CreateItemOnObject(Subrace.ClawResRef, oPC);
        oClaw2 = CreateItemOnObject(Subrace.ClawResRef, oPC);
        AssignCommand(oPC, ActionEquipItem(oClaw1, INVENTORY_SLOT_CWEAPON_L));
        AssignCommand(oPC, ActionEquipItem(oClaw2, INVENTORY_SLOT_CWEAPON_R));
    }
    if (Subrace.ItemResRef != "" && !GetIsObjectValid(GetItemPossessedBy(oPC, Subrace.ItemResRef)))
    {
        CreateItemOnObject(Subrace.ItemResRef, oPC);
    }

    AssignCommand(oPC, ActionDoCommand(SF_SendSubraceMessage(oPC, SUBRACE_ITEMS_APPLIED)));
    AssignCommand(oPC, ActionDoCommand(SetCutsceneMode(oPC, FALSE, TRUE)));
}

void SF_ApplySubraceToPC(object oPC, string sSubrace)
{
    string sLetoScript;
    struct SF_SubraceMods Subrace = SF_GetSubraceModifications(oPC, sSubrace);

    if (Subrace.IsUndead != "")
    {
        SetDeity(oPC, "RACIAL_TYPE_UNDEAD");
    }
    if (Subrace.Head != "")
    {
        SetCreatureBodyPart(CREATURE_PART_HEAD, StringToInt(Subrace.Head), oPC);
    }
    if (Subrace.Appearance != "")
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL), oPC);
        DelayCommand(2.0, SetCreatureAppearanceType(oPC, StringToInt(Subrace.Appearance)));
    }
    if (Subrace.Wings  != "")
    {
        DelayCommand(2.0, SetCreatureWingType(StringToInt(Subrace.Wings), oPC));
    }
    if (Subrace.Tail  != "")
    {
        DelayCommand(2.0, SetCreatureTailType(StringToInt(Subrace.Tail), oPC));
    }
    if (Subrace.Portrait != "")
    {
        DelayCommand(2.0, SetPortraitResRef(oPC, Subrace.Portrait));
    }
    if (Subrace.SkinColor != "")
    {
        sLetoScript += SetSkinColor(StringToInt(Subrace.SkinColor));
    }
    if (Subrace.HairColor != "")
    {
        sLetoScript += SetHairColor(StringToInt(Subrace.HairColor));
    }
    if (Subrace.VoiceSet != "")
    {
        sLetoScript += SetSoundSet(StringToInt(Subrace.VoiceSet));
    }
    if (Subrace.Speed != "")
    {
        sLetoScript += SetMovement(StringToInt(Subrace.Speed));
    }
    if (Subrace.STR != "0" && Subrace.STR != "")
    {
        sLetoScript += AdjustAbility(ABILITY_STRENGTH, StringToInt(Subrace.STR));
    }
    if (Subrace.DEX != "0" && Subrace.DEX != "")
    {
        sLetoScript += AdjustAbility(ABILITY_DEXTERITY, StringToInt(Subrace.DEX));
    }
    if (Subrace.CON != "0" && Subrace.CON != "")
    {
        sLetoScript += AdjustAbility(ABILITY_CONSTITUTION, StringToInt(Subrace.CON));
    }
    if (Subrace.INT != "0" && Subrace.INT != "")
    {
        sLetoScript += AdjustAbility(ABILITY_INTELLIGENCE, StringToInt(Subrace.INT));
    }
    if (Subrace.WIS != "0" && Subrace.WIS != "")
    {
        sLetoScript += AdjustAbility(ABILITY_WISDOM, StringToInt(Subrace.WIS));
    }
    if (Subrace.CHA != "0" && Subrace.CHA != "")
    {
        sLetoScript += AdjustAbility(ABILITY_CHARISMA, StringToInt(Subrace.CHA));
    }

    struct SF_SubraceFeats SubRace = SF_GetSubraceFeats(oPC, sSubrace);
    if (SubRace.Feats != "")
    {
        sLetoScript += SubRace.Feats;
    }

    DelayCommand(5.0, ApplyLetoScriptToPC(sLetoScript, oPC));
}

string SF_CapitalizeSubraceName(object oPC)
{
    string sSubrace = GetSubRace(oPC);
    sSubrace = GetStringLeft(sSubrace, 1) + GetStringLowerCase(GetStringRight(sSubrace, GetStringLength(sSubrace) - 1));
    SetSubRace(oPC, sSubrace);
    return sSubrace;
}

void SF_SubraceOnEnter(object oPC)
{
    if (!GetIsPC(oPC) || GetIsDM(oPC))
    {
        return;
    }

    LetoPCEnter(oPC);

    string sSubrace = GetStringUpperCase(GetSubRace(oPC));

    if (GetXP(oPC))
    {
        if (sSubrace != "")
        {
            SF_ApplySubraceSpellResistance(oPC);
            SF_ApplySubraceItems(oPC, sSubrace);
        }
    }
    else
    {
        int nError = 0;

        if (sSubrace == "")
        {
            return;
        }

        if (GetCreatureWingType(oPC))
        {
            SetCreatureWingType(WINGS_TYPE_NONE, oPC);
        }

            SetXP(oPC, 1);


        if (!SF_GetIsSubraceValid(sSubrace))
        {
            DelayCommand(3.0, SF_SendSubraceMessage(oPC, INVALID_SUBRACE));

            SetSubRace(oPC, "");
            {
                return;
            }
        }
        if (!SF_GetIsClassValid(oPC, 1, sSubrace))
        {
            DelayCommand(3.0, SF_SendSubraceMessage(oPC, INVALID_CLASS));
            nError++;
        }
        if (!SF_GetIsRaceValid(oPC, sSubrace))
        {
            DelayCommand(3.0, SF_SendSubraceMessage(oPC, INVALID_RACE));
            nError++;
        }
        if (!SF_GetIsAlignmentValid(oPC, sSubrace))
        {
            DelayCommand(3.0, SF_SendSubraceMessage(oPC, INVALID_ALIGNMENT));
            nError++;
        }
        if (nError)
        {
            SetSubRace(oPC, "");
                { return; }
        }
        else
        {
            SetCutsceneMode(oPC, TRUE);
            SF_CapitalizeSubraceName(oPC);
            ExportSingleCharacter(oPC);
            DelayCommand(3.0, SF_SendSubraceMessage(oPC, APPLYING_SUBRACE));
            DelayCommand(5.0, SF_ApplySubraceToPC(oPC, sSubrace));
        }
    }
}

void SF_SubraceOnExit(object oPC)
{
    LetoPCExit(oPC);
}

void SF_SubraceOnLevelUp(object oPC)
{
    string sSubrace = GetStringUpperCase(GetSubRace(oPC));
    int nRestrictedClassToLevel = GetLocalInt(MODULE, "SUBR_CL_TIL_" + sSubrace);
    int nHD = GetHitDice(oPC);
    int nClass2 = GetLevelByPosition(2, oPC);
    int nValid;

    if ((nHD <= nRestrictedClassToLevel && !nClass2) || nHD > nRestrictedClassToLevel )
    {
        SF_ApplySubraceSpellResistance(oPC);
        SF_ApplySubraceItems(oPC, sSubrace);
        return;
    }
    else
    {
        SF_SendSubraceMessage(oPC, INVALID_CLASS);
        nValid = TRUE;
    }

    if (!SF_GetIsAlignmentValid(oPC, sSubrace))
    {
        SF_SendSubraceMessage(oPC, INVALID_ALIGNMENT);
        nValid = TRUE;
    }

    if (nValid)
    {
        SF_SendSubraceMessage(oPC, RELEVEL_CHARACTER);
        int nHD = GetHitDice(oPC);
        int nNewXP = (nHD * (nHD - 1) * 500) - 1;
        SetXP(oPC, nNewXP);
        DelayCommand(3.0, GiveXPToCreature(oPC, 1));
    }
    else
    {
        SF_ApplySubraceSpellResistance(oPC);
        SF_ApplySubraceItems(oPC, sSubrace);
    }
}

void SF_SubraceOnEquipItem(object oPC)
{
    string sSubrace = GetStringUpperCase(GetSubRace(oPC));

    if (sSubrace == "")
    {
        return;
    }

    int nEquipRestrictions = GetLocalInt(MODULE, "SUBR_EQUIP_" + sSubrace);
    object oItem = GetPCItemLastEquipped();
    int nItemType = GetBaseItemType(oItem);
    int nValid;
    if (nItemType == BASE_ITEM_BULLET ||
        nItemType == BASE_ITEM_ARROW ||
        nItemType == BASE_ITEM_BOLT ||
        nItemType == BASE_ITEM_RING ||
        nItemType == BASE_ITEM_BRACER ||
        nItemType == BASE_ITEM_CLOAK ||
        nItemType == BASE_ITEM_BELT ||
        nItemType == BASE_ITEM_BOOTS ||
        nItemType == BASE_ITEM_AMULET ||
        nItemType == BASE_ITEM_HELMET ||
        nItemType == BASE_ITEM_GLOVES)
    {
        return;
    }
    if (nItemType == BASE_ITEM_ARMOR)
    {
        nValid = SF_GetArmorBaseType(oItem) & nEquipRestrictions ? TRUE : FALSE;
    }
    else if (nItemType == BASE_ITEM_SMALLSHIELD)
    {
        nValid = EQUIP_RESTRICT_SHIELD_SMALL & nEquipRestrictions ? TRUE : FALSE;
    }
    else if (nItemType == BASE_ITEM_LARGESHIELD)
    {
        nValid = EQUIP_RESTRICT_SHIELD_LARGE & nEquipRestrictions ? TRUE : FALSE;
    }
    else if (nItemType == BASE_ITEM_TOWERSHIELD)
    {
        nValid = EQUIP_RESTRICT_SHIELD_TOWER & nEquipRestrictions ? TRUE : FALSE;
    }
    else
    {
        nValid = SF_GetWeaponSize(oItem) & nEquipRestrictions ? TRUE : FALSE;
    }

    int AllowUseEquipment = nEquipRestrictions & ALLOW_USE_TRUE ? TRUE : FALSE;

    if (nValid != AllowUseEquipment)
    {
        SF_SendSubraceMessage(oPC, INVALID_EQUIPMENT);
        DelayCommand(0.5, AssignCommand(oPC, ClearAllActions(TRUE)));
        DelayCommand(0.6, AssignCommand(oPC, ActionUnequipItem(oItem)));
    }
}

int SF_GetIsSubraceValid(string sSubrace)
{
    if (GetLocalInt(MODULE, "SUBR_NAME_" + sSubrace))
    {
        return TRUE;
    }
    return FALSE;
}

int SF_GetIsClassValid(object oPC, int nClassPos, string sSubrace)
{
    int nClassRestrictions = GetLocalInt(MODULE, "SUBR_CLASS_" + sSubrace);
    int nClassType = GetClassByPosition(1, oPC);

    switch(nClassType)
    {
        case CLASS_TYPE_BARBARIAN:
        {
            nClassType = CLASS_RESTRICT_BARBARIAN;
            break;
        }
        case CLASS_TYPE_BARD:
        {
            nClassType = CLASS_RESTRICT_BARD;
            break;
        }
        case CLASS_TYPE_CLERIC:
        {
            nClassType = CLASS_RESTRICT_CLERIC;
            break;
        }
        case CLASS_TYPE_DRUID:
        {
            nClassType = CLASS_RESTRICT_DRUID;
            break;
        }
        case CLASS_TYPE_FIGHTER:
        {
            nClassType = CLASS_RESTRICT_FIGHTER;
            break;
        }
        case CLASS_TYPE_MONK:
        {
            nClassType = CLASS_RESTRICT_MONK;
            break;
        }
        case CLASS_TYPE_PALADIN:
        {
            nClassType = CLASS_RESTRICT_PALADIN;
            break;
        }
        case CLASS_TYPE_RANGER:
        {
            nClassType = CLASS_RESTRICT_RANGER;
            break;
        }
        case CLASS_TYPE_ROGUE:
        {
            nClassType = CLASS_RESTRICT_ROGUE;
            break;
        }
        case CLASS_TYPE_SORCERER:
        {
            nClassType = CLASS_RESTRICT_SORCERER;
            break;
        }
        case CLASS_TYPE_WIZARD:
        {
            nClassType = CLASS_RESTRICT_WIZARD;
            break;
        }
    }

    int nValid = nClassType & nClassRestrictions ? TRUE : FALSE;
    int nAllowUseClasses = nClassRestrictions & ALLOW_USE_TRUE ? TRUE : FALSE;
    return nValid == nAllowUseClasses;
}

int SF_GetIsRaceValid(object oPC, string sSubrace)
{
    int nRaceRestrictions = GetLocalInt(MODULE, "SUBR_RACE_" + sSubrace);
    int nRacialType = GetRacialType(oPC);

    switch(nRacialType)
    {
        case RACIAL_TYPE_DWARF:
        {
            nRacialType = RACE_RESTRICT_DWARF;
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            nRacialType = RACE_RESTRICT_ELF;
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            nRacialType = RACE_RESTRICT_GNOME;
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            nRacialType = RACE_RESTRICT_HALFELF;
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            nRacialType = RACE_RESTRICT_HALFLING;
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            nRacialType = RACE_RESTRICT_HALFORC;
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            nRacialType = RACE_RESTRICT_HUMAN;
            break;
        }
    }

    int nValid = nRacialType & nRaceRestrictions ? TRUE : FALSE;
    int nAllowUseRaces = nRaceRestrictions & ALLOW_USE_TRUE ? TRUE : FALSE;
    return nValid == nAllowUseRaces;
}
int SF_GetIsAlignmentValid(object oPC, string sSubrace)
{
    int nRestrictedAlignments = GetLocalInt(MODULE, "SUBR_ALIGN_" + sSubrace);
    int nValidG_E; int nValidL_C;

    switch( GetAlignmentGoodEvil(oPC))
    {
      case ALIGNMENT_GOOD:
      {
          nValidG_E = ALIGN_RESTRICT_GOOD;
          break;
      }
      case ALIGNMENT_EVIL:
      {
          nValidG_E = ALIGN_RESTRICT_EVIL;
          break;
      }
      default:
      {
          nValidG_E = ALIGN_RESTRICT_NEUTRAL1;
          break;
      }
    }
    switch(GetAlignmentLawChaos(oPC))
    {
        case ALIGNMENT_LAWFUL:
        {
            nValidL_C = ALIGN_RESTRICT_LAWFUL;
            break;
        }
        case ALIGNMENT_CHAOTIC:
        {
            nValidL_C = ALIGN_RESTRICT_CHAOTIC;
            break;
        }
        default:
        {
            nValidL_C = ALIGN_RESTRICT_NEUTRAL2;
            break;
        }
    }
    int nValid = nValidG_E + nValidL_C & nRestrictedAlignments ? TRUE : FALSE;
    int nAllowUseAllignment = nRestrictedAlignments & ALLOW_USE_TRUE ? TRUE : FALSE;
    return nValid == nAllowUseAllignment;
}

int SF_GetWeaponSize(object oItem)
{
    int nWeaponSize;
    switch (GetBaseItemType(oItem))
    {
        // Tiny Sized Weapons
        case BASE_ITEM_DAGGER:
        case BASE_ITEM_KUKRI:
        case BASE_ITEM_SHURIKEN: nWeaponSize = EQUIP_RESTRICT_WEAPON_TINY; break;

        // Small Sized Weapons
        case BASE_ITEM_DART:
        case BASE_ITEM_HANDAXE:
        case BASE_ITEM_KAMA:
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_LIGHTMACE:
        case BASE_ITEM_SHORTSWORD:
        case BASE_ITEM_SICKLE:
        case BASE_ITEM_SLING:
        case BASE_ITEM_THROWINGAXE:
        case BASE_ITEM_WHIP: nWeaponSize = EQUIP_RESTRICT_WEAPON_SMALL; break;

        // Medium Sized Weapons
        case BASE_ITEM_BASTARDSWORD:
        case BASE_ITEM_BATTLEAXE:
        case BASE_ITEM_CLUB:
        case BASE_ITEM_DWARVENWARAXE:
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_KATANA:
        case BASE_ITEM_LIGHTFLAIL:
        case BASE_ITEM_LIGHTHAMMER:
        case BASE_ITEM_LONGBOW:
        case BASE_ITEM_MORNINGSTAR:
        case BASE_ITEM_RAPIER:
        case BASE_ITEM_SCIMITAR:
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_SHORTSPEAR: nWeaponSize = EQUIP_RESTRICT_WEAPON_MEDIUM; break;

        // Large Sized Weapons
        case BASE_ITEM_WARHAMMER:
        case BASE_ITEM_DIREMACE:
        case BASE_ITEM_DOUBLEAXE:
        case BASE_ITEM_GREATAXE:
        case BASE_ITEM_GREATSWORD:
        case BASE_ITEM_HALBERD:
        case BASE_ITEM_HEAVYFLAIL:
        case BASE_ITEM_MAGICSTAFF:
        case BASE_ITEM_QUARTERSTAFF:
        case BASE_ITEM_SCYTHE:
        case BASE_ITEM_TRIDENT:
        case BASE_ITEM_TWOBLADEDSWORD: nWeaponSize = EQUIP_RESTRICT_WEAPON_LARGE; break;
    }
    return nWeaponSize;
}

int SF_GetArmorBaseType(object oItem)
{
    int nArmourWieght = GetWeight(oItem);

    if (nArmourWieght >= 45)
    {
        return EQUIP_RESTRICT_ARMOUR_HEAVY;
    }
    if (nArmourWieght >= 30)
    {
        return EQUIP_RESTRICT_ARMOUR_MEDIUM;
    }
    if (nArmourWieght >= 5)
    {
        return EQUIP_RESTRICT_ARMOUR_LIGHT;
    }

    return EQUIP_RESTRICT_ARMOUR_CLOTH;
}

int SF_GetIsSubraceUndead(object oPC)
{
    return GetDeity(oPC) == "RACIAL_TYPE_UNDEAD";
}

void RemoveHips(object oPC)
{
   int ACN_LetoScript = GetLocalInt(oPC, "ACN_LetoScript");
   if (!ACN_LetoScript)
   {
      ExportSingleCharacter(oPC);
      string Script = ModifyFeat(FEAT_HIDE_IN_PLAIN_SIGHT, 1);
      ApplyLetoScriptToPC(Script, oPC);
   }
}

void RemoveBoneSkin(object oPC)
{
   int ACN_LetoScript = GetLocalInt(oPC, "ACN_LetoScript");
   string Script;
   if (!ACN_LetoScript)
   {
      ExportSingleCharacter(oPC);
      //Script += ModifyFeat(FEAT_BONE_SKIN_2, 1);
      //Script += ModifyFeat(FEAT_BONE_SKIN_4, 1);
      Script += ModifyFeat(FEAT_BONE_SKIN_6, 1);
      ApplyLetoScriptToPC(Script, oPC);
   }
}




//void main(){}
