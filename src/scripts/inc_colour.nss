const string TEXT_COLOR_RED    =  "˛  ";
const string TEXT_COLOR_ORANGE =  "˛ú ";
const string TEXT_COLOR_YELLOW =  "˛˛ ";
const string TEXT_COLOR_GREEN  =  " ˛ ";
const string TEXT_COLOR_BLUE   =  "  ˛";
const string TEXT_COLOR_CYAN   =  " ˛˛";
const string TEXT_COLOR_PURPLE =  "˛ ˛";
const string TEXT_COLOR_WHITE  =  "˛˛˛";
const string TEXT_COLOR_GREY   =  "~~~";
const string TEXT_COLOR_CRIMSON = "ë  ";
const string TEXT_COLOR_EMERALD = " ~ ";
const string TEXT_COLOR_BROWN   = "«~6";
const string TEXT_COLOR_AZURE   = "~~˛";
const string COLORTOKEN ="                  ##################$%&'()*+,-./0123456789:;;==?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[[]^_`abcdefghijklmnopqrstuvwxyz{|}~~ÄÅÇÉÑÖÜáàâäãåçéèêëíìîïñóòôöõúùûü°°¢£§•¶ß®©™´¨¨ÆØ∞±≤≥¥µ∂∑∏π∫ªºΩæø¿¡¬√ƒ≈∆«»… ÀÃÕŒœ–—“”‘’÷◊ÿŸ⁄€‹›ﬁﬂ‡·‚„‰ÂÊÁËÈÍÎÏÌÓÔÒÚÛÙıˆ˜¯˘˙˚¸˝˛˛";



string ColorString(string sText, int nRed=255, int nGreen=255, int nBlue=255)
{
    return "<c" + GetSubString(COLORTOKEN, nRed, 1) + GetSubString(COLORTOKEN, nGreen, 1) + GetSubString(COLORTOKEN, nBlue, 1) + ">" + sText + "</c>";
}

/*
----------------------
COLORED Text Generator
----------------------
by: Demetrious

This code allows you to turn any messages to a specific color.

Colors are shown below.

Credit:  Richterm on the bioboards - the technique for the ascii chars was his alone.
(I just packaged it months later into a nice function)


Directions:
-----------

1) Import the package with the script and the object.
    Object is custom>>misc>> the one with all the ascii chars :)

2) Place the object "dem_color_text" into your module somewhere - probably in a place
    pcs can't go just to be safe.

3) Open any script you want to add color to a message and add

#include "dem_color_text"

4) In the code, use the function to switch colors

sMessage = ColorText("Stop!", "red");

5) Send sMessage to the player or DM using BW default functions or whatever.

FloatingTextStringOnCreature(sMessage, oPC);

6) That is it!  It will be red.

Options are:

yellow, magenta, cyan, red, green, blue.


*/
string DST_COLOR_TAGS = GetName(GetObjectByTag("dem_color_text"));
string DST_COLOR_WHITE = GetSubString(DST_COLOR_TAGS, 0, 6);
string DST_COLOR_YELLOW = GetSubString(DST_COLOR_TAGS, 6, 6);
string DST_COLOR_MAGENTA = GetSubString(DST_COLOR_TAGS, 12, 6);
string DST_COLOR_CYAN = GetSubString(DST_COLOR_TAGS, 18, 6);
string DST_COLOR_RED = GetSubString(DST_COLOR_TAGS, 24, 6);
string DST_COLOR_GREEN = GetSubString(DST_COLOR_TAGS, 30, 6);
string DST_COLOR_BLUE = GetSubString(DST_COLOR_TAGS, 36, 6);
string DST_COLOR_NORMAL = DST_COLOR_WHITE;

// DMFI Color Text function.  It returns a colored string.
// sText is the string that will be colored and sColor is the color
// options: yellow, magenta, cyan, red, green, blue - truncated at first letter
// Ex: sMsg = ColorText(sMsg, "y");  //Add the include file - yields yellow colored msg.
string ColorText(string sText, string sColor);
string ColorText(string sText, string sColor)
{
    string sApply = DST_COLOR_NORMAL;
    string sTest = GetStringLowerCase(GetStringLeft(sColor, 1));
    if (sTest=="y")  sApply = DST_COLOR_YELLOW;
    else if (sTest == "m") sApply = DST_COLOR_MAGENTA;
    else if (sTest == "c") sApply = DST_COLOR_CYAN;
    else if (sTest == "r") sApply = DST_COLOR_RED;
    else if (sTest == "g") sApply = DST_COLOR_GREEN;
    else if (sTest == "b") sApply = DST_COLOR_BLUE;

    string sFinal = sApply + sText + DST_COLOR_NORMAL;
    return sFinal;
}

