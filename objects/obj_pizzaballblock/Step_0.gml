with (obj_player)
{
    if (place_meeting((x + xscale), y, other) && state == (61 << 0))
        instance_destroy(other)
}
with (obj_player)
{
    if (place_meeting(x, (y + 1), other) && state == (61 << 0))
        instance_destroy(other)
}
