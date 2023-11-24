if place_meeting(x, (y - 1), obj_player)
{
    with (obj_player)
    {
        if (state != (157 << 0) && place_meeting(x, (y + 1), other))
        {
            if (state == (33 << 0))
                state = (27 << 0)
            else if (state != (27 << 0))
            {
                state = (70 << 0)
                sprite_index = spr_slipnslide
            }
            if (movespeed < 12)
                movespeed = 12
        }
    }
}
