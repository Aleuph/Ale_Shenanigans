/decl/hierarchy/outfit/job/ministation/doctor/head
	name = "Ministation - Job - Head Doctor"
	l_ear = /obj/item/radio/headset/headset_med
	uniform = /obj/item/clothing/under/det/black
	shoes = /obj/item/clothing/shoes/dress
	pda_type = /obj/item/modular_computer/pda/medical
	pda_slot = slot_l_store_str
	r_pocket = /obj/item/chems/hypospray
	hands = list(/obj/item/storage/firstaid/adv)
	suit = /obj/item/clothing/suit/storage/toggle/redcoat/service/officiated
	id_type = /obj/item/card/id/ministation/doctor

/decl/hierarchy/outfit/job/ministation/doctor
	shoes = /obj/item/clothing/shoes/color/white
	pda_type = /obj/item/modular_computer/pda/medical
	pda_slot = slot_l_store_str
	name = "Ministation - Job - Junior Doctor"
	uniform = /obj/item/clothing/under/medical
	hands = list(/obj/item/storage/firstaid/adv)
	r_pocket = /obj/item/flashlight/pen
	id_type = /obj/item/card/id/ministation/doctor
	suit = /obj/item/clothing/suit/storage/toggle/redcoat/service

/decl/hierarchy/outfit/job/ministation/doctor/Initialize()
	. = ..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/ministation/doctor/head/Initialize()
	. = ..()
	BACKPACK_OVERRIDE_MEDICAL

/obj/item/card/id/ministation/doctor
	name = "identification card"
	desc = "A card issued to medical staff."
	detail_color = COLOR_PALE_BLUE_GRAY
