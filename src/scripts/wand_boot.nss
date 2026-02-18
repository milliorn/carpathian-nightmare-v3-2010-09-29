//Boot PC item script
#include "x2_inc_switches"
void main()
{
    object oActivator = GetItemActivator(),
           oBoot = GetItemActivated(),
           oTarget = GetItemActivatedTarget();
    string sName1 = GetName(oTarget);
    string sName = GetPCPublicCDKey(oActivator);
    if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE) return;

    if (sName == "QG6CXEYC" || //milliorn
        sName == "Q76A43RL" || //milliorn
        sName == "QCRWUXFF" || //bassmaster
        sName == "QG6QREW7" || //fooshwa
        sName == "QC74AN4H")

    {
        effect ekick  = EffectVisualEffect(VFX_IMP_HARM),
               ekick2 = EffectVisualEffect(VFX_IMP_MIRV_FLAME),
               ekick3 = EffectVisualEffect(VFX_IMP_GOOD_HELP),
               ekick4 = EffectVisualEffect(VFX_IMP_GOOD_HELP),
               ekick5 = EffectVisualEffect(VFX_IMP_GOOD_HELP),
               ekick6 = EffectVisualEffect(VFX_IMP_GOOD_HELP),
               ekick7 = EffectVisualEffect(VFX_IMP_GOOD_HELP),
               ekick8 = EffectVisualEffect(VFX_IMP_GOOD_HELP),
               ekick9 = EffectVisualEffect(VFX_IMP_GOOD_HELP),
               ekick10 = EffectVisualEffect(VFX_IMP_GOOD_HELP),
               ekick11 = EffectVisualEffect(VFX_IMP_GOOD_HELP),
               ekick12 = EffectVisualEffect(VFX_IMP_GOOD_HELP),
               ekick13 = EffectVisualEffect(VFX_IMP_EVIL_HELP);
        DelayCommand(0.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick,oTarget));
        DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick2,oTarget));
        DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick3,oTarget));
        DelayCommand(3.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick4,oTarget));
        DelayCommand(4.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick5,oTarget));
        DelayCommand(5.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick6,oTarget));
        DelayCommand(6.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick7,oTarget));
        DelayCommand(7.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick8,oTarget));
        DelayCommand(8.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick9,oTarget));
        DelayCommand(9.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick10,oTarget));
        DelayCommand(10.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick11,oTarget));
        DelayCommand(11.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick12,oTarget));
        DelayCommand(12.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,ekick13,oTarget));
        DelayCommand(0.0,AssignCommand(oTarget,SpeakString("aaaaa noooooo!!",TALKVOLUME_TALK)));
        DelayCommand(1.0,AssignCommand(oTarget,SpeakString("i will be booted in 10 seconds",TALKVOLUME_TALK)));
        DelayCommand(2.0,AssignCommand(oTarget,SpeakString("[10]",TALKVOLUME_TALK)));
        DelayCommand(3.0,AssignCommand(oTarget,SpeakString("[9]",TALKVOLUME_TALK)));
        DelayCommand(4.0,AssignCommand(oTarget,SpeakString("[8]",TALKVOLUME_TALK)));
        DelayCommand(5.0,AssignCommand(oTarget,SpeakString("[7]",TALKVOLUME_TALK)));
        DelayCommand(6.0,AssignCommand(oTarget,SpeakString("[6]",TALKVOLUME_TALK)));
        DelayCommand(7.0,AssignCommand(oTarget,SpeakString("[5]",TALKVOLUME_TALK)));
        DelayCommand(8.0,AssignCommand(oTarget,SpeakString("[4]",TALKVOLUME_TALK)));
        DelayCommand(9.0,AssignCommand(oTarget,SpeakString("[3]",TALKVOLUME_TALK)));
        DelayCommand(11.0,AssignCommand(oTarget,SpeakString("[2]",TALKVOLUME_TALK)));
        DelayCommand(12.0,AssignCommand(oTarget,SpeakString("[1]",TALKVOLUME_TALK)));
        DelayCommand(12.5,AssignCommand(oTarget,SpeakString("Bye Bye All",TALKVOLUME_TALK)));
        DelayCommand(3.0, AssignCommand(oTarget, PlayVoiceChat(VOICE_CHAT_HOLD)));
        DelayCommand(1.0, AssignCommand(oTarget, PlayVoiceChat(VOICE_CHAT_BADIDEA)));
        DelayCommand(9.0, AssignCommand(oTarget, PlayVoiceChat(VOICE_CHAT_HELP)));
        DelayCommand(12.0, AssignCommand(oTarget, PlayVoiceChat(VOICE_CHAT_GOODBYE)));
        DelayCommand(12.0, AssignCommand(oTarget, PlayAnimation(ANIMATION_FIREFORGET_GREETING)));
        DelayCommand(13.0,BootPC(oTarget));
        DelayCommand(13.0, SpeakString(sName1+" has been booted from the server", TALKVOLUME_SHOUT));
    }
    else
    {
        SendMessageToPC(oActivator, "You cannot use this item");
        SendMessageToAllDMs("<có  >Player </c>"+sName+"<có  > is trying to use a DM item");
        DestroyObject(oBoot);
    }
}
