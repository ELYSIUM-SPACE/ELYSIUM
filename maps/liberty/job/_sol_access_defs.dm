// #define ACCESS_REGION_MAX 11 - CHECK _access_defs.dm

#define ACCESS_REGION_SOL 9
#define ACCESS_REGION_SOL_HIGH 10
#define ACCESS_REGION_SOL_SFP 11

/get_region_accesses_name(var/code)
	switch(code)
		if(ACCESS_REGION_ALL)
			return "All"
		if(ACCESS_REGION_SECURITY) //security
			return "Security"
		if(ACCESS_REGION_MEDBAY) //medbay
			return "Medbay"
		if(ACCESS_REGION_RESEARCH) //research
			return "Research"
		if(ACCESS_REGION_ENGINEERING) //engineering and maintenance
			return "Engineering"
		if(ACCESS_REGION_COMMAND) //command
			return "Command"
		if(ACCESS_REGION_GENERAL) //station general
			return "General"
		if(ACCESS_REGION_SUPPLY) //supply
			return "Supply"
		if(ACCESS_REGION_NT) //nt
			return "Corporate"
		if(ACCESS_REGION_SOL) // Elysium
			return "Sol"
		if(ACCESS_REGION_SOL_HIGH) // Elysium
			return "Sol High"
		if(ACCESS_REGION_SOL_SFP) // Elysium
			return "Sol Federal Police"
