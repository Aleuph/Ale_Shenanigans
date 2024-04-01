/obj/item/clothing/head
	name                = "head"
	icon_state          = ICON_STATE_WORLD
	icon                = 'icons/clothing/head/softcap.dmi'
	blood_overlay_type  = "helmetblood"
	w_class             = ITEM_SIZE_SMALL
	slot_flags          = SLOT_HEAD
	body_parts_covered  = SLOT_HEAD

	var/protects_against_weather = FALSE
	var/image/light_overlay_image
	var/light_applied
	var/brightness_on
	var/on = 0

/obj/item/clothing/head/equipped(var/mob/user, var/slot)
	light_overlay_image = null
	..(user, slot)

/obj/item/clothing/head/attack_self(mob/user)
	if(brightness_on)
		if(!isturf(user.loc))
			to_chat(user, "You cannot turn the light on while in this [user.loc].")
			return
		on = !on
		to_chat(user, "You [on ? "enable" : "disable"] the helmet light.")
		update_flashlight(user)
	else
		return ..(user)

/obj/item/clothing/head/proc/update_flashlight(var/mob/user = null)
	if(on && !light_applied)
		set_light(brightness_on)
		light_applied = 1
	else if(!on && light_applied)
		set_light(0)
		light_applied = 0
	update_icon(user)
	user.update_action_buttons()

/obj/item/clothing/head/on_update_icon(var/mob/user)
	. = ..()
	if(on)
		var/cache_key = "[icon]-[get_world_inventory_state()]_icon"
		if(!light_overlay_cache[cache_key])
			var/light_state = "[get_world_inventory_state()]_light"
			if(check_state_in_icon(light_state, icon))
				light_overlay_cache[cache_key] = image(icon, light_state)
			else
				light_overlay_cache[cache_key] = new /image
		add_overlay(light_overlay_cache[cache_key])
	update_clothing_icon()

/obj/item/clothing/head/adjust_mob_overlay(var/mob/living/user_mob, var/bodytype,  var/image/overlay, var/slot, var/bodypart)
	if(overlay && on && check_state_in_icon("[overlay.icon_state]_light", overlay.icon))
		var/light_overlay
		if(user_mob.get_bodytype_category() != bodytype)
			light_overlay = user_mob.get_bodytype()?.get_offset_overlay_image(overlay.icon, "[overlay.icon_state]_light", null, slot)
		if(!light_overlay)
			light_overlay = image(overlay.icon, "[overlay.icon_state]_light")
		overlay.overlays += light_overlay
	. = ..()

/obj/item/clothing/head/get_associated_equipment_slots()
	. = ..()
	LAZYDISTINCTADD(., slot_head_str)
