GLOBAL_DATUM_INIT(reputation, /datum/reputation_statistics, new)

/datum/reputation_statistics
	var/list/players = list()
	var/text = ""

/datum/reputation_statistics/proc/Initialize()
	var/DBQuery/query = dbcon.NewQuery("SELECT `key`, value FROM reputation WHERE value >= '1'")
	query.Execute()
	while(query.NextRow())
		var/key = query.item[1]
		var/value = text2num(query.item[2])

		players["[key]"] = value

	recalculate()

/datum/reputation_statistics/proc/recalculate()
	text = "<center><h1>TOP-10 PLAYERS</h1><br>"
	sortTim(players, /proc/cmp_numeric_dsc, 1)
	var/place = 1
	for(var/i in players)
		if(players[i] < 1)
			break

		text += "<font size='3'>[i]</font><br>"
		text += "<b><font size='1'>\[[players[i]] pts.\]</font></b><br>"

		place++
		if(place > 10)
			break

		text += "<br>"

	text += "</center>"

/datum/reputation_holder
	var/value = 0
	var/client/owner

/datum/reputation_holder/New(client/C)
	owner = C

	if(!dbcon.IsConnected())
		return

	owner.verbs += /client/proc/show_top_players
	owner.verbs += /client/proc/show_my_reputation
	gather_info()

/datum/reputation_holder/Destroy()
	owner = null
	return ..()

/datum/reputation_holder/proc/gather_info()
	var/DBQuery/query = dbcon.NewQuery("SELECT id, datediff(Now(),lastrepchange) as datediff, value FROM reputation WHERE `key` = '[owner.key]'")
	query.Execute()
	var/id
	var/date_diff
	if(query.NextRow())
		id = query.item[1]
		date_diff = text2num(query.item[2])
		value = text2num(query.item[3])

	if(id && !date_diff)
		return
	if(!id)
		var/DBQuery/query_new = dbcon.NewQuery("INSERT INTO reputation (`id`, `key`, `value`, `lastrepchange`) VALUES (null, '[owner.key]', '[value]', now())")
		query_new.Execute()
		return

	owner.verbs += /client/proc/rate_player
