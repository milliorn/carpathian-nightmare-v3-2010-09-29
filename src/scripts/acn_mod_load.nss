//On Module Load
#include "fky_chat_inc"

void main()
{
    object oTome = GetObjectByTag("TheBookOfLegendaryLevels"),
           oModule = GetAreaFromLocation(GetStartingLocation()),
           oDial = GetObjectByTag("Sundial"),
           oBoard = GetObjectByTag("cServerListCreditsc"),
           oPit = GetObjectByTag("CenterRing"),
           oTown = GetObjectByTag("astral_sword"),
           oGary = GetObjectByTag("GaryGygaxMemorial"),
           oPedestal = GetObjectByTag("cWelcometoACarpathian"),
           oAltar = GetObjectByTag("BountyChecker");

    SQLInit();
    InitSpeech();
    WriteTimestampedLogEntry("**********SERVER LOADED**********");

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_MAGIC_RESISTANCE)), oTome);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_INFERNO_NO_SOUND)), oAltar);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_SPELLTURNING)), oDial);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_DEATH_ARMOR)), oBoard);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR)), oPit);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_ELEMENTAL_SHIELD)), oPedestal);

    DelayCommand(0.2, ExecuteScript("x2_mod_def_load", OBJECT_SELF));
    DelayCommand(0.5, ExecuteScript("sfsubr_subdwarf", OBJECT_SELF));
    DelayCommand(1.0, ExecuteScript("sfsubr_subgnome", OBJECT_SELF));
    DelayCommand(1.5, ExecuteScript("sfsubr_subplane", OBJECT_SELF));
    DelayCommand(2.0, ExecuteScript("sfsubr_subelf", OBJECT_SELF));
    DelayCommand(2.5, ExecuteScript("sfsubr_subhalf", OBJECT_SELF));
    DelayCommand(3.0, ExecuteScript("sfsubr_monster01", OBJECT_SELF));
    DelayCommand(3.5, ExecuteScript("sfsubr_subhuman", OBJECT_SELF));
    DelayCommand(4.0, ExecuteScript("sfsubr_monster02", OBJECT_SELF));
    DelayCommand(4.5, ExecuteScript("sfsubr_undead", OBJECT_SELF));
    DelayCommand(5.0, ExecuteScript("sfsubr_construct", OBJECT_SELF));
    DelayCommand(20.0, ExecuteScript("acn_db_boss_purg", OBJECT_SELF));


    SetSkyBox(Random(5), oModule);
    SetFogAmount(FOG_TYPE_ALL, d20(), oModule);

    SetSkyBox(Random(5), oTown);
    SetFogAmount(FOG_TYPE_ALL, d20(), oTown);

    SetSkyBox(Random(5), oGary);
    SetFogAmount(FOG_TYPE_ALL, d20(), oGary);

    switch (Random(16))
    {
        case 0:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLACK, oModule); break;
        case 1:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLUE, oModule); break;
        case 2:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLUE_DARK, oModule); break;
        case 3:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BROWN, oModule); break;
        case 4:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BROWN_DARK, oModule); break;
        case 5:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_CYAN, oModule); break;
        case 6:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREEN, oModule); break;
        case 7:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREEN_DARK, oModule); break;
        case 8:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREY, oModule); break;
        case 9:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_MAGENTA, oModule); break;
        case 10: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_ORANGE, oModule); break;
        case 11: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_ORANGE_DARK, oModule); break;
        case 12: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_RED, oModule); break;
        case 13: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_RED_DARK, oModule); break;
        case 14: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_WHITE, oModule); break;
        case 15: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_YELLOW, oModule); break;
        case 16: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_YELLOW_DARK, oModule); break;
    }
    switch (Random(16))
    {
        case 0:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLACK, oTown); break;
        case 1:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLUE, oTown); break;
        case 2:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLUE_DARK, oTown); break;
        case 3:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BROWN, oTown); break;
        case 4:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BROWN_DARK, oTown); break;
        case 5:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_CYAN, oTown); break;
        case 6:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREEN, oTown); break;
        case 7:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREEN_DARK, oTown); break;
        case 8:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREY, oTown); break;
        case 9:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_MAGENTA, oTown); break;
        case 10: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_ORANGE, oTown); break;
        case 11: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_ORANGE_DARK, oTown); break;
        case 12: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_RED, oTown); break;
        case 13: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_RED_DARK, oTown); break;
        case 14: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_WHITE, oTown); break;
        case 15: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_YELLOW, oTown); break;
        case 16: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_YELLOW_DARK, oTown); break;
    }
    switch (Random(16))
    {
        case 0:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLACK, oGary); break;
        case 1:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLUE, oGary); break;
        case 2:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLUE_DARK, oGary); break;
        case 3:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BROWN, oGary); break;
        case 4:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BROWN_DARK, oGary); break;
        case 5:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_CYAN, oGary); break;
        case 6:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREEN, oGary); break;
        case 7:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREEN_DARK, oGary); break;
        case 8:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREY, oGary); break;
        case 9:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_MAGENTA, oGary); break;
        case 10: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_ORANGE, oGary); break;
        case 11: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_ORANGE_DARK, oGary); break;
        case 12: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_RED, oGary); break;
        case 13: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_RED_DARK, oGary); break;
        case 14: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_WHITE, oGary); break;
        case 15: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_YELLOW, oGary); break;
        case 16: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_YELLOW_DARK, oGary); break;
    }
}
