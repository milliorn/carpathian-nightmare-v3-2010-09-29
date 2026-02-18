// Return base item converted to string for party loot notification
#include "x2_inc_itemprop"
//#include "aps_include"
int GetIsAlphaNumericValid(string sLetter);
//void CheckPlayerName(object oPC);

string GetBaseItemString(object oItem)
{
  switch(GetBaseItemType(oItem))
  {
    // STANDARD BIOWARE BASE ITEM CONSTS
    case BASE_ITEM_AMULET: return "Amulet"; break;
    case BASE_ITEM_ARMOR: return "Armour"; break;
    case BASE_ITEM_ARROW: return "Arrow"; break;
    case BASE_ITEM_BOLT: return "Bolt"; break;
    case BASE_ITEM_BULLET: return "Bullet"; break;
    case BASE_ITEM_CRAFTMATERIALSML: // Crafting Material
    case BASE_ITEM_CRAFTMATERIALMED: return "Crafting Material"; break;
    case BASE_ITEM_CREATUREITEM: // Creature Item
    case BASE_ITEM_CSLSHPRCWEAP: // Creature Item
    case BASE_ITEM_CBLUDGWEAPON: // Creature Item
    case BASE_ITEM_CPIERCWEAPON: // Creature Item
    case BASE_ITEM_CSLASHWEAPON: return "Creature Item"; break;
    case BASE_ITEM_ENCHANTED_POTION:
    case BASE_ITEM_BLANK_POTION: return "Potion"; break;
    case BASE_ITEM_SPELLSCROLL: // Scroll
    case BASE_ITEM_SCROLL: // Scorll
    case BASE_ITEM_ENCHANTED_SCROLL: // Scroll
    case BASE_ITEM_BLANK_SCROLL: return "Scroll"; break;
    case BASE_ITEM_ENCHANTED_WAND: // Wand
    case BASE_ITEM_BLANK_WAND: return "Wand"; break;
    case BASE_ITEM_GEM: return "Gem"; break;
    case BASE_ITEM_HEALERSKIT: return "Healer Kit"; break;
    case BASE_ITEM_KEY: return "Key"; break;
    case BASE_ITEM_LARGEBOX: return "Large Box"; break;
    case BASE_ITEM_MISCLARGE: // Misc Item
    case BASE_ITEM_MISCMEDIUM: // Misc Item
    case BASE_ITEM_MISCSMALL: // Misc Item
    case BASE_ITEM_MISCTALL: // Misc Item
    case BASE_ITEM_MISCTHIN: // Misc Item
    case BASE_ITEM_MISCWIDE: return "Misc Item"; break;
    case BASE_ITEM_SHURIKEN: return "Shuriken"; break;
    case BASE_ITEM_THIEVESTOOLS: return "Thieves Tools"; break;
    case BASE_ITEM_THROWINGAXE: return "Throwing Axe"; break;
    case BASE_ITEM_TORCH: return "Torch"; break;
    case BASE_ITEM_TRAPKIT: return "Trap Kit"; break;
    case BASE_ITEM_BASTARDSWORD: return "Bastard Sword"; break;
    case BASE_ITEM_BATTLEAXE: return "BattleAxe"; break;
    case BASE_ITEM_BELT: return "Belt"; break;
    case BASE_ITEM_BOOK: return "Book"; break;
    case BASE_ITEM_BOOTS: return "Boots"; break;
    case BASE_ITEM_BRACER: return "Bracer"; break;
    case BASE_ITEM_CLOAK: return "Cloak"; break;
    case BASE_ITEM_CLUB: return "Club"; break;
    case BASE_ITEM_DAGGER: return "Dagger"; break;
    case BASE_ITEM_DIREMACE: return "DireMace"; break;
    case BASE_ITEM_DOUBLEAXE: return "DoubleAxe"; break;
    case BASE_ITEM_DWARVENWARAXE: return "DwarvenWaraxe"; break;
    case BASE_ITEM_GLOVES: return "Gloves"; break;
    case BASE_ITEM_GOLD: return "Gold"; break;
    case BASE_ITEM_GREATAXE: return "GreatAxe"; break;
    case BASE_ITEM_GREATSWORD: return "Greatsword"; break;
    case BASE_ITEM_HALBERD: return "Halberd"; break;
    case BASE_ITEM_HANDAXE: return "Handaxe"; break;
    case BASE_ITEM_HEAVYCROSSBOW: return "Heavy Crossbow"; break;
    case BASE_ITEM_HEAVYFLAIL: return "Heavy Flail"; break;
    case BASE_ITEM_HELMET: return "Helmet"; break;
    case BASE_ITEM_KAMA: return "Kama"; break;
    case BASE_ITEM_KATANA: return "Katana"; break;
    case BASE_ITEM_KUKRI: return "Kukri"; break;
    case BASE_ITEM_LARGESHIELD: return "Large Shield"; break;
    case BASE_ITEM_LIGHTCROSSBOW: return "Light Crossbow"; break;
    case BASE_ITEM_LIGHTFLAIL: return "Light Flail"; break;
    case BASE_ITEM_LIGHTHAMMER: return "Light Hammer"; break;
    case BASE_ITEM_LIGHTMACE: return "Mace"; break;
    case BASE_ITEM_LONGBOW: return "Longbow"; break;
    case BASE_ITEM_LONGSWORD: return "Longsword"; break;
    case BASE_ITEM_MAGICROD: return "MagicRod"; break;
    case BASE_ITEM_MAGICSTAFF: return "Magic Staff"; break;
    case BASE_ITEM_MAGICWAND: return "Magic Wand"; break;
    case BASE_ITEM_MORNINGSTAR: return "Morningstar"; break;
    case BASE_ITEM_POTIONS: return "Potion"; break;
    case BASE_ITEM_QUARTERSTAFF: return "Quaterstaff"; break;
    case BASE_ITEM_RAPIER: return "Rapier"; break;
    case BASE_ITEM_RING: return "Ring"; break;
    case BASE_ITEM_SCIMITAR: return "Scimiter"; break;
    case BASE_ITEM_SCYTHE: return "Scythe"; break;
    case BASE_ITEM_SHORTBOW: return "Shortbow"; break;
    case BASE_ITEM_SHORTSPEAR: return "Spear"; break;
    case BASE_ITEM_SHORTSWORD: return "Shortsword"; break;
    case BASE_ITEM_SICKLE: return "Sickle"; break;
    case BASE_ITEM_SLING: return "Sling"; break;
    case BASE_ITEM_SMALLSHIELD: return "Small Shield"; break;
    case BASE_ITEM_TOWERSHIELD: return "Tower Shield"; break;
    case BASE_ITEM_TWOBLADEDSWORD: return "Two-Bladed Sword"; break;
    case BASE_ITEM_WARHAMMER: return "Warhammer"; break;
    case BASE_ITEM_WHIP: return "Whip"; break;
    default: return "Gold"; break;
  }
return "Gold";
}
// Color Text Constsants
const string TXT_COLOR_GRAY       = "<c°°°>"; // Gray
const string TXT_COLOR_WHITE      = "<cóóó>"; // White
const string TXT_COLOR_CYAN       = "<c óó>"; // Light Cyan
const string TXT_COLOR_MAGENTA    = "<có ó>"; // Magenta
const string TXT_COLOR_YELLOW     = "<cóó >"; // Yellow
const string TXT_COLOR_RED        = "<có  >"; // Red
const string TXT_COLOR_ORANGE     = "<cþf >"; // Orange
const string TXT_COLOR_GREEN      = "<c ó >"; // Green
const string TXT_COLOR_LIGHT_BLUE = "<cfÌþ>"; // Light BlueBlue
const string TXT_COLOR_DARK_BLUE  = "<c fþ>"; // Dark Blue
const string TXT_COLOR_PURPLE     = "<cÌwþ>"; // Purple
const string TXT_COLOR_NONE       = "";       // Default (no color)
const string TXT_COLOR_END        = "</c>";   // (color end TAG)
const string TXT_COLOR_DEFAULT    = TXT_COLOR_YELLOW;