string sColors = "         !!!!!!!!!!##########$$$$$$$$$$%%%%%%%%%%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~ÄÇÉÑÖÜáàâäãåéëíìîïñóòôöõúûü°¢£§•ß©©™´¨≠ÆØ∞±≤≥¥µ∂∑∏∏∫ªºΩæø¿¡¬√ƒ≈∆«»… ÀÃÕŒœ–—“”‘’÷◊ÿŸ⁄€‹›ﬁﬂ‡·‚„‰ÂÊÁËÈÍÎÏÌÓÔÒÚÛÙıˆ˜¯˘˙˚¸˝˛˛˛";
// Returns Pseudo-Ascii Character (for color use only, not accurate Ascii)
string ASCII(int iAsciiCode) // 0 - 255
{
    return GetSubString(sColors,iAsciiCode+1,1);
}

// Returns Pseudo-Ascii Integer Value (for color use only, not accurate Ascii)
int ASCIIToInt(string sLookup)
{
    return FindSubString(sColors, sLookup)-1;
}

// Returns a Color Code Based on Pseudo-Ascii
string RGB(int iR, int iG, int iB) // 0-255
{
    return "<c"+ASCII(iR)+ASCII(iG)+ASCII(iB)+">";
}

//ColorText Function, uses either a color token or a 3-Digit Color Code
//Codes can be copied and pasted to item and placable names, descriptions, etc :)
string Color_Text(string ColorCode, string sText)
{
  if (ColorCode == "crimson")      ColorCode = "<cë  >";
  else if (ColorCode == "red")          ColorCode = "<c˛  >";
  else if (ColorCode == "plum")         ColorCode = "<c˛ww>";
  else if (ColorCode == "tangerine")    ColorCode = "<c«Z >";
  else if (ColorCode == "orange")       ColorCode = "<c˛ú >";
  else if (ColorCode == "peach")        ColorCode = "<c˛« >";
  else if (ColorCode == "amber")        ColorCode = "<cúú >";
  else if (ColorCode == "yellow")       ColorCode = "<c˛˛ >";
  else if (ColorCode == "lemon")        ColorCode = "<c˛˛w>";
  else if (ColorCode == "emerald")      ColorCode = "<c ~ >";
  else if (ColorCode == "green")        ColorCode = "<c ˛ >";
  else if (ColorCode == "lime")         ColorCode = "<cw˛w>";
  else if (ColorCode == "midnight")     ColorCode = "<c  t>";
  else if (ColorCode == "navy")         ColorCode = "<c  ë>";
  else if (ColorCode == "blue")         ColorCode = "<c  ˛>";
  else if (ColorCode == "azure")        ColorCode = "<c~~˛>";
  else if (ColorCode == "skyblue")      ColorCode = "<c««˛>";
  else if (ColorCode == "violet")       ColorCode = "<c• •>";
  else if (ColorCode == "purple")       ColorCode = "<c˛ ˛>";
  else if (ColorCode == "lavender")     ColorCode = "<c˛~˛>";
  else if (ColorCode == "black")        ColorCode = "<c   >";
  else if (ColorCode == "slate")        ColorCode = "<c666>";
  else if (ColorCode == "darkgrey")     ColorCode = "<cZZZ>";
  else if (ColorCode == "grey")         ColorCode = "<c~~~>";
  else if (ColorCode == "lightgrey")    ColorCode = "<cØØØ>";
  else if (ColorCode == "white")        ColorCode = "<c˛˛˛>";
  else if (ColorCode == "turquoise")    ColorCode = "<c ••>";
  else if (ColorCode == "jade")         ColorCode = "<c tt>";
  else if (ColorCode == "cyan")         ColorCode = "<c ˛˛>";
  else if (ColorCode == "cerulean")     ColorCode = "<cú˛˛>";
  else if (ColorCode == "aqua")         ColorCode = "<cZ«Ø>";
  else if (ColorCode == "silver")       ColorCode = "<cøØ«>";
  else if (ColorCode == "rose")         ColorCode = "<cŒFF>";
  else if (ColorCode == "pink")         ColorCode = "<c˛Vø>";
  else if (ColorCode == "wood")         ColorCode = "<cëZ(>";
  else if (ColorCode == "brown")        ColorCode = "<c«~6>";
  else if (ColorCode == "tan")          ColorCode = "<cﬂëF>";
  else if (ColorCode == "flesh")        ColorCode = "<c˚•Z>";
  else if (ColorCode == "ivory")        ColorCode = "<c˛Œ•>";
  else if (ColorCode == "gold")         ColorCode = "<c˛ø6>";
  else if (ColorCode == "danelaw")         ColorCode = "<cÅ>";
  else if (GetStringLength(ColorCode) == 3) ColorCode = "<c"+ ColorCode + ">";
    else if (ColorCode == "random")
    {
        switch (d3())
        {
            case 1: ColorCode = RGB(Random(128)+128,Random(192)+64,Random(192)+64); break;
            case 2: ColorCode = RGB(Random(192)+64,Random(128)+128,Random(192)+64); break;
            case 3: ColorCode = RGB(Random(192)+64,Random(192)+64,Random(128)+128); break;
        }
    }

    return ColorCode + sText + "</c>";
}

