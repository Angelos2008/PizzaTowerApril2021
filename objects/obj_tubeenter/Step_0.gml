if (state == (123 << 0))
{
    if (image_index > (image_number - 1))
    {
        with (playerid)
        {
            state = (123 << 0)
            tube_id = other.id
            hsp = (other.hsp * other.movespeed)
            vsp = (other.vsp * other.movespeed)
            tube_vsp = (other.vsp * other.movespeed)
            if (!(place_meeting(x, y, other.id)))
            {
                with (other)
                {
                    playerid = -1
                    state = (0 << 0)
                }
            }
        }
    }
}
