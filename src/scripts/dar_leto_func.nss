#include "dar_config"

// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

/*
Use:
    string output = leto_script(script);
    string bicfile = GetBicFileName(oPC); Returns the name of a .bic file.
    string bicpath = GetBicPath(oPC); Retruns the full path to a .bic file.
*/

/* converted from Phoenix to Unicorn by FunkySwerve with huge amounts of help
from dragonsong. Comments are mostly dragonsong's (DS). Old Phoneix script is
commented out and precedes the new Unicorn script for each function. */

//No change. This is pure bridge code, and the syntax there has hardly moved at all.(DS)
string LetoScript(string script) {
    // Stores a var in the module which NWNX LETO then takes and works with.
    SetLocalString(GetModule(), "NWNX!LETO!SCRIPT", script);
    // Gets the var now changed by NWNX LETO back from the module and returns it.
    return GetLocalString(GetModule(), "NWNX!LETO!SCRIPT");
}

/*
string LetoOpen(string file, string handler = "") {
    if(handler == "") handler = "TEMP";
    return "<file:open "+handler+" <qq:"+file+">>";
}
*/
string LetoOpen(string file, string handler = "") {
    // %HANDLE = q<path/to/file.bic> (DS)
    // Note the use of q// as q<> (DS)
    if(handler == "") handler = "TEMP";
    return "%"+handler+" = q<"+file+">;";
}

/*
string LetoClose(string handler = "") {
    if(handler == "") handler = "TEMP";
    return "<file:close "+handler+">";
}
*/
string LetoClose(string handler = "") {
    // close %HANDLE (DS)
    if(handler == "") handler = "TEMP";
    return "close %"+handler+";";
}

/*
string LetoSave(string file, string handler = "") {
    if(handler == "") handler = "TEMP";
    return "<file:save "+file+" <qq:"+file+">>";
}
*/
string LetoSave(string file, string handler = "") {
    // %HANDLE = q?>/save/as/file.bic? (DS)
    // Note the use of q// as q?? (DS)
    // The > indicates a file-save. (DS)
    if(handler == "") handler = "TEMP";
    return "%"+handler+" = q?>"+file+"?;";
}

/*
int GetDocumentedLevel(object oPC) {
    return StringToInt(LetoScript(LetoOpen(GetLocalString(oPC, "BicFilePath"))+"<Lootable>"+LetoClose()));
}
*/

int GetDocumentedLevel(object oPC) {
    return StringToInt(
      LetoScript(
        LetoOpen(GetLocalString(oPC, "BicFilePath")) +
        "print /Lootable;" +
        LetoClose()
      )
    );
}

/*
string SetDocumentedLevel(int level = 1) {
    string script = "";
    if(level > -1) script = "<gff:set 'Lootable' {value="+IntToString(level)+"}>";

    return script;
}
*/
string SetDocumentedLevel(int level = 1) {
    string script = "";
    if(level > -1) script = "/Lootable = "+IntToString(level)+";";

    return script;
}

/*
string ModifyProperty(string property, int modifier) {
    if(modifier == 0) return "";
    return "<gff:set '"+property+"' {value=(<"+property+">+"+IntToString(modifier)+")}>";
}
*/
//DS's conversion (wrong I think)
/*
string ModifyProperty(string property, int modifier) {
    if(modifier == 0) return "";
    return "/"+property+" = "+IntToString(modifier)+";";
}
*/
//my conversion
string ModifyProperty(string property, int modifier) {
    if(modifier == 0) return "";
    return "/"+property+" = /"+property+"+"+IntToString(modifier)+";";
}

//this function no longer used since Bioware's 1.65 patch prevented PC's from having these abilities
/*
string AddSpell(int iSpell = -1, int iAmount = 1, int iLevel = 1) {
    if(iSpell < 0 || iLevel < 0 || iAmount < 1) return "";

    string script = "";
    int i;
    string sSpell = IntToString(iSpell);
    string sAmount = IntToString(iAmount);
    string sLevel = IntToString(iLevel);

    PrintString("Adding spell... Name: "+sSpell+" | Amount: "+sAmount+" | Level: "+sLevel);
    for(i=0; i < iAmount; i++) {
        script +=
            "<gff:add 'SpecAbilityList/Spell' {type='word' value="+sSpell+"}>"+
            "<gff:add 'SpecAbilityList/[_]/SpellFlags' {type='byte' value=1}>"+
            "<gff:add 'SpecAbilityList/[_]/SpellCasterLevel' {type='byte' value="+sLevel+"}>";
    }

    return script;
}
*/
//end no longer used function

