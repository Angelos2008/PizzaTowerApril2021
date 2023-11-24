image_xscale = playerid.xscale
if (playerid.state != (156 << 0) && playerid.state != (94 << 0) && playerid.state != (78 << 0) && playerid.state != (125 << 0))
    instance_destroy()
x = (playerid.x + ((playerid.character == "M" ? 18 : 0) * playerid.xscale))
y = (playerid.y - (playerid.character == "M" ? 10 : 0))
visible = (!(room == rank_room))
