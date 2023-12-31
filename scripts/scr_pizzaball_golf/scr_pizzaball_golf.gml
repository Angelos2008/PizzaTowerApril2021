function scr_pizzaball_golf() //scr_pizzaball_golf
{
    jspd = 8
    kicked = 0
    if (!meter)
    {
        image_xscale = player.xscale
        sprite_index = spr_pizzaball_stun
        x = (player.x + (23 * player.xscale))
        y = player.y
        var angle_spd = 2
        if (image_xscale > 0)
        {
            if player.key_down
                m_angle -= angle_spd
            else if player.key_up
                m_angle += angle_spd
            if (m_angle >= 90)
                m_angle = 90
            if (m_angle <= -26)
                m_angle = -26
        }
        else if (image_xscale < 0)
        {
            if player.key_down
                m_angle += angle_spd
            else if player.key_up
                m_angle -= angle_spd
            if (m_angle <= 90)
                m_angle = 90
            if (m_angle >= 206)
                m_angle = 206
        }
        if (player.key_slap2 && (!player.key_attack))
        {
            meter = 1
            turn = 0
            m_meter = 0
        }
        if (player.key_left < 0 && image_xscale > 0 && (!player.key_attack))
        {
            player.xscale = -1
            turn = 1
            m_angle = 180
        }
        else if (player.key_right && image_xscale < 0 && (!player.key_attack))
        {
            player.xscale = 1
            m_angle = 0
            turn = 1
        }
    }
    else
    {
        var _mtspd = 0.025
        if (player.sprite_index != player.spr_golfswing)
        {
            if (turn == 1)
            {
                m_meter -= _mtspd
                if (m_meter < 0)
                {
                    turn = 0
                    m_meter = 0
                }
            }
            else
            {
                m_meter += _mtspd
                if (m_meter > 1)
                {
                    turn = 1
                    m_meter = 1
                }
            }
        }
        if (player.key_slap2 && (!player.key_attack) && player.sprite_index != player.spr_golfswing)
        {
            with (player)
            {
                state = (67 << 0)
                hsp = 0
                movespeed = 0
                image_index = 0
                sprite_index = spr_golfswing
            }
        }
        if (player.sprite_index == player.spr_golfswing && floor(player.image_index) == 9)
        {
            x = player.x
            y = (player.y - 40)
            global.golfhit++
            if (!(scr_solid((x + (2 * image_xscale)), y)))
                x += (2 * image_xscale)
            m_meter += 0.25
            state = (0 << 0)
            thrown = 1
            sprite_index = spr_pizzaball_idle
            meter = 0
            movespeed = abs(lengthdir_x((m_spd * m_meter), m_angle))
            image_xscale = player.xscale
            hsp = (image_xscale * movespeed)
            vsp = lengthdir_y((m_spd * m_meter), m_angle)
            var _my_id = id
            with (obj_camera)
            {
                follow_golf = 1
                targetgolf = _my_id
            }
            if scr_solid(x, y)
            {
                x = player.x
                y = player.y
            }
        }
    }
    if (player.state != (121 << 0) && player.state != (67 << 0))
    {
        state = (0 << 0)
        meter = 0
        thrown = 0
    }
}

