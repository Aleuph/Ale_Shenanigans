/decl/hierarchy/outfit/job/shelltooth/hand/researcher
	name = SHELLTOOTH_OUTFIT_JOB_NAME("Head Researcher")
	suit = /obj/item/clothing/suit/storage/toggle/redcoat/service/officiated
	shoes = /obj/item/clothing/shoes/laceup
	pda_type = /obj/item/modular_computer/pda/science
	id_type = /obj/item/card/id/shelltooth/science/head

/obj/item/card/id/science
	name = "identification card"
	desc = "A card issued to science staff."
	job_access_type = /datum/job/shelltooth_researcher
	detail_color = COLOR_PALE_PURPLE_GRAY

/decl/hierarchy/outfit/job/shelltooth/hand/researcher/junior
	name = SHELLTOOTH_OUTFIT_JOB_NAME("Junior Researcher")
	suit = /obj/item/clothing/suit/storage/toggle/redcoat/service
	id_type = /obj/item/card/id/shelltooth/science

/obj/item/card/id/shelltooth/science/head
	name = "identification card"
	desc = "A card which represents knowledge and reasoning."
	job_access_type = /datum/job/shelltooth_researcher/head
	extra_details = list("goldstripe")
