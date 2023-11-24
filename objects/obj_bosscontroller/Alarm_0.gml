if (state == (8 << 0))
{
}
if (state == (74 << 0))
{
}
seconds--
if (seconds == -1)
{
    if (minutes > 0)
    {
        seconds = 59
        minutes--
    }
    else
    {
        seconds = 0
        minutes = 0
    }
}
if (minutes == 0 && seconds == 0)
{
    instance_destroy(obj_baddiespawner)
    instance_destroy(obj_noisey)
    if (endroundfunc != -4)
        self.endroundfunc()
    if (round_count < round_max)
    {
        round_count++
        minutes = maxminutes
        seconds = maxseconds
        state = (118 << 0)
        timer_buffer = timer_max
        with (par_boss)
        {
            phase++
            phase = clamp(phase, 0, max_phase)
            if (colliding && state != (152 << 0) && state != (153 << 0))
                state = (118 << 0)
        }
    }
    else if instance_exists(bossID)
    {
        var b_hp = ((bossID.hp / bossID.max_hp) * 100)
        var p_hp = ((player_hp / player_hpmax) * 100)
        if (b_hp <= p_hp)
        {
            depth = (obj_player1.depth + 1)
            state = (8 << 0)
            with (bossID)
            {
                with (lastplayerid)
                {
                    xscale = 1
                    suplexmove = 1
                    sfx_gain(suplexdashsnd)
                    state = (31 << 0)
                    movespeed = 10
                    image_index = random_range(0, (image_number - 1))
                    sprite_index = spr_player_groundedattack
                }
                hp = 0
                self.boss_destroy(lastplayerid)
            }
        }
        else
        {
            with (bossID)
            {
                sprite_index = defeatplayerspr
                fakedeath = 0
            }
            fakedeath = 0
            player_hp = 0
        }
    }
}
if (state != (118 << 0) && state != (74 << 0) && state != (8 << 0))
    alarm[0] = room_speed
