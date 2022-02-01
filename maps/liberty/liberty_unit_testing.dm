/datum/unit_test/station_wires_shall_be_connected
	exceptions = list(
		list(40, 114, 2, WEST),
		list(38, 114, 2, EAST),
		list(151, 129, 1, EAST),
		list(153, 129, 1, EAST),
		list(153, 129, 1, WEST),
	)

/datum/map/liberty
	// Unit test exemptions
	apc_test_exempt_areas = list(
		/area/space = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/shuttle = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/turbolift = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/exoplanet = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/liberty/engineering/substation = NO_SCRUBBER|NO_VENT,
		/area/liberty/engineering/solar = NO_SCRUBBER|NO_VENT,
		/area/liberty/engineering/solar/engineering_solar_level_zero = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/liberty/engineering/engine_room = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/liberty/engineering/breakroom = NO_APC,
		/area/liberty/maintenance = NO_SCRUBBER|NO_VENT,
		/area/liberty/maintenance/construction = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/liberty/maintenance/zero/monitoring = 0,
		/area/liberty/maintenance/zero/port = 0,
		/area/liberty/maintenance/zero/aft = 0,
		/area/liberty/maintenance/zero/solitary = 0,
		/area/liberty/maintenance/one/shower = 0,
		/area/liberty/solar = NO_SCRUBBER|NO_VENT|NO_APC,
	)

	area_coherency_test_exempt_areas = list(
		/area/space
	)

	area_usage_test_exempted_areas = list(
		/area/liberty/solar,
		/area/liberty/maintenance,
		/area/liberty/maintenance/construction,
		/area/liberty/engineering,
		/area/overmap,
		/area/turbolift,
		/area/turbolift/liberty,
		/area/turbolift/liberty/hotel/ground,
		/area/turbolift/liberty/hotel/one,
		/area/turbolift/liberty/hotel/two,
		/area/turbolift/liberty/hotel/top,
		/area/turbolift/liberty/medbay/ground,
		/area/turbolift/liberty/medbay/top,
		/area/turbolift/liberty/east/ground,
		/area/turbolift/liberty/east/one,
		/area/turbolift/liberty/east/two,
		/area/turbolift/liberty/east/three,
		/area/turbolift/liberty/east/top,
		/area/turbolift/liberty/north/ground,
		/area/turbolift/liberty/north/one,
		/area/turbolift/liberty/north/two,
		/area/turbolift/liberty/north/top,
		/area/template_noop,
		/area/centcom,
		/area/centcom/holding,
		/area/centcom/specops,
		/area/chapel,
		/area/hallway,
		/area/medical,
		/area/security,
		/area/security/brig,
		/area/security/prison,
		/area/maintenance,
		/area/rnd,
		/area/rnd/xenobiology,
		/area/rnd/xenobiology/xenoflora,
		/area/rnd/xenobiology/xenoflora_storage,
		/area/shuttle,
		/area/shuttle/escape,
		/area/shuttle/escape/centcom,
		/area/shuttle/specops,
		/area/shuttle/specops/centcom,
		/area/shuttle/syndicate_elite,
		/area/shuttle/syndicate_elite/mothership,
		/area/shuttle/syndicate_elite/station,
		/area/supply,
		/area/syndicate_elite_squad,
		/area/beach
		)

/*
/datum/unit_test/zas_area_test/cargo_bay
	name = "ZAS: Cargo Bay"
	area_path = /area/quartermaster/storage

datum/unit_test/zas_area_test/supply_centcomm
	name = "ZAS: Supply Shuttle (CentComm)"
	area_path = /area/supply/dock

datum/unit_test/zas_area_test/xenobio
	name = "ZAS: Xenobiology"
	area_path = /area/rnd/xenobiology
*/
