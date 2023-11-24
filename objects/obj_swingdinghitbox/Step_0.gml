x = playerid.x
y = playerid.y
with (playerid)
{
    if (state != (56 << 0) || sprite_index != spr_swingding)
        instance_destroy(other)
}
