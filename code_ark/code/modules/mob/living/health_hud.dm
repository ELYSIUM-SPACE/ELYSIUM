proc/RoundHealthHud(mob/living/M)
	if(M.stat == DEAD)
		return "health-100"
	var/maxi_health = M.maxHealth
	if(iscarbon(M) && M.health < 0)
		maxi_health = 100 //so crit shows up right for aliens and other high-health carbon mobs; noncarbons don't have crit.
	var/resulthealth = (M.health / maxi_health) * 100
	switch(resulthealth)
		if(100 to INFINITY)
			return "health100"
		if(90.625 to 100)
			return "health93.75"
		if(84.375 to 90.625)
			return "health87.5"
		if(78.125 to 84.375)
			return "health81.25"
		if(71.875 to 78.125)
			return "health75"
		if(65.625 to 71.875)
			return "health68.75"
		if(59.375 to 65.625)
			return "health62.5"
		if(53.125 to 59.375)
			return "health56.25"
		if(46.875 to 53.125)
			return "health50"
		if(40.625 to 46.875)
			return "health43.75"
		if(34.375 to 40.625)
			return "health37.5"
		if(28.125 to 34.375)
			return "health31.25"
		if(21.875 to 28.125)
			return "health25"
		if(15.625 to 21.875)
			return "health18.75"
		if(9.375 to 15.625)
			return "health12.5"
		if(1 to 9.375)
			return "health6.25"
		if(-50 to 1)
			return "health0"
		if(-85 to -50)
			return "health-50"
		if(-99 to -85)
			return "health-85"
		else
			return "health-100"