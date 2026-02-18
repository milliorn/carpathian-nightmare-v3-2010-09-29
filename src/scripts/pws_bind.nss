// pws_bind by Brian "spilth" Kelly
// For Neverwinter Nights - Binding Stone Tutorial
void main()
{
    object oPC = GetPCSpeaker(),
           oRecall = GetItemPossessedBy(oPC, "sf_recall");
    effect eVis = EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_HOLY);

    SetLocalString(oRecall, "BINDING", GetTag(OBJECT_SELF));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    SpeakString("<cÍf >You are now bound to the </c>" + GetTag(OBJECT_SELF));
}
