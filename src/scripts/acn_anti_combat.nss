#include "NW_I0_GENERIC"
void main()
{
    object oDest;
    object oPC = GetClickingObject();
    string sArea = GetTag(GetArea(oPC));
    string sName = GetName(oPC);

    if(GetIsFighting(oPC) || GetIsInCombat(oPC))
    {
        if(sArea == "SilesianBeskids")
        {
            object oDest = GetWaypointByTag("NW_SilesianBeskids");
            ClearAllActions();
            AssignCommand(oPC, JumpToLocation(GetLocation(oDest)));
            SendMessageToPC(oPC, "<cþf >"+sName+"</c> cannot run into Carpathia while in Combat");
            SendMessageToAllDMs("<cþf >"+sName+"</c> attempted to run into Carpathia while in Combat");
            FloatingTextStringOnCreature("<cþf >"+sName+"</c> cannot run into "+
            "Carpathia while in Combat", oPC, TRUE);
            return;
        }

        else if(sArea == "OravskMaguraLower")
        {
            object oDest = GetWaypointByTag("POST_CarpathiaTown");
            AssignCommand(oPC, ActionJumpToObject(oDest, TRUE));
            SendMessageToPC(oPC, "<cþf >"+sName+"</c> cannot run into Carpathia while in Combat");
            SendMessageToAllDMs("<cþf >"+sName+"</c> attempted to run into Carpathia while in Combat");
            FloatingTextStringOnCreature("<cþf >"+sName+"</c> cannot run into "+
            "Carpathia while in Combat", oPC, TRUE);
            return;
        }

        else if(sArea == "RucarBranGroove")
        {
            object oDest = GetWaypointByTag("POST_RUCAR_BRAN_1");
            AssignCommand(oPC, ActionJumpToObject(oDest, TRUE));
            SendMessageToPC(oPC, "<cþf >"+sName+"</c> cannot run into Carpathia while in Combat");
            SendMessageToAllDMs("<cþf >"+sName+"</c> attempted to run into Carpathia while in Combat");
            FloatingTextStringOnCreature("<cþf >"+sName+"</c> cannot run into "+
            "Carpathia while in Combat", oPC, TRUE);
            return;
        }

        else if(sArea == "CarpathianForest")
        {
            object oDest = GetWaypointByTag("POST_Carpathia_Forest1");
            AssignCommand(oPC, ActionJumpToObject(oDest, TRUE));
            SendMessageToAllDMs("<cþf >"+sName+"</c> attempted to run into Carpathia while in Combat");
            SendMessageToPC(oPC, "<cþf >"+sName+"</c> cannot run into Carpathia while in Combat");
            FloatingTextStringOnCreature("<cþf >"+sName+"</c> cannot run into "+
            "Carpathia while in Combat", oPC, TRUE);
            return;
        }

        else if(sArea == "MoravianGate")
        {
            object oDest = GetWaypointByTag("POST_MoravianGate");
            AssignCommand(oPC, ActionJumpToObject(oDest, TRUE));
            SendMessageToAllDMs("<cþf >"+sName+"</c> attempted to run into Carpathia while in Combat");
            SendMessageToPC(oPC, "<cþf >"+sName+"</c> cannot run into Carpathia while in Combat");
            FloatingTextStringOnCreature("<cþf >"+sName+"</c> cannot run into "+
            "Carpathia while in Combat", oPC, TRUE);
            return;
        }
    }

    else
    {
        object oDest = GetTransitionTarget(OBJECT_SELF);
        ClearAllActions();
        AssignCommand(oPC, JumpToLocation(GetLocation(oDest)));
    }
}
