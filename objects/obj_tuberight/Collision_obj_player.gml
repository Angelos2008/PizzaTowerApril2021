if (other.tube_id == id)
{
}
if (other.state == (83 << 0))
{
}
if (other.state == (157 << 0))
    return;
var _offset_x = (32 * image_xscale)
var _offset_y = (14 * image_yscale)
with (other)
{
    hsp = 0
    vsp = 0
    movespeed = 0
    tube_vsp = 0
    state = (123 << 0)
    x = Approach(x, (other.x + _offset_x), other.approach_spd)
    y = Approach(y, (other.y + _offset_y), other.approach_spd)
}
if (floor(other.x) == (x + _offset_x) && floor(other.y) == (y + _offset_y))
{
    other.state = (123 << 0)
    other.tube_id = id
    other.hsp = (hsp * movespeed)
    other.vsp = (vsp * movespeed)
    other.tube_vsp = (vsp * movespeed)
}
