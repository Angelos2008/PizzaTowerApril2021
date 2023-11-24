function scr_player_firemouth() //scr_player_firemouth
{
    alarm[5] = 2
    alarm[7] = 60
    if (sprite_index == spr_firemouthintro || sprite_index == spr_firemouthend)
        mask_index = spr_crouchmask
    else
        mask_index = spr_player_mask
    move = (key_left + key_right)
    with (instance_place((x + xscale), y, obj_destructibles))
        instance_destroy()
    with (instance_place((x + xscale), y, obj_tntblock))
        instance_destroy()
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
    if (sprite_index == spr_firemouthintro && floor(image_index) == (image_number - 1))
    {
        scr_losepoints()
        sprite_index = spr_firemouth
    }
    if (sprite_index == spr_firemouth)
    {
        if (movespeed <= 10)
            movespeed += 0.2
        move = (key_left + key_right)
        hsp = floor(((xscale * movespeed) + (move * 2)))
    }
    else
    {
        hsp = 0
        movespeed = 0
    }
    if (sprite_index == spr_firemouthend && floor(image_index) == (image_number - 1))
    {
        alarm[5] = 2
        alarm[7] = 60
        state = (0 << 0)
        sprite_index = spr_player_idle
        image_index = 0
    }
    if (scr_solid((x + 1), y) && xscale == 1 && hsp != 0 && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_iceblock))))
    {
        instance_create((x + 10), (y + 10), obj_bumpeffect)
        xscale *= -1
        GamepadSetVibration((object_index == obj_player1 ? 0 : 1), 0.2, 0.4)
        movespeed /= 2
    }
    if (scr_solid((x - 1), y) && xscale == -1 && hsp != 0 && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        instance_create((x - 10), (y + 10), obj_bumpeffect)
        xscale *= -1
        GamepadSetVibration((object_index == obj_player1 ? 0 : 1), 0.2, 0.4)
        movespeed /= 2
    }
    with (instance_place((x + hsp), y, obj_iceblock))
        instance_destroy()
    if (input_buffer_jump < 8 && grounded && hsp != 0)
    {
        instance_create(x, y, obj_highjumpcloud2)
        vsp = -11
    }
    if (sprite_index == spr_firemouth)
    {
        if (movespeed < 4)
            image_speed = 0.35
        else if (movespeed > 4 && movespeed < 8)
            image_speed = 0.45
        else
            image_speed = 0.6
    }
    else
        image_speed = 0.35
    if (hsp != 0 && (floor(image_index) == 0 || floor(image_index) == 2) && steppy == 0 && grounded)
        steppy = 1
    if (floor(image_index) != 0 && floor(image_index) != 2)
        steppy = 0
    if ((!instance_exists(obj_dashcloud)) && grounded && hsp != 0)
    {
        with (instance_create(x, y, obj_dashcloud))
            image_xscale = other.xscale
    }
}

