if (state == (123 << 0))
{
    if (image_index > (image_number - 1))
    {
        with (playerid)
        {
            sprite_index = spr_superspringplayer
            state = (73 << 0)
            vsp = -10
            if place_meeting(x, y, obj_solid)
            {
                while place_meeting(x, y, obj_solid)
                    y--
            }
            if (!(place_meeting(x, y, other.id)))
            {
                instance_create(x, y, obj_bangeffect)
                with (other)
                {
                    state = (0 << 0)
                    playerid = -1
                }
            }
        }
    }
}
