/*
   =============================================
   PENTAGRAMS & SUMMONING CIRCLES          v1.40
   =============================================
   gaoneng                      January 17, 2005
   #include "inc_draw"

   last updated on April 25, 2005

   Draw geometric forms using a variety of media
   =============================================
*/

//#include "inc_draw_tools"

/*
   =============================================
   DRAW* PLACE* AND BEAM* FUNCTIONS DECLARATIONS
   =============================================
*/
// Draws a circle around lCenter
// =============================
// nDurationType = DURATION_TYPE_* constant
// nVFX = the VFX_* constant to use.
// lCenter = the location of the center.
// fRadius = radius of circle in meters. (1 tile = 10.0m X 10.0m)
// fDuration = if nDurationType is DURATION_TYPE_TEMPORARY, this is the number
//             of seconds the circle lasts before fading.         DEFAULT : 0.0
// nFrequency = number of points, the higher nFrequency, the more effects are
//              generated and the closer they are to each other.   DEFAULT : 90
// fRev = number of revolutions.                                  DEFAULT : 1.0
// fTime = time in seconds taken to draw the circle.              DEFAULT : 6.0
// fRotate = the angle of rotation respective to normal.          DEFAULT : 0.0
// sAxis = ("x", "y" or "z") the normal axis.                     DEFAULT : "z"
void DrawCircle(int nDurationType, int nVFX, location lCenter, float fRadius, float fDuration=0.0f, int nFrequency=90, float fRev=1.0f, float fTime=6.0f, float fRotate=0.0f, string sAxis="z");

// Draws a spring around lCenter
// =============================
// nDurationType = DURATION_TYPE_* constant
// nVFX = the VFX_* constant to use.
// lCenter = the location of the center.
// fRadiusStart = starting radius of spring in meters. (1 tile = 10.0m X 10.0m)
// fRadiusEnd = ending radius of spring in meters.                DEFAULT : 0.0
// fHeightStart = starting height of the spring in meters.        DEFAULT : 0.0
// fHeightEnd = ending height of the spring in meters.            DEFAULT : 5.0
// fDuration = if nDurationType is DURATION_TYPE_TEMPORARY, this is the number
//             of seconds the spring lasts before fading.         DEFAULT : 0.0
// nFrequency = number of points, the higher nFrequency, the more effects are
//              generated and the closer they are to each other.   DEFAULT : 90
// fRev = number of revolutions.                                  DEFAULT : 5.0
// fTime = time in seconds taken to draw the spring.              DEFAULT : 6.0
// fRotate = the angle of rotation respective to normal.          DEFAULT : 0.0
// sAxis = ("x", "y" or "z") the normal axis.                     DEFAULT : "z"
void DrawSpring(int nDurationType, int nVFX, location lCenter, float fRadiusStart, float fRadiusEnd=0.0f, float fHeightStart=0.0f, float fHeightEnd=5.0f, float fDuration=0.0f, int nFrequency=90, float fRev=5.0f, float fTime=6.0f, float fRotate=0.0f, string sAxis="z");

// Draws a line towards lCenter
// ============================
// nDurationType = DURATION_TYPE_* constant
// nVFX = the VFX_* constant to use.
// lCenter = the location of the center.
// fLength = length of line in meters. (1 tile = 10.0m X 10.0m)
// fDirection = direction of line respective to normal.           DEFAULT : 0.0
// fDuration = if nDurationType is DURATION_TYPE_TEMPORARY, this is the number
//             of seconds the spring lasts before fading.         DEFAULT : 0.0
// nFrequency = number of points, the higher nFrequency, the more effects are
//              generated and the closer they are to each other.   DEFAULT : 90
// fTime = time in seconds taken to draw the line.                DEFAULT : 6.0
// sAxis = ("x", "y" or "z") the normal axis.                     DEFAULT : "z"

void DrawSpring(int nDurationType, int nVFX, location lCenter, float fRadiusStart, float fRadiusEnd=0.0f, float fHeightStart=0.0f, float fHeightEnd=5.0f, float fDuration=0.0f, int nFrequency=90, float fRev=1.0f, float fTime=6.0f, float fRotate=0.0f, string sAxis="z")
{
   int i;
   if (nFrequency < 1) nFrequency = 90;
   if (fDuration<0.0) fDuration = 0.0;
   if (fTime<0.0) fTime = 6.0;
   float fTheta = 360.0*fRev/IntToFloat(nFrequency); // angle between each node
   float fDecay = (fRadiusStart - fRadiusEnd)/IntToFloat(nFrequency); // change in radius per node
   float fGrowth = (fHeightStart - fHeightEnd)/IntToFloat(nFrequency); // change in height per node
   float fDelay = fTime/IntToFloat(nFrequency);
   vector vCenter = GetPositionFromLocation(lCenter);
   vector vPos;
   object oArea = GetAreaFromLocation(lCenter);
   location lPos;
   float f, x, y, z, fAngle;
   for (i=0; i<nFrequency; i++)
   {
      f = IntToFloat(i);
      fAngle = fTheta*f + fRotate;
      z = (fHeightStart-fGrowth*f);
      y = (fRadiusStart-fDecay*f)*sin(fAngle);
      x = (fRadiusStart-fDecay*f)*cos(fAngle);
      if (sAxis == "x")      vPos = vCenter + Vector(y, z, x);
      else if (sAxis == "y") vPos = vCenter + Vector(z, x, y);
      else                   vPos = vCenter + Vector(x, y, z);
      lPos = Location(oArea, vPos, fAngle);
      DelayCommand(f*fDelay, ApplyEffectAtLocation(nDurationType, EffectVisualEffect(nVFX), lPos, fDuration));
   }
}

void DrawCircle(int nDurationType, int nVFX, location lCenter, float fRadius, float fDuration=0.0f, int nFrequency=90, float fRev=1.0f, float fTime=6.0f, float fRotate=0.0f, string sAxis="z")
{
   DrawSpring(nDurationType, nVFX, lCenter, fRadius, fRadius, 0.0, 0.0, fDuration, nFrequency, fRev, fTime, fRotate, sAxis);
}

//void main (){}
