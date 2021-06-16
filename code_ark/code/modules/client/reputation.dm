/client/proc/rate_player()
	set name = "Rate player"
	set category = "OOC"

	if(!dbcon.IsConnected())
		return

	var/DBQuery/query = dbcon.NewQuery("SELECT id, datediff(Now(),lastrepchange) as datediff FROM reputation WHERE `key` = '[key]'")
	query.Execute()
	var/id
	var/date_diff
	if(query.NextRow())
		id = query.item[1]
		date_diff = text2num(query.item[2])

	if(id && !date_diff)
		return

	var/client/target = input("Choose a player to rate") as null|anything in sortList(GLOB.clients) - src
	if(!target)
		return

	var/rate = 0
	switch(alert("Do you want to increase or decrease [target]'s reputation? ",, "increase", "decrease", "cancel"))
		if("increase")
			rate++
		if("decrease")
			rate--
		else
			return

	var/anon = alert("Do you want to send this anonymously?",, "yes", "no", "cancel")
	if(anon == "cancel")
		return

	query.Execute()
	if(query.NextRow())
		id = query.item[1]
		date_diff = text2num(query.item[2])
	if(id && !date_diff)
		return
	if(!target)
		to_chat(src, SPAN_WARNING("The player left the server. Aborting."))
		return

	var/DBQuery/query_my = dbcon.NewQuery("UPDATE reputation SET lastrepchange = NOW() WHERE `key` = '[key]'")
	query_my.Execute()

	verbs -= /client/proc/rate_player
	to_chat(target, SPAN_NOTICE("You sent a [rate > 0 ? "POSITIVE" : "NEGATIVE"] reputation point to [target.key]!"))
	GLOB.reputation.players["[target.key]"] += rate > 0 ? 1 : -1
	GLOB.reputation.recalculate()

	var/DBQuery/query_target = dbcon.NewQuery("UPDATE reputation SET value = value + [rate] WHERE `key` = '[target.key]'")
	query_target.Execute()

	to_chat(target, SPAN_NOTICE("You got a [rate > 0 ? "POSITIVE" : "NEGATIVE"] reputation point from [anon == "yes" ? "Anon" : key]!"))
	target.reputation.value += rate

/client/proc/show_top_players()
	set name = "Show popular players"
	set category = "OOC"

	var/datum/browser/popup = new(mob, "Reputation Table", "Reputation Table", 300, 750)
	popup.set_content(GLOB.reputation.text)
	popup.open()

/client/proc/show_my_reputation()
	set name = "Show my reputation points"
	set category = "OOC"

	if(reputation)
		to_chat(src, SPAN_NOTICE("You have [reputation.value ? "[reputation.value]" : "no"] points!"))
