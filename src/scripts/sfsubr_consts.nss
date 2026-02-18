//::///////////////////////////////////////////////
//:: Scarface's Leto Subrace System
//:: Subrace Constants Include
//:: sfsubr_consts
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//:://////////////////////////////////////////////

// Server Vault Directory - Must contain forward slash "/" NOT back slash "\"
string NWN_SERVERVAULT_DIR = "C:/NeverwinterNights/NWN/servervault/";
string NWN_2DA_DIR = "C:/NeverwinterNights/NWN/source/";

// Global Variables
object MODULE = GetModule();
const string ID_ITEM = "sf_id_item";

// Global Binary Representation Constants
const int ALLOW_USE_TRUE    = 2048;
const int ALLOW_USE_FALSE   = 4096;

// Class Type Binary Representation Constants
const int CLASS_RESTRICT_BARBARIAN = 1;
const int CLASS_RESTRICT_BARD      = 2;
const int CLASS_RESTRICT_CLERIC    = 4;
const int CLASS_RESTRICT_DRUID     = 8;
const int CLASS_RESTRICT_FIGHTER   = 16;
const int CLASS_RESTRICT_MONK      = 32;
const int CLASS_RESTRICT_PALADIN   = 64;
const int CLASS_RESTRICT_RANGER    = 128;
const int CLASS_RESTRICT_ROGUE     = 256;
const int CLASS_RESTRICT_SORCERER  = 512;
const int CLASS_RESTRICT_WIZARD    = 1024;

// Racial Type Binary Representation Constants
const int RACE_RESTRICT_DWARF      = 1;
const int RACE_RESTRICT_ELF        = 2;
const int RACE_RESTRICT_GNOME      = 4;
const int RACE_RESTRICT_HALFELF    = 8;
const int RACE_RESTRICT_HALFLING   = 16;
const int RACE_RESTRICT_HALFORC    = 32;
const int RACE_RESTRICT_HUMAN      = 64;

// Alignment Binary Representation Constants
const int ALIGN_RESTRICT_GOOD       = 1;
const int ALIGN_RESTRICT_NEUTRAL1   = 2;
const int ALIGN_RESTRICT_EVIL       = 4;
const int ALIGN_RESTRICT_LAWFUL     = 8;
const int ALIGN_RESTRICT_NEUTRAL2   = 16;
const int ALIGN_RESTRICT_CHAOTIC    = 32;

// Equipment Size Binary Representation Constants
const int EQUIP_RESTRICT_WEAPON_TINY    = 1;
const int EQUIP_RESTRICT_WEAPON_SMALL   = 2;
const int EQUIP_RESTRICT_WEAPON_MEDIUM  = 4;
const int EQUIP_RESTRICT_WEAPON_LARGE   = 8;
const int EQUIP_RESTRICT_ARMOUR_CLOTH   = 16;
const int EQUIP_RESTRICT_ARMOUR_LIGHT   = 32;
const int EQUIP_RESTRICT_ARMOUR_MEDIUM  = 64;
const int EQUIP_RESTRICT_ARMOUR_HEAVY   = 128;
const int EQUIP_RESTRICT_SHIELD_SMALL   = 256;
const int EQUIP_RESTRICT_SHIELD_LARGE   = 512;
const int EQUIP_RESTRICT_SHIELD_TOWER   = 1024;

// Wing Types - [Normal]
const int WINGS_TYPE_NONE          = 0;
const int WINGS_TYPE_DEMON         = 1;
const int WINGS_TYPE_ANGEL         = 2;
const int WINGS_TYPE_BAT           = 3;
const int WINGS_TYPE_DRAGON_RED    = 4;
const int WINGS_TYPE_BUTTERFLY     = 5;
const int WINGS_TYPE_BIRD          = 6;

// Wing Types - [CEP]
const int WINGS_TYPE_ERINYES       = 30;
const int WINGS_TYPE_BIRD_RED      = 31;
const int WINGS_TYPE_BIRD_BLACK    = 32;
const int WINGS_TYPE_BIRD_BLUE     = 33;
const int WINGS_TYPE_DRAGON_BLACK  = 34;
const int WINGS_TYPE_DRAGON_BLUE   = 35;
const int WINGS_TYPE_DRAGON_BRASS  = 36;
const int WINGS_TYPE_DRAGON_BRONZE = 37;
const int WINGS_TYPE_DRAGON_COPPER = 38;
const int WINGS_TYPE_DRAGON_GOLD   = 39;
const int WINGS_TYPE_DRAGON_GREEN  = 40;
const int WINGS_TYPE_DRAGON_SILVER = 41;
const int WINGS_TYPE_DRAGON_WHITE  = 42;

// Tail Types
const int TAIL_TYPE_NONE           = 0;
const int TAIL_TYPE_LIZARD         = 1;
const int TAIL_TYPE_BONE           = 2;
const int TAIL_TYPE_DEVIL          = 3;

// Character Movement Speed
const int CHARACTER_SPEED_PC        = 0;
const int CHARACTER_SPEED_IMMOBILE  = 1;
const int CHARACTER_SPEED_VERYSLOW  = 2;
const int CHARACTER_SPEED_SLOW      = 3;
const int CHARACTER_SPEED_NORMAL    = 4;
const int CHARACTER_SPEED_FAST      = 5;
const int CHARACTER_SPEED_VERYFAST  = 6;
const int CHARACTER_SPEED_DEFAULT   = 7;
const int CHARACTER_SPEED_DM        = 8;

// Item ResRefs/Tags
const string DEFAULT_SUBRACE_HIDE = "sfsubr_hide";

// Subrace Messages
const string APPLYING_SUBRACE = "<cþ>Your subrace is being applied to your character. Please wait a moment.</c>";
const string APPLYING_SUBRACE_SKIN = "<cþ>Your subrace skin is being applied to your character.</c>";
const string APPLYING_SUBRACE_CLAW = "<cþ>Your subrace claws are being appliedto your character.</c>";
const string APPLYING_SPELL_RESISTANCE = "<cþ>Your subrace spell resistance is being applied to your character.</c>";
const string SUBRACE_ITEMS_APPLIED = "<cþ>Your subrace items have been applied to your character.</c>";
const string INVALID_SUBRACE = "<cþ>Error:</c> <cþþþ>The subrace name you have entered doesn't exist.</c>";
const string INVALID_CLASS = "<cþ>Error:</c> <cþþþ>You have chosen an incorrect class for this subrace.</c>";
const string INVALID_RACE = "<cþ>Error:</c> <cþþþ>You have chosen an incorrect race for this subrace.</c>";
const string INVALID_ALIGNMENT = "<cþ>Error:</c> <cþþþ>You have chosen an incorrect alignment for this subrace.</c>";
const string INVALID_EQUIPMENT = "<cþ>Error:</c> <cþþþ>You can't equip this type of item onto your subrace.</c>";
const string RELEVEL_CHARACTER = "<cþþþ>You must re-level your character.</c>";
