if place_meeting(x, (y - 1), obj_player)
{
    with (obj_player)
    {
        if (state != (121 << 0) && state != (157 << 0))
        {
            if place_meeting(x, (y + 1), other)
            {
                state = (70 << 0)
                xscale = sign(other.image_xscale)
                movespeed = 16
                sprite_index = spr_currentplayer
            }
        }
    }
}
