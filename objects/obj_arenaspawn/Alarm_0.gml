if (state != (118 << 0))
{
    wave_seconds--
    if (wave_seconds < 0)
    {
        if (wave_minutes > 0)
        {
            wave_seconds = 59
            wave_minutes--
        }
        else
        {
            wave_seconds = 0
            with (obj_player1)
            {
                if (state != (7 << 0))
                {
                    vsp = -11
                    state = (7 << 0)
                    targetRoom = lastroom
                }
            }
        }
    }
}
if (state == (116 << 0) || state == (115 << 0))
    alarm[0] = 60