string RainbowText(string SpectrumString)
{
    int i=1;
    string ReturnString;

    while (i<(GetStringLength(SpectrumString)+1))
    {
        ReturnString = ReturnString + Color_Text("random",GetSubString(SpectrumString,i-1,1));
        i++;
    }
    return ReturnString;
}

int LoInt(int iInt1, int iInt2) {return (iInt1>iInt2)?iInt2:iInt1;}

int HiInt(int iInt1, int iInt2) {return (iInt1>iInt2)?iInt1:iInt2;}

string JumbleCode(string JColor1, string JColor2)
{
    string sR1=(GetSubString(JColor1,0,1));
    string sG1=(GetSubString(JColor1,1,1));
    string sB1=(GetSubString(JColor1,2,1));

    string sR2=(GetSubString(JColor2,0,1));
    string sG2=(GetSubString(JColor2,1,1));
    string sB2=(GetSubString(JColor2,2,1));

    int RHi=HiInt(ASCIIToInt(sR1),ASCIIToInt(sR2));
    int RLo=LoInt(ASCIIToInt(sR1),ASCIIToInt(sR2));
    int GHi=HiInt(ASCIIToInt(sG1),ASCIIToInt(sG2));
    int GLo=LoInt(ASCIIToInt(sG1),ASCIIToInt(sG2));
    int BHi=HiInt(ASCIIToInt(sB1),ASCIIToInt(sB2));
    int BLo=LoInt(ASCIIToInt(sB1),ASCIIToInt(sB2));

    return ASCII(Random(RHi-RLo)+RLo+1)+ASCII(Random(GHi-GLo)+GLo+1)+ASCII(Random(BHi-BLo)+BLo+1);
}

//Jumble Text randomly selects a color between Color1 and Color2
string JumbledText(string Color1, string Color2, string JumbleString)
{
    int j;
    string ReturnString;
    while (j<(GetStringLength(JumbleString)))
    {
        ReturnString = ReturnString+"<c"+JumbleCode(Color1,Color2)+">"+GetSubString(JumbleString,j,1)+"</c>";
        j++;
    }
    return ReturnString;
}



void FontColors()
{
    // define the colortags
    SetCustomToken(3500, "<c‰‰‰>"); // white
    SetCustomToken(3501, "<c‰  >"); // red
    SetCustomToken(3502, "<c ‰ >"); // green
    SetCustomToken(3503, "<c  ‰>"); // blue
    SetCustomToken(3504, "<c‰‰ >"); // yellow
    SetCustomToken(3505, "<c‰ ‰>"); // purple
    SetCustomToken(3506, "<c ‰‰>"); // green-blue
    SetCustomToken(3507, "<cÛµ>"); // orange
    SetCustomToken(3508, "<c   >"); // grey-black
    SetCustomToken(3509, "<caaa>"); // grey-dark
    SetCustomToken(3510, "<c∞∞∞>"); // grey-brighter
    SetCustomToken(3511, "<c˛« >"); // orange
}
