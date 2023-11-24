if used
    image_index = 1
else
    image_index = 0
var s = 16
if place_meeting(x, (y - s), obj_player)
{
    with (obj_player)
    {
        var by = 4
        if (state == (94 << 0))
            by = 10
        var bx = 8
        if (state == (94 << 0))
            bx = 18
        if ((state == (80 << 0) || state == (94 << 0) || state == (158 << 0)) && y <= (other.y + by) && xscale == sign(other.image_xscale) && place_meeting(x, (y + s), other))
        {
            vsp = -11
            sprite_index = spr_mach2jump
            state = (158 << 0)
            if (!other.used)
            {
                ramp = 1
                other.used = 1
            }
            ramp_buffer = 16
            trace("trickjump")
        }
    }
}
