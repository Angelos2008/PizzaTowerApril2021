if (other.tube_id == id)
{
}
if (playerid > -1)
{
}
if (state != (0 << 0))
{
}
if (other.state == (83 << 0))
{
}
if (other.state == (157 << 0))
{
}
if (object_index != obj_tubeenter && other.state != (123 << 0))
    return;
var _offset_x = (32 * image_xscale)
var _offset_y = (14 * image_yscale)
with (other)
{
    state = (123 << 0)
    hsp = 0
    movespeed = 0
    vsp = 0
    tube_vsp = 0
    x = Approach(x, (other.x + _offset_x), other.approach_spd)
    y = Approach(y, (other.y + _offset_y), other.approach_spd)
}
if (floor(other.x) == (x + _offset_x) && floor(other.y) == (y + _offset_y))
{
    other.x = (x + _offset_x)
    other.y = (y + _offset_y)
    image_index = 0
    playerid = other.id
    other.state = (123 << 0)
    other.hsp = 0
    other.vsp = 0
    other.tube_vsp = 0
    state = (123 << 0)
}
