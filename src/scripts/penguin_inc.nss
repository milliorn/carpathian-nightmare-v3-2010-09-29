//Penguin Player Include Script

object oActivator = GetItemActivator(),
       oPenguin = GetItemActivated(),
       oTarget = GetItemActivatedTarget();
string sTag = GetTag(oPenguin),
       sName1 = GetName(oTarget),
       sName = GetPCPublicCDKey(oActivator);
