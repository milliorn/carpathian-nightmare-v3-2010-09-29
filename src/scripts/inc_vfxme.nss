void main()
{
object oArea = OBJECT_SELF;
object oPC = GetEnteringObject();
int iAreaSet = GetLocalInt(oArea, "VFX_COMPLETED");
if(iAreaSet != 0){return;}//Safety, to only fire once.
/*///////////////////////////////////////////////////////////
VFX anything that's flagged for it.
*///////////////////////////////////////////////////////////
object oThing = GetFirstObjectInArea(oArea);
while(GetIsObjectValid(oThing))
    {

    int iVFX = GetLocalInt(oThing, "VFX");


    if(iVFX>=1)
        {
        //ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(iVFX), oThing);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(iVFX)), oThing);
        }
    oThing = GetNextObjectInArea(oArea);
    }
SetLocalInt(oArea, "VFX_COMPLETED", 1);
}




/*
  VFX_DUR_DARKNESS                = 1
  VFX_DUR_ENTANGLE                = 2
  VFX_DUR_FREEDOM_OF_MOVEMENT     = 3
  VFX_DUR_GLOBE_INVULNERABILITY   = 4
  VFX_DUR_BLACKOUT                = 5
  VFX_DUR_INVISIBILITY            = 6
  VFX_DUR_MIND_AFFECTING_NEGATIVE = 7
  VFX_DUR_MIND_AFFECTING_POSITIVE = 8
  VFX_DUR_GHOSTLY_VISAGE          = 9
  VFX_DUR_ETHEREAL_VISAGE         = 10
  VFX_DUR_PROT_BARKSKIN           = 11
  VFX_DUR_PROT_GREATER_STONESKIN  = 12
  VFX_DUR_PROT_PREMONITION        = 13
  VFX_DUR_PROT_SHADOW_ARMOR       = 14
  VFX_DUR_PROT_STONESKIN          = 15
  VFX_DUR_SANCTUARY               = 16
  VFX_DUR_WEB                     = 17
  VFX_DUR_PARALYZE_HOLD           = 82
  VFX_DUR_SPELLTURNING            = 138
  VFX_DUR_ELEMENTAL_SHIELD        = 147
  VFX_DUR_LIGHT                   = 148
  VFX_DUR_LIGHT_BLUE_5            = 153
  VFX_DUR_LIGHT_BLUE_10           = 154
  VFX_DUR_LIGHT_BLUE_15           = 155
  VFX_DUR_LIGHT_BLUE_20           = 156
  VFX_DUR_LIGHT_YELLOW_5          = 157
  VFX_DUR_LIGHT_YELLOW_10         = 158
  VFX_DUR_LIGHT_YELLOW_15         = 159
  VFX_DUR_LIGHT_YELLOW_20         = 160
  VFX_DUR_LIGHT_PURPLE_5          = 161
  VFX_DUR_LIGHT_PURPLE_10         = 162
  VFX_DUR_LIGHT_PURPLE_15         = 163
  VFX_DUR_LIGHT_PURPLE_20         = 164
  VFX_DUR_LIGHT_RED_5             = 165
  VFX_DUR_LIGHT_RED_10            = 166
  VFX_DUR_LIGHT_RED_15            = 167
  VFX_DUR_LIGHT_RED_20            = 168
  VFX_DUR_LIGHT_ORANGE_5          = 169
  VFX_DUR_LIGHT_ORANGE_10         = 170
  VFX_DUR_LIGHT_ORANGE_15         = 171
  VFX_DUR_LIGHT_ORANGE_20         = 172
  VFX_DUR_LIGHT_WHITE_5           = 173
  VFX_DUR_LIGHT_WHITE_10          = 174
  VFX_DUR_LIGHT_WHITE_15          = 175
  VFX_DUR_LIGHT_WHITE_20          = 176
  VFX_DUR_LIGHT_GREY_5            = 177
  VFX_DUR_LIGHT_GREY_10           = 178
  VFX_DUR_LIGHT_GREY_15           = 179
  VFX_DUR_LIGHT_GREY_20           = 180
  VFX_DUR_DARKVISION              = 182
  VFX_DUR_CESSATE_NEUTRAL         = 205
  VFX_DUR_CESSATE_POSITIVE        = 206
  VFX_DUR_CESSATE_NEGATIVE        = 207
  VFX_DUR_MIND_AFFECTING_DISABLED = 208
  VFX_DUR_MIND_AFFECTING_DOMINATED= 209
  VFX_DUR_MIND_AFFECTING_FEAR     = 218
  VFX_DUR_GLOBE_MINOR             = 220
  VFX_DUR_PROTECTION_ELEMENTS     = 224
  VFX_DUR_PROTECTION_GOOD_MINOR   = 225
  VFX_DUR_PROTECTION_GOOD_MAJOR   = 226
  VFX_DUR_PROTECTION_EVIL_MINOR   = 227
  VFX_DUR_PROTECTION_EVIL_MAJOR   = 228
  VFX_DUR_MAGICAL_SIGHT           = 229
  VFX_DUR_WEB_MASS                = 230
  VFX_DUR_PARALYZED               = 232
  VFX_DUR_GHOSTLY_PULSE           = 240
  VFX_DUR_BLINDVISION             = 242
  VFX_DUR_LOWLIGHTVISION          = 243
  VFX_DUR_ULTRAVISION             = 244
  VFX_DUR_MIRV_ACID               = 245
  VFX_DUR_BLIND                   = 247
  VFX_DUR_ANTI_LIGHT_10           = 248
  VFX_DUR_MAGIC_RESISTANCE        = 249
  VFX_DUR_AURA_COLD                  = 267
  VFX_DUR_AURA_FIRE                  = 268
  VFX_DUR_AURA_POISON                = 269
  VFX_DUR_AURA_DISEASE               = 270
  VFX_DUR_AURA_ODD                   = 271
  VFX_DUR_AURA_SILENCE               = 272
  VFX_DUR_BARD_SONG                  = 277
  VFX_DUR_AURA_DRAGON_FEAR           = 291
  VFX_DUR_FLAG_RED                   = 303
  VFX_DUR_FLAG_BLUE                  = 304
  VFX_DUR_FLAG_GOLD                  = 305
  VFX_DUR_FLAG_PURPLE                = 306
  VFX_DUR_FLAG_GOLD_FIXED            = 306
  VFX_DUR_FLAG_PURPLE_FIXED          = 305
  VFX_DUR_TENTACLE                   = 346
  VFX_DUR_PETRIFY                    = 351
  VFX_DUR_FREEZE_ANIMATION           = 352
  VFX_DUR_BIGBYS_ ERPOSING_HAND      = 314
  VFX_DUR_BIGBYS_CLENCHED_FIST       = 316
  VFX_DUR_BIGBYS_CRUSHING_HAND       = 317
  VFX_DUR_BIGBYS_GRASPING_HAND       = 318
  VFX_DUR_CALTROPS                   = 319
  VFX_DUR_SMOKE                      = 320
  VFX_DUR_PIXIEDUST                  = 321
  VFX_DUR_CUTSCENE_INVISIBILITY      = 355
  VFX_DUR_IOUNSTONE                  = 403
  VFX_DUR_GLOW_LIGHT_BLUE            = 408
  VFX_DUR_GLOW_PURPLE                = 409
  VFX_DUR_GLOW_BLUE                  = 410
  VFX_DUR_GLOW_RED                   = 411
  VFX_DUR_GLOW_LIGHT_RED             = 412
  VFX_DUR_GLOW_YELLOW                = 413
  VFX_DUR_GLOW_LIGHT_YELLOW          = 414
  VFX_DUR_GLOW_GREEN                 = 415
  VFX_DUR_GLOW_LIGHT_GREEN           = 416
  VFX_DUR_GLOW_ORANGE                = 417
  VFX_DUR_GLOW_LIGHT_ORANGE          = 418
  VFX_DUR_GLOW_BROWN                 = 419
  VFX_DUR_GLOW_LIGHT_BROWN           = 420
  VFX_DUR_GLOW_GREY                  = 421
  VFX_DUR_GLOW_WHITE                 = 422
  VFX_DUR_GLOW_LIGHT_PURPLE          = 423
  VFX_DUR_GHOST_TRANSPARENT          = 424
  VFX_DUR_GHOST_SMOKE                = 425
  VFX_DUR_GLYPH_OF_WARDING           = 445
  VFX_DUR_DEATH_ARMOR                = 463
  VFX_DUR_ICESKIN                    = 465
  VFX_DUR_INFERNO                    = 474
  VFX_DUR_STONEHOLD                  = 476
  VFX_DUR_GHOSTLY_VISAGE_NO_SOUND    = 478
  VFX_DUR_GHOST_SMOKE_2              = 479
  VFX_DUR_FLIES                      = 480
  VFX_DUR_PROT_EPIC_ARMOR            = 495
  VFX_DUR_PROT_EPIC_ARMOR_2          = 497
  VFX_DUR_INFERNO_CHEST              = 498
  VFX_DUR_IOUNSTONE_RED              = 499
  VFX_DUR_IOUNSTONE_BLUE             = 500
  VFX_DUR_IOUNSTONE_YELLOW           = 501
  VFX_DUR_IOUNSTONE_GREEN            = 502
  VFX_DUR_INFERNO_NO_SOUND           = 505
  VFX_DUR_AURA_PULSE_RED_WHITE       = 512
  VFX_DUR_AURA_PULSE_BLUE_WHITE      = 513
  VFX_DUR_AURA_PULSE_GREEN_WHITE     = 514
  VFX_DUR_AURA_PULSE_YELLOW_WHITE    = 515
  VFX_DUR_AURA_PULSE_MAGENTA_WHITE   = 516
  VFX_DUR_AURA_PULSE_CYAN_WHITE      = 517
  VFX_DUR_AURA_PULSE_ORANGE_WHITE    = 518
  VFX_DUR_AURA_PULSE_BROWN_WHITE     = 519
  VFX_DUR_AURA_PULSE_PURPLE_WHITE    = 520
  VFX_DUR_AURA_PULSE_GREY_WHITE      = 521
  VFX_DUR_AURA_PULSE_GREY_BLACK      = 522
  VFX_DUR_AURA_PULSE_BLUE_GREEN      = 523
  VFX_DUR_AURA_PULSE_RED_BLUE        = 524
  VFX_DUR_AURA_PULSE_RED_YELLOW      = 525
  VFX_DUR_AURA_PULSE_GREEN_YELLOW    = 526
  VFX_DUR_AURA_PULSE_RED_GREEN       = 527
  VFX_DUR_AURA_PULSE_BLUE_YELLOW     = 528
  VFX_DUR_AURA_PULSE_BLUE_BLACK      = 529
  VFX_DUR_AURA_PULSE_RED_BLACK       = 530
  VFX_DUR_AURA_PULSE_GREEN_BLACK     = 531
  VFX_DUR_AURA_PULSE_YELLOW_BLACK    = 532
  VFX_DUR_AURA_PULSE_MAGENTA_BLACK   = 533
  VFX_DUR_AURA_PULSE_CYAN_BLACK      = 534
  VFX_DUR_AURA_PULSE_ORANGE_BLACK    = 535
  VFX_DUR_AURA_PULSE_BROWN_BLACK     = 536
  VFX_DUR_AURA_PULSE_PURPLE_BLACK    = 537
  VFX_DUR_AURA_PULSE_CYAN_GREEN      = 538
  VFX_DUR_AURA_PULSE_CYAN_BLUE       = 539
  VFX_DUR_AURA_PULSE_CYAN_RED        = 540
  VFX_DUR_AURA_PULSE_CYAN_YELLOW     = 541
  VFX_DUR_AURA_PULSE_MAGENTA_BLUE    = 542
  VFX_DUR_AURA_PULSE_MAGENTA_RED     = 543
  VFX_DUR_AURA_PULSE_MAGENTA_GREEN   = 544
  VFX_DUR_AURA_PULSE_MAGENTA_YELLOW  = 545
  VFX_DUR_AURA_PULSE_RED_ORANGE      = 546
  VFX_DUR_AURA_PULSE_YELLOW_ORANGE   = 547
  VFX_DUR_AURA_RED                   = 548
  VFX_DUR_AURA_GREEN                 = 549
  VFX_DUR_AURA_BLUE                  = 550
  VFX_DUR_AURA_MAGENTA               = 551
  VFX_DUR_AURA_YELLOW                = 552
  VFX_DUR_AURA_WHITE                 = 553
  VFX_DUR_AURA_ORANGE                = 554
  VFX_DUR_AURA_BROWN                 = 555
  VFX_DUR_AURA_PURPLE                = 556
  VFX_DUR_AURA_CYAN                  = 557
  VFX_DUR_AURA_GREEN_DARK            = 558
  VFX_DUR_AURA_GREEN_LIGHT           = 559
  VFX_DUR_AURA_RED_DARK              = 560
  VFX_DUR_AURA_RED_LIGHT             = 561
  VFX_DUR_AURA_BLUE_DARK             = 562
  VFX_DUR_AURA_BLUE_LIGHT            = 563
  VFX_DUR_AURA_YELLOW_DARK           = 564
  VFX_DUR_AURA_YELLOW_LIGHT          = 565
  VFX_DUR_BUBBLES                    = 566
  */
