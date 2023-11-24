image_xscale = playerid.xscale
x = playerid.x
y = playerid.y
if (playerid.sprite_index != spr_knightpep_attack && playerid.state != (120 << 0) && playerid.state != (6 << 0))
    instance_destroy()
