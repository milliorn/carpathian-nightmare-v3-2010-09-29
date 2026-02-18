//Penguin Player effect script
#include "penguin_inc"
void main()
{
    effect eEffect = EffectPolymorph(POLYMORPH_TYPE_CHICKEN, TRUE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);
    eEffect = EffectPetrify();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);
    SpeakString(sName1+" Has been polymorphed into a chicken for being a fruit "+sName, TALKVOLUME_SHOUT);
}
