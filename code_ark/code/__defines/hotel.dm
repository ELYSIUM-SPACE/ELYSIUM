//Hotel rooms defines

#define ROOM_STATUS_BROKEN					0	//for inoperable rooms
#define ROOM_STATUS_AVAILABLE				1	//for available rooms
#define ROOM_STATUS_RESERVATION_IN_PROGRESS	2	//to prevent simultaneous reservation of the same room
#define ROOM_STATUS_OCCUPIED				3	//for occupied rooms
#define ROOM_STATUS_BLOCKED					4	//for blocked rooms. Requires manual unblocking by  hotel staff

#define ROOM_REQUEST_NONE			0		//default
#define ROOM_REQUEST_NOT_DISTURB	1		//do not disturb
#define ROOM_REQUEST_CLEANUP		2		//clean the room
#define ROOM_REQUEST_TURNOVER		3		//room turnover (set automatically at the end of the reservation)
