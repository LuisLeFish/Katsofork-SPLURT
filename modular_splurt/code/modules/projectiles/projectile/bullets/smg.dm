/obj/item/projectile/bullet/c45 // Yes I know I am changing how .45 weapons work by making the basic ammo less-than-lethal. This just makes this easier in the long run with mags
	name = ".45 rubber bullet"
	damage = 20
	stamina = 52
	sharpness = NONE


/obj/item/projectile/bullet/c45/lethal
	name = ".45 bullet"
	damage = 30
	wound_bonus = -10
	wound_falloff_tile = -10
	sharpness = SHARP_EDGED


/obj/item/projectile/bullet/c45/hydra
	name = ".45 Hydra-shock bullet"
	damage = 15
	armour_penetration = -65
	sharpness = SHARP_EDGED
	wound_bonus = 30
	bare_wound_bonus = 30
	embedding = list(embed_chance=75, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)
	wound_falloff_tile = -5
	embed_falloff_tile = -15

/obj/item/projectile/bullet/c45/trac
	name = ".45 TRAC bullet"
	damage = 15

/obj/item/projectile/bullet/c45/ion
	projectile_type = /obj/item/projectile/ion/weak

/obj/item/projectile/bullet/c45/trac/on_hit(atom/target, blocked = FALSE)
	. = ..()
	var/mob/living/carbon/M = target
	var/obj/item/implant/tracking/c38/imp
	for(var/obj/item/implant/tracking/c38/TI in M.implants) //checks if the target already contains a tracking implant
		imp = TI
		return
	if(!imp)
		imp = new /obj/item/implant/tracking/c38(M)
		imp.implant(M)

/obj/item/projectile/bullet/c45/hotshot //similar to incendiary bullets, but do not leave a flaming trail
	name = ".45 Hot Shot bullet"
	damage = 30
	sharpness = SHARP_EDGED

/obj/item/projectile/bullet/c45/hotshot/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(6)
		M.IgniteMob()

/obj/item/projectile/bullet/c45_cleaning
	sharpness = SHARP_EDGED

