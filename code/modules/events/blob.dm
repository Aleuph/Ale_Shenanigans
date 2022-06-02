/datum/event/blob
	announceWhen	= 12

	var/obj/effect/blob/core/Blob

/datum/event/blob/announce()
	level_seven_announcement()

/datum/event/blob/start()
	var/turf/T = pick_area_turf_by_flag(AREA_FLAG_MAINTENANCE, list(/proc/is_station_turf, /proc/not_turf_contains_dense_objects))
	if(!T)
		log_and_message_admins("Blob failed to find a viable turf.")
		kill()
		return

	log_and_message_admins("Blob spawned in \the [get_area(T).display_name]", location = T)
	Blob = new /obj/effect/blob/core(T)
	for(var/i = 1; i < rand(3, 4), i++)
		Blob.Process()

/datum/event/blob/tick()
	if(!Blob || !Blob.loc)
		Blob = null
		kill()
		return
	if(IsMultiple(activeFor, 3))
		Blob.Process()
