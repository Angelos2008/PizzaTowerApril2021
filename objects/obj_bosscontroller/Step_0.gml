if ((!instance_exists(bossID)) && bossID != noone && state != (74 << 0) && (!fakedeath))
{
    state = (74 << 0)
    alarm[1] = (room_speed * 4)
}
if (player_hp <= 0)
{
    fakedeath = 0
    if (state != (8 << 0) && state != (65 << 0))
    {
        if (endroundfunc != -4)
            self.endroundfunc()
        depth = (obj_player1.depth + 1)
        state = (8 << 0)
        with (bossID)
            self.player_destroy(lastplayerid)
    }
    else if (bossID.state != (43 << 0) && state != (65 << 0))
    {
        state = (65 << 0)
        alarm[1] = (room_speed * 4)
    }
}
if instance_exists(bossID)
{
    if (bossID.destroyed && (!fakedeath))
    {
        depth = (bossID.depth + 1)
        state = (8 << 0)
    }
}
switch state
{
    case (117 << 0):
        with (obj_player)
        {
            state = (119 << 0)
            xscale = (x > (room_width / 2) ? -1 : 1)
            image_blend = make_colour_hsv(0, 0, 255)
        }
        with (par_boss)
        {
            state = (119 << 0)
            x = xstart
        }
        if (playerx != 0)
            playerx += 5
        else if (!flashed)
        {
            flash = 1
            flashed = 1
            alarm[2] = (0.15 * room_speed)
        }
        if (bossx != (room_width - sprite_get_width(bossspr)))
            bossx -= 5
        if (vsy != 0)
            vsy += 5
        flamey -= 4
        if (intro_buffer > 0)
            intro_buffer--
        else
            state = (118 << 0)
        break
    case (118 << 0):
        if (timer_buffer > 0)
        {
            timer_buffer--
            instance_destroy(obj_noisebossbomb)
            with (obj_player)
            {
                if (state != (119 << 0) && state != (71 << 0) && state != (110 << 0) && (!instance_exists(obj_fadeout)))
                {
                    if (state == (110 << 0) || state == (43 << 0))
                    {
                        hitLag = 0
                        x = hitX
                        y = hitY
                    }
                    movespeed = 0
                    hsp = 0
                    vsp = 0
                    sprite_index = spr_idle
                    image_speed = 0.35
                    xscale = (x > (room_width / 2) ? -1 : 1)
                    image_blend = make_colour_hsv(0, 0, 255)
                    state = (119 << 0)
                    visible = true
                    image_alpha = 1
                }
                if (state == (119 << 0))
                    state_player_arenaround()
            }
            with (par_boss)
            {
                if (state == (110 << 0) || state == (43 << 0))
                {
                    hitLag = 0
                    x = hitX
                    y = hitY
                }
                if (colliding && state != (152 << 0) && state != (153 << 0))
                {
                    state = (118 << 0)
                    attack_cooldown = attack_max[(phase - 1)]
                }
            }
        }
        else
        {
            if (startroundfunc != -4)
                self.startroundfunc()
            minutes = maxminutes
            seconds = maxseconds
            alarm[0] = room_speed
            state = (0 << 0)
            with (obj_player)
            {
                if (object_index == obj_player1 || global.coop)
                    state = (0 << 0)
            }
            with (par_boss)
                state = (0 << 0)
        }
        break
    case (8 << 0):
        instance_destroy(obj_baddiespawner)
        instance_destroy(obj_baddie)
        if (player_hp > 0)
        {
            if ((!instance_exists(bossID)) || bossID.state != (110 << 0))
            {
                fade -= 0.05
                fade = clamp(fade, 0, 1)
            }
        }
        else
        {
            var hit = 0
            with (obj_player)
            {
                if (state == (110 << 0))
                    hit = 1
            }
            if (!hit)
            {
                fade -= 0.05
                fade = clamp(fade, 0, 1)
            }
        }
        break
    case (74 << 0):
    case (65 << 0):
        fade -= 0.05
        fade = clamp(fade, 0, 1)
        break
}