/*
string AddFeat(int iFeat = -1) {
    if(iFeat < 0) return "";
    return
        "<gff:add 'FeatList/Feat' {type='word' value="+IntToString(iFeat)+"}>"+
        "<gff:add 'LvlStatList/[0]/FeatList/Feat' {type='word' value="+IntToString(iFeat)+"}>";
}
*/

//The function add (fully qualified: gff.add) takes three standard arguments: Name, Value, Type. (DS)
//Value is the value you want to assign to the Field. LetoScript does not have strong typing
//(the underlying engine disambiguates into Delphi's strong types), so you can pass in a number or a string,
//and the Field will get the right value based on its type.(DS)
//You can pass in those three arguments in order and LetoScript will know what you mean:
//add /FeatList/Feat, 100, gffWord;   (DS)
string AddFeat(int iFeat = -1) {
    if(iFeat < 0) return "";
    return
        "add /FeatList/Feat, type => gffWord, value => " + IntToString(iFeat) + ";" +
        "add /LvlStatList/[0]/FeatList/Feat, type => gffWord, value => " + IntToString(iFeat) + ";";
}
/*
string RemoveFeat(int iFeat = -1) {
    if(iFeat < 0) return "";
    return "<gff:replace {name='Feat' value="+IntToString(iFeat)+" DeleteParent=true}>";
}
*/

//Replace's arguments are:
//replace Root, Name, Value, SetValue
//replace Name, Value, SetValue

//Root, Name, Value, SetValue are the standard arguments, and everything else is an option.
//The second line means you can argue by value in another format, which is Name, Value, SetValue - LetoScript
//will know which one you mean if the first argument is a Field or not. When you don't specify a Root,
//LetoScript just starts from the root Struct.(DS)
string RemoveFeat(int iFeat = -1) {
    if(iFeat < 0) return "";
    return "replace 'Feat', "+IntToString(iFeat)+", DeleteParent;";
}
/*
string ModifySkill(int iSkill, int iModifier = 0) {
    if(iModifier == 0) return "";

    string sSkill = IntToString(iSkill);
    string sModifier = IntToString(iModifier);

    return
        "<gff:set 'SkillList/["+sSkill+"]/Rank' {value=(<SkillList/["+sSkill+"]/Rank>+"+sModifier+")}>"+
        "<gff:set 'LvlStatList/[0]/SkillList/["+sSkill+"]/Rank' {value=(<SkillList/["+sSkill+"]/Rank>+"+sModifier+")}>";
}
*/
string ModifySkill(int iSkill, int iModifier = 0) {
    if(iModifier == 0) return "";

    string sSkill = IntToString(iSkill);
    string sModifier = IntToString(iModifier);

    return
        "/SkillList/["+sSkill+"]/Rank = /SkillList/["+sSkill+"]/Rank+"+sModifier+";"+
        "/LvlStatList/[0]/SkillList/["+sSkill+"]/Rank = /SkillList/["+sSkill+"]/Rank+"+sModifier+";";
}
/*
string SetMovementSpeed(int speed = 9) {
    if(speed > 8 || speed < 0) return "";
    return "<gff:set 'MovementRate' {value="+IntToString(speed)+"}>";
}
*/
string SetMovementSpeed(int speed = 9) {
    if(speed > 8 || speed < 0) return "";
    return "/MovementRate = "+IntToString(speed)+";";
}


//And at last we get to system. This is an extremely dangerous function that existed in Phoenix to support
//certain file system operations LetoScript couldn't perform yet. Well, and Perl supports the same thing, with
//backticks (reserved in LetoScript ostensibly for the same purpose), which is what people mean when they say
//"security implications of Perl". Build 18 has similar "security implications". Anything you can do from a
//command line, LetoScript can do. (DS)
//System is not yet implemented in Unicorn. It will be eventually, but part of the wait is making sure it's
//not needed for trivial things like copying or renaming files. When it does get implemented, there will be a
//way to disable it globally, so you can run NWScript without worrying about system somehow getting injected
//into your scripts. (Or any of the FileSystem functions, if you wished.) (DS)

