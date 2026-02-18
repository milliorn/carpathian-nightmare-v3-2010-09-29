void main()
{
    if (!GetIsDM(OBJECT_SELF) && GetIsPC(OBJECT_SELF))
    {
        if (!GetCutsceneMode(OBJECT_SELF))
        if (GetPlotFlag(OBJECT_SELF))
        {
            SetPlotFlag(OBJECT_SELF, FALSE);
//           SendMessageToAllDMs(GetName(OBJECT_SELF) + " was flagged as PLOT!!! PLOT flag has been removed.");
        }

        if (GetImmortal(OBJECT_SELF))
        {
            SetImmortal(OBJECT_SELF, FALSE);
//            SendMessageToAllDMs(GetName(OBJECT_SELF) + " was flagged as IMMORTAL!!! IMMORTAL flag has been removed.");
        }
    }
}
