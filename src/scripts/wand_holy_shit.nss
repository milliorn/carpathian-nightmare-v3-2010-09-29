//Special Effects Wand
#include "x2_inc_switches"
void main()
{
object oUser = GetItemActivator(),
  oActivator = GetItemActivated(),
     oTarget = GetItemActivatedTarget();
string sName = GetPCPublicCDKey(oUser);
int iDur = DURATION_TYPE_INSTANT;

if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE) return;

    if (sName == "QG6CXEYC" || //milliorn
        sName == "Q76A43RL" || //milliorn
        sName == "QCRWUXFF" || //bassmaster
        sName == "QG6QREW7" || //fooshwa
        sName == "QC74AN4H")

{

//Metal (Use this a few times together
effect eVis29 = EffectVisualEffect(72);
//DelayCommand(, ApplyEffectToObject(iDur, eVis29, oTarget));
effect eVis46 = EffectVisualEffect(289);
//DelayCommand(, ApplyEffectToObject(iDur, eVis46, oTarget));

//Starting effects
effect eVis1 = EffectVisualEffect(185);
effect eVis2 = EffectVisualEffect(186);
effect eVis3 = EffectVisualEffect(187);
effect eVis4 = EffectVisualEffect(188);
effect eVis5 = EffectVisualEffect(189);
effect eVis6 = EffectVisualEffect(190);
effect eVis7 = EffectVisualEffect(145);
ApplyEffectToObject(iDur, eVis1, oTarget);
DelayCommand(0.5, ApplyEffectToObject(iDur, eVis2, oTarget));
DelayCommand(1.0, ApplyEffectToObject(iDur, eVis3, oTarget));
DelayCommand(1.5, ApplyEffectToObject(iDur, eVis4, oTarget));
DelayCommand(1.7, ApplyEffectToObject(iDur, eVis29, oTarget));
DelayCommand(2.0, ApplyEffectToObject(iDur, eVis5, oTarget));
DelayCommand(2.5, ApplyEffectToObject(iDur, eVis6, oTarget));
DelayCommand(3.0, ApplyEffectToObject(iDur, eVis7, oTarget));
DelayCommand(3.1, ApplyEffectToObject(iDur, eVis29, oTarget));
DelayCommand(3.0, ApplyEffectToObject(iDur, eVis46, oTarget));
DelayCommand(3.2, ApplyEffectToObject(iDur, eVis46, oTarget));
//Divine
effect eVis8 = EffectVisualEffect(150);
DelayCommand(3.5, ApplyEffectToObject(iDur, eVis8, oTarget));

//Harm Spell Mantle
effect eVis9 = EffectVisualEffect(246);
effect eVis10 = EffectVisualEffect(254);
DelayCommand(4.0, ApplyEffectToObject(iDur, eVis9, oTarget));
DelayCommand(4.5, ApplyEffectToObject(iDur, eVis10, oTarget));

//Spikes Blood Fear
effect eVis11 = EffectVisualEffect(253);
effect eVis12 = EffectVisualEffect(234);
effect eVis13 = EffectVisualEffect(235);
effect eVis14 = EffectVisualEffect(219);
DelayCommand(5.0, ApplyEffectToObject(iDur, eVis11, oTarget));
DelayCommand(5.5, ApplyEffectToObject(iDur, eVis12, oTarget));
DelayCommand(5.7, ApplyEffectToObject(iDur, eVis29, oTarget));
DelayCommand(6.0, ApplyEffectToObject(iDur, eVis13, oTarget));
DelayCommand(6.5, ApplyEffectToObject(iDur, eVis14, oTarget));
DelayCommand(6.5, ApplyEffectToObject(iDur, eVis46, oTarget));


//Rings
effect eVis15 = EffectVisualEffect(191);
effect eVis16 = EffectVisualEffect(192);
effect eVis17 = EffectVisualEffect(193);
effect eVis18 = EffectVisualEffect(86);
effect eVis19 = EffectVisualEffect(87);
effect eVis20 = EffectVisualEffect(88);
effect eVis21 = EffectVisualEffect(89);
effect eVis22 = EffectVisualEffect(264);
effect eVis23 = EffectVisualEffect(265);
effect eVis24 = EffectVisualEffect(266);
DelayCommand(7.0, ApplyEffectToObject(iDur, eVis15, oTarget));
DelayCommand(7.2, ApplyEffectToObject(iDur, eVis16, oTarget));
DelayCommand(7.6, ApplyEffectToObject(iDur, eVis17, oTarget));
DelayCommand(7.7, ApplyEffectToObject(iDur, eVis18, oTarget));
DelayCommand(8.0, ApplyEffectToObject(iDur, eVis19, oTarget));
DelayCommand(8.3, ApplyEffectToObject(iDur, eVis20, oTarget));
DelayCommand(8.5, ApplyEffectToObject(iDur, eVis21, oTarget));
DelayCommand(8.7, ApplyEffectToObject(iDur, eVis29, oTarget));
DelayCommand(8.9, ApplyEffectToObject(iDur, eVis22, oTarget));
DelayCommand(9.1, ApplyEffectToObject(iDur, eVis23, oTarget));
DelayCommand(9.2, ApplyEffectToObject(iDur, eVis24, oTarget));
DelayCommand(9.4, ApplyEffectToObject(iDur, eVis29, oTarget));

//Blind Dispell
effect eVis25 = EffectVisualEffect(18);
effect eVis26 = EffectVisualEffect(19);
effect eVis27 = EffectVisualEffect(20);
effect eVis28 = EffectVisualEffect(21);
DelayCommand(10.0, ApplyEffectToObject(iDur, eVis25, oTarget));
DelayCommand(10.5, ApplyEffectToObject(iDur, eVis26, oTarget));
DelayCommand(11.0, ApplyEffectToObject(iDur, eVis27, oTarget));
DelayCommand(11.5, ApplyEffectToObject(iDur, eVis28, oTarget));

//Lightning
effect eVis30 = EffectVisualEffect(74);
DelayCommand(12.5, ApplyEffectToObject(iDur, eVis30, oTarget));
DelayCommand(12.5, ApplyEffectToObject(iDur, eVis46, oTarget));

//Summons
effect eVis31 = EffectVisualEffect(34);
effect eVis32 = EffectVisualEffect(35);
effect eVis33 = EffectVisualEffect(36);
DelayCommand(13.0, ApplyEffectToObject(iDur, eVis31, oTarget));
DelayCommand(13.5, ApplyEffectToObject(iDur, eVis32, oTarget));
DelayCommand(14.0, ApplyEffectToObject(iDur, eVis33, oTarget));
DelayCommand(14.2, ApplyEffectToObject(iDur, eVis29, oTarget));

//Death Magic
effect eVis34 = EffectVisualEffect(41);
effect eVis35 = EffectVisualEffect(38);
effect eVis37 = EffectVisualEffect(39);
effect eVis38 = EffectVisualEffect(23);
effect eVis39 = EffectVisualEffect(24);
effect eVis40 = EffectVisualEffect(50);
DelayCommand(14.5, ApplyEffectToObject(iDur, eVis34, oTarget));
DelayCommand(15.0, ApplyEffectToObject(iDur, eVis35, oTarget));
DelayCommand(16.0, ApplyEffectToObject(iDur, eVis37, oTarget));
DelayCommand(16.5, ApplyEffectToObject(iDur, eVis38, oTarget));
DelayCommand(17.0, ApplyEffectToObject(iDur, eVis39, oTarget));
DelayCommand(17.5, ApplyEffectToObject(iDur, eVis40, oTarget));


//Heal and rez effects
effect eVis41 = EffectVisualEffect(70);
effect eVis42 = EffectVisualEffect(184);
effect eVis43 = EffectVisualEffect(90);
effect eVis44 = EffectVisualEffect(144);
effect eVis45 = EffectVisualEffect(98);
DelayCommand(18.0, ApplyEffectToObject(iDur, eVis41, oTarget));
DelayCommand(18.5, ApplyEffectToObject(iDur, eVis42, oTarget));
DelayCommand(19.0, ApplyEffectToObject(iDur, eVis43, oTarget));
DelayCommand(19.5, ApplyEffectToObject(iDur, eVis44, oTarget));
DelayCommand(20.0, ApplyEffectToObject(iDur, eVis45, oTarget));


//PWKILL PWSTUN
effect eVis50 = EffectVisualEffect(VFX_FNF_PWKILL);
effect eVis51 = EffectVisualEffect(VFX_FNF_PWSTUN);
DelayCommand(20.5, ApplyEffectToObject(iDur, eVis50, oTarget));
DelayCommand(21.0, ApplyEffectToObject(iDur, eVis51, oTarget));

//Animations
DelayCommand(4.5, AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
DelayCommand(5.0, AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
DelayCommand(5.5, AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
DelayCommand(6.0, AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
DelayCommand(6.5, AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
DelayCommand(7.0, AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
DelayCommand(7.5, AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
DelayCommand(8.0, AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
DelayCommand(8.5, AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK)));
DelayCommand(9.0, AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT)));
DelayCommand(9.5, AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK, 1.0, 999.0)));

//Speach
DelayCommand(3.0, AssignCommand(oTarget, SpeakString("HOLY SHIT")));
DelayCommand(3.0, PlayVoiceChat(VOICE_CHAT_PAIN1, oTarget));
DelayCommand(9.0, AssignCommand(oTarget, SpeakString("WHAT THE FUCK!!!")));
DelayCommand(9.0, PlayVoiceChat(VOICE_CHAT_LAUGH, oTarget));
DelayCommand(16.0, AssignCommand(oTarget, SpeakString("THIS IS SOME GOOD FUCKING SHIT")));
DelayCommand(16.0, PlayVoiceChat(VOICE_CHAT_DEATH, oTarget));
DelayCommand(24.0, AssignCommand(oTarget, SpeakString("GOD DAMN, WHAT A RUSH")));
DelayCommand(24.0, PlayVoiceChat(VOICE_CHAT_CHEER, oTarget));

    }
else
    {
        SendMessageToAllDMs("<có  >Player </c>"+GetName(oUser)+"<có  > is trying to use a DM item");
        DestroyObject(oActivator);
    }
}