/*
string CMD(string command) {
    return LetoScript("<system:'cmd /c "+command+"'>");
}
*/
///////////////////////////////////////OLD BIC LOCATING SYSTEM//////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
/*
string GetBicPathNEW(object oPC) {
    return LetoScript(
        "<var:playerlist=[]>"+
        "<vault:<var:playerlist> <qq:"+NWNPATH+"//servervault//"+GetPCPlayerName(oPC)+"//*.bic>>"+
        "<for:vault <var:playerlist>>"+
            "<if:<qq:<Tag>> eq <qq:"+GetTag(oPC)+">><~><break></if>"+
        "</for>"
    );
}
*/
//below was already commented
/*
string GetBicPathNEW(object oPC) {
    string script =
        "<var:playerlist=[]>"+
        "<vault:<var:playerlist> <qq:"+NWNPATH+"//servervault//"+GetPCPlayerName(oPC)+"//*.bic>>"+
        "<for:vault <var:playerlist>>"+
            "<if:<FirstName> && <LastName>><var:space = ' '></if>"+
            "<if:<qq:<FirstName><var:space><LastName>> eq <qq:"+GetName(oPC)+">>"+
            "<if:<Experience> eq "+IntToString(GetXP(oPC))+">"+
            "<if:<Gold> eq "+IntToString(GetGold(oPC))+">"+
            "<if:<GoodEvil> eq "+IntToString(GetGoodEvilValue(oPC))+">"+
            "<if:<LawfulChaotic> eq "+IntToString(GetLawChaosValue(oPC))+">"+
                "<~><break>"+
            "</if>"+
            "</if>"+
            "</if>"+
            "</if>"+
            "</if>"+
        "</for>";
    PrintString(script);
    return LetoScript(script);
}
*/
/*
string GetBicFileName(object oPC) {
    string sChar, sBicName;
    string sPCName = GetStringLowerCase(GetName(oPC));
    int i, iNameLength = GetStringLength(sPCName);

    for(i=0; i < iNameLength; i++) {
        sChar = GetSubString(sPCName, i, 1);
        if (TestStringAgainstPattern("(*a|*n|*w|'|-|_)", sChar)) {
            if (sChar != " ") sBicName += sChar;
        }
    }
    return GetStringLeft(sBicName, 16);
}
*/

//string GetBicPathOLD(object oPC) {
    // Gets a local var stored on oPC on "event client enter". I do this because
    // "on even client leave", function GetPCPlayerName() can not be used. Since
    // a .bic file can not be changed while the owner is logged in, it is typical
    // to execute leto scripts when the client leaves (on event client leave).
//    string PlayerName = GetLocalString(oPC, "PlayerName");

    // Retruns the full path to a .bic file.
//    return NWNPATH+"/servervault/"+PlayerName+"/"+GetBicFileName(oPC)+".bic";
//}

/*
string GetBicPath(object oPC) {
    if(ENABLE_NEW_BIC_LOCATOR) return GetBicPathNEW(oPC);
    else return GetBicPathOLD(oPC);
}
*/
/////////////////////////END OLD BIC LOCATING SYSTEM////////////////////////////
////////////////////////////////////////////////////////////////////////////////
string GetBicPath(object PC) {
    string VaultPath = NWNPATH;
    string Player = GetPCPlayerName(PC);
    string BicPath = VaultPath + Player + "/";

    return LetoScript(
        "print q<" + BicPath + "> + " +
        "FindNewestBic q<" + BicPath + ">;"
    );

}

/*
void DeleteFile(string file) {
    PrintString("File to delete: "+file);
    PrintString(LetoScript("<fs:delete '"+file+"'>"));
}
*/
void DeleteFile(string file) {
    PrintString("File to delete: "+file);
    PrintString(LetoScript("FileDelete q<" + file + ">"));
}