// Function changes color of the string
// * Param sText - text to color
// * Param sColor - parse a color constant here
// * Returns colored string
string ColorText(string sText, string sColor);
string ColorText(string sText, string sColor)
{
    return sColor + sText + TXT_COLOR_END;
}
void SendMessageToAllPCs(string sMessage)
{
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {
        SendMessageToPC(oPC, sMessage);
        oPC = GetNextPC();
    }
}
void SendMsgToFactionWithinDistance(object oPC, string sMessage, float fDist)
{
    object oFaction = GetFirstFactionMember(oPC),
           oArea = GetArea(oPC);
    while (GetIsObjectValid(oFaction))
    {
        if (GetArea(oFaction) == oArea && GetDistanceBetween(oPC, oFaction) <= fDist)
        {
            DelayCommand(0.3, SendMessageToPC(oFaction, sMessage));
        }
        oFaction = GetNextFactionMember(oPC);
    }
}

// Apply bounty flag
void ApplyBountyFlag(object oPC)
{
    object oItem = GetItemPossessedBy(oPC, "sf_recall");

    int iBounty = GetLocalInt(oItem, "BOUNTY");

    if(iBounty > 0 && iBounty < 10)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_FLAG_RED)), oPC);
    }
    else if(iBounty >= 10 && iBounty <= 99)
    {
        effect eEffect = GetFirstEffect(oPC);
        while(GetIsEffectValid(eEffect))
        {
            if (eEffect == EffectVisualEffect(VFX_DUR_FLAG_RED))
            {
                RemoveEffect(oPC, eEffect);
            }
            eEffect = GetNextEffect(oPC);
        }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_FLAG_PURPLE_FIXED)), oPC);
    }

    else if(iBounty >= 100)
    {
        effect eEffect = GetFirstEffect(oPC);
        while(GetIsEffectValid(eEffect))
        {
            if (eEffect == EffectVisualEffect(VFX_DUR_FLAG_RED))
            {
                RemoveEffect(oPC, eEffect);
            }
            eEffect = GetNextEffect(oPC);
        }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_FLAG_GOLD_FIXED)), oPC);
    }
}
/*int GetIsAlphaNumericValid(string sLetter)
{
    if(sLetter==""    ||sLetter==" " ||sLetter=="a"    ||sLetter=="A"
    ||sLetter=="b"    ||sLetter=="B" ||sLetter=="c"    ||sLetter=="C"
    ||sLetter=="d"    ||sLetter=="D" ||sLetter=="e"    ||sLetter=="E"
    ||sLetter=="f"    ||sLetter=="F" ||sLetter=="g"    ||sLetter=="G"
    ||sLetter=="h"    ||sLetter=="H" ||sLetter=="i"    ||sLetter=="I"
    ||sLetter=="j"    ||sLetter=="J" ||sLetter=="k"    ||sLetter=="K"
    ||sLetter=="l"    ||sLetter=="L" ||sLetter=="m"    ||sLetter=="M"
    ||sLetter=="n"    ||sLetter=="N" ||sLetter=="o"    ||sLetter=="O"
    ||sLetter=="p"    ||sLetter=="P" ||sLetter=="q"    ||sLetter=="Q"
    ||sLetter=="r"    ||sLetter=="R" ||sLetter=="s"    ||sLetter=="S"
    ||sLetter=="t"    ||sLetter=="T" ||sLetter=="u"    ||sLetter=="U"
    ||sLetter=="v"    ||sLetter=="V" ||sLetter=="w"    ||sLetter=="W"
    ||sLetter=="x"    ||sLetter=="X" ||sLetter=="y"    ||sLetter=="Y"
    ||sLetter=="z"    ||sLetter=="Z" ||sLetter=="0"    ||sLetter=="1"
    ||sLetter=="2"    ||sLetter=="3" ||sLetter=="4"    ||sLetter=="5"
    ||sLetter=="6"    ||sLetter=="7" ||sLetter=="8"    ||sLetter=="9"
    ||sLetter=="'")
    {
        return TRUE;
    }
    return FALSE;

}
*/
void StripPC(object oPC)
{
    object oItem = GetFirstItemInInventory(oPC);
    int iGold = GetGold(oPC);

    while (GetIsObjectValid(oItem))
    {
        DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }

    //ClearAllActions(FALSE);
    AssignCommand(oPC, TakeGoldFromCreature(iGold, oPC, TRUE));
    CreateItemOnObject("sf_recall", oPC);
    CreateItemOnObject("wand_pc_dislike", oPC);
    CreateItemOnObject("legendarylevel", oPC);
    CreateItemOnObject("rodfastcast", oPC);
    //CreateItemOnObject("languages", oPC);
    CreateItemOnObject("chatcommands", oPC);
   // CreateItemOnObject("wand_ilr", oPC);
    CreateItemOnObject("wand_bounty", oPC);
    GiveGoldToCreature(oPC, 1500);



}
/*void CheckPlayerName(object oPC)
{
    int iCount, iValid;
    string sName = GetName(oPC),
           sLetter;
    int iLength = GetStringLength(sName);

    if (iLength > 32)
    {
        SetLocalInt(oPC, "INVALID_CHARACTER", 1);
        return;
    }
    else if( iLength < 2)
    {
        SetLocalInt(oPC, "INVALID_CHARACTER", 2);
        return;
    }
    for (iCount = 0; iCount < iLength; iCount ++)
    {

        sLetter = GetSubString(GetStringLeft(sName, iLength), iCount, 1);
        if (sLetter == " ") iValid ++;
        else iValid = 0;
        if (iValid > 1)
        {
            SetLocalInt(oPC, "INVALID_CHARACTER", 3);
            return;
        }
        if (iCount < 2 && sLetter == " ")
        {
            SetLocalInt(oPC, "INVALID_CHARACTER", 4);
            return;
        }
/*        if (!GetIsAlphaNumericValid(sLetter))
        {
            SetLocalInt(oPC, "INVALID_CHARACTER", 5);
            return;
        }

    }

//    StripPC(oPC);
}
*/
string GetBicFileName(object oPC) {
    string sChar, sBicName;
    string sPCName = GetStringLowerCase(GetName(oPC));
    int i, iNameLength = GetStringLength(sPCName);

    for(i=0; i < iNameLength; i++) {
        sChar = GetSubString(sPCName, i, 1);
        if (TestStringAgainstPattern("(*a|*n|*w|'|-|_)", sChar)) {
            if (sChar != " ") sBicName += sChar;
        }
    }
    return GetStringLeft(sBicName, 16);
}

