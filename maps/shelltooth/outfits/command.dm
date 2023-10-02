/decl/hierarchy/outfit/job/shelltooth/captain
	name = SHELLTOOTH_OUTFIT_JOB_NAME("Captain")
	uniform = /obj/item/clothing/under/casual_pants/classicjeans
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda/captain
	r_pocket = /obj/item/radio
	id_type = /obj/item/card/id/gold/shelltooth_captain
	suit = /obj/item/clothing/suit/storage/toggle/redcoat/officer

/decl/hierarchy/outfit/job/shelltooth/captain/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/toggleable/hawaii/random/eyegore = new()
		if(uniform.can_attach_accessory(eyegore))
			uniform.attach_accessory(null, eyegore)
		else
			qdel(eyegore)

/decl/hierarchy/outfit/job/shelltooth/mate
	name = SHELLTOOTH_OUTFIT_JOB_NAME("First Mate")
	uniform = /obj/item/clothing/under/suit_jacket/checkered
	shoes = /obj/item/clothing/shoes/laceup
	glasses = /obj/item/clothing/glasses/sunglasses/big
	pda_type = /obj/item/modular_computer/pda/cargo
	l_hand = /obj/item/material/clipboard
	suit = /obj/item/clothing/suit/storage/toggle/redcoat/officiated
	id_type = /obj/item/card/id/silver/shelltooth_first_mate
	pda_type = /obj/item/modular_computer/pda/heads/hop

//id cards
/obj/item/card/id/gold/shelltooth_captain
	job_access_type = /datum/job/shelltooth_captain

/obj/item/card/id/silver/shelltooth_first_mate
	job_access_type = /datum/job/shelltooth_first_mate