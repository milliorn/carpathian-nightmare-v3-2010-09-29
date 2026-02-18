int StartingConditional()
{
    object oModule = GetModule();
    if (GetLocalInt(oModule, "STOP_BANK") == 1) return TRUE;
    return FALSE;
}