void ValidateName(object oPC)
{
    string sPC = GetName(oPC);
    string sCDKey = GetPCPlayerName(oPC);
    string sBIC = GetBicFileName(oPC);
//    if(GetCampaignString("PC_NAME", GetBicFileName(oPC), oPC) == sCDKey)
    if(GetCampaignString("PC_NAME", sCDKey, oPC) == sBIC)
    {
        PopUpDeathGUIPanel(oPC, FALSE, FALSE, 0, " CANNOT HAVE MULTIPLE FILES WITH SAME <cú>.BIC Filename"
        +"  .BIC file <cóóó>" + sBIC + "</c> already exist!");
        SpeakString(sPC+"<cóóó> has a duplicate .BIC File!  .BIC Filename <cú>"+ sBIC + "</c> already exist!", TALKVOLUME_SHOUT);
        AssignCommand(oPC, ClearAllActions());
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,  EffectBlindness(), oPC);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,  EffectCutsceneImmobilize(), oPC);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,  EffectCutsceneGhost(), oPC);
        return;
    }
    else

        SendMessageToPC(oPC, "<cú>Original .BIC File.");
        SetCampaignString("PC_NAME", sCDKey, sBIC, oPC);
        StripPC(oPC);
//        SetCampaignString("PC_NAME", GetBicFileName(oPC), sCDKey, oPC);
}

void ReLevel(object oPC)
{
    int nHD = GetHitDice(oPC);
    int nNewXP = (((nHD*(nHD-1))/2*1000)-1);
    SetXP(oPC, nNewXP);
}

//void main () {}
