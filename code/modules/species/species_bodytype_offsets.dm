/*
These are all the things that can be adjusted for equipping stuff and
each one can be in the NORTH, SOUTH, EAST, and WEST direction. Specify
the direction to shift the thing and what direction.

example:
	equip_adjust = list(
		slot_back_str = list(NORTH = list(SOUTH = 12, EAST = 7), EAST = list(SOUTH = 2, WEST = 12))
			)

This would shift back items (backpacks, axes, etc.) when the mob
is facing either north or east.
When the mob faces north the back item icon is shifted 12 pixes down and 7 pixels to the right.
When the mob faces east the back item icon is shifted 2 pixels down and 12 pixels to the left.

The slots that you can use are found in items_clothing.dm and are the inventory slot string ones, so make sure
	you use the _str version of the slot.
*/

/decl/bodytype
	var/list/equip_adjust = list()
	var/list/equip_overlays = list()

/decl/bodytype/proc/get_offset_overlay_image(var/spritesheet, var/mob_icon, var/mob_state, var/color, var/slot)

	// If we don't actually need to offset this, don't bother with any of the generation/caching.
	if(!spritesheet && length(equip_adjust) && equip_adjust[slot] && length(equip_adjust[slot]))

		// Check the cache for previously made icons.
		var/image_key = "[mob_icon]-[mob_state]-[color]-[slot]"
		if(!equip_overlays[image_key])

			var/icon/final_I = new(icon_template)
			var/list/shifts = equip_adjust[slot]

			// TODO: consider adding all icons offset from the same base icon to the same cached icon.
			// Apply all pixel shifts for each direction.
			for(var/shift_facing in shifts)
				var/list/facing_list = shifts[shift_facing]
				var/use_dir = text2num(shift_facing)
				var/icon/equip = new(mob_icon, icon_state = mob_state, dir = use_dir)
				var/icon/canvas = new(icon_template)
				canvas.Blend(equip, ICON_OVERLAY, facing_list["x"]+1, facing_list["y"]+1)
				final_I.Insert(canvas, mob_state, dir = use_dir)

			equip_overlays[image_key] = overlay_image(final_I, mob_state, color = color, flags = RESET_COLOR)

		var/image/I = new() // We return a copy of the cached image, in case downstream procs mutate it.
		I.appearance = equip_overlays[image_key]
		return I
	return overlay_image(mob_icon, mob_state, color, RESET_COLOR)
