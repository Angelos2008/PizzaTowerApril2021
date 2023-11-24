function scr_player_bombpep() //scr_player_bombpep
{
    alarm[8] = 60
    alarm[7] = 120
    hurted = 1
    if key_jump
        input_buffer_jump = 0
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    mach2 = 0
    landAnim = 0
    alarm[5] = 2
    if (sprite_index == spr_bombpepintro && floor(image_index) == (image_number - 1))
        sprite_index = spr_bombpeprun
    if (sprite_index == spr_bombpeprun || sprite_index == spr_bombpeprunabouttoexplode)
    {
        if (movespeed <= 8)
            movespeed += 0.2
        move = (key_left + key_right)
        if grounded
        {
            if (move != 0 && (!instance_exists(obj_bumpeffect)))
                xscale = move
        }
        hsp = floor((xscale * movespeed))
    }
    else
    {
        hsp = 0
        movespeed = 0
    }
    if (bombpeptimer < 20 && bombpeptimer != 0)
        sprite_index = spr_bombpeprunabouttoexplode
    if (sprite_index == spr_bombpepend && floor(image_index) == (image_number - 1))
    {
        alarm[5] = 2
        alarm[7] = 60
        hurted = 1
        state = (0 << 0)
        sprite_index = spr_idle
        image_index = 0
    }
    if (bombpeptimer == 0 && sprite_index == spr_bombpeprunabouttoexplode)
    {
        scr_soundeffect(sfx_bombpep2)
        hurted = 1
        scr_losepoints()
        instance_create(x, y, obj_bombexplosion)
        GamepadSetVibration((object_index == obj_player1 ? 0 : 1), 1, 1, 0.9)
        sprite_index = spr_bombpepend
    }
    if (bombpeptimer > 0)
        bombpeptimer -= 0.5
    if (scr_solid((x + 1), y) && xscale == 1 && hsp != 0 && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)))
    {
        instance_create((x + 10), (y + 10), obj_bumpeffect)
        xscale *= -1
        GamepadSetVibration((object_index == obj_player1 ? 0 : 1), 0.2, 0.4)
    }
    if (scr_solid((x - 1), y) && xscale == -1 && hsp != 0 && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)))
    {
        instance_create((x - 10), (y + 10), obj_bumpeffect)
        xscale *= -1
        GamepadSetVibration((object_index == obj_player1 ? 0 : 1), 0.2, 0.4)
    }
    if (input_buffer_jump < 8 && grounded && hsp != 0)
        vsp = -11
    if (movespeed < 4)
        image_speed = 0.35
    else if (movespeed > 4 && movespeed < 8)
        image_speed = 0.45
    else
        image_speed = 0.6
    if (hsp != 0 && (floor(image_index) == 0 || floor(image_index) == 2) && steppy == 0 && grounded)
        steppy = 1
    if (floor(image_index) != 0 && floor(image_index) != 2)
        steppy = 0
    if (key_slap2 && state != (0 << 0) && sprite_index != spr_bombpepintro && sprite_index != spr_bombpepend)
    {
        sprite_index = spr_player_throw
        image_index = 0
        hsp = 0
        bombpeptimer = 0
        movespeed = 0
        state = (61 << 0)
        with (instance_create((x + (xscale * 50)), y, obj_pizzagoblinbomb))
        {
            hsp = (other.xscale * 8)
            vsp = -11
            if scr_solid(x, y)
            {
                var _dir = (-sign(other.xscale))
                var tx = try_solid(_dir, 0, 92, 78)
                if (tx != -1)
                    x += (tx * _dir)
            }
        }
    }
    if ((!instance_exists(obj_dashcloud)) && grounded && hsp != 0)
    {
        with (instance_create(x, y, obj_dashcloud))
            image_xscale = other.xscale
    }
}

