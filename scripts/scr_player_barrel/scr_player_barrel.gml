function scr_player_barrel() //scr_player_barrel
{
    image_speed = 0.35
    move = (key_right + key_left)
    if (barrelslope && grounded)
        barrelslope = 0
    if (place_meeting(x, y, obj_water) && sprite_index != spr_player_barrelfloat)
        sprite_index = spr_player_barrelfloat
    if (sprite_index != spr_player_barrelmove && sprite_index != spr_player_barrelidle)
        hsp = (xscale * movespeed)
    if (sprite_index == spr_player_barrelslipnslide && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_barrelroll
        movespeed = 12
    }
    if (place_meeting((x + hsp), y, obj_solid) && (!scr_slope()) && sprite_index == spr_barrelroll && (!(place_meeting((x + hsp), y, obj_barrelblock))) && (!(place_meeting((x + hsp), y, obj_destructibles))))
    {
        state = (82 << 0)
        hsp = ((-xscale) * 5)
        vsp = -7
        repeat (4)
            instance_create(x, y, obj_wooddebris)
        mask_index = spr_player_mask
        if scr_solid(x, y)
        {
            var ty = try_solid(0, 1, 92, 32)
            if (ty != -1)
                y += ty
        }
    }
    else if (place_meeting((x + hsp), y, obj_solid) && scr_slope() && sprite_index == spr_barrelroll && (!(place_meeting((x + hsp), y, obj_barrelblock))) && (!(place_meeting((x + hsp), y, obj_destructibles))))
    {
        vsp = -10
        xscale *= -1
        movespeed = 0
        jumpstop = 1
        barrelslope = 1
    }
    if (grounded && vsp > 0)
        movespeed = 12
    if key_jump
        input_buffer_jump = 0
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump < 8 && grounded && hsp != 0)
    {
        with (instance_create(x, y, obj_highjumpcloud2))
            image_xscale = other.xscale
        vsp = -11
    }
    if ((!grounded) && (sprite_index == spr_player_barrelmove || sprite_index == spr_player_barrelidle))
        sprite_index = spr_player_barrelfall
    if (grounded && sprite_index == spr_player_barrelfall)
    {
        image_index = 0
        sprite_index = spr_player_barrelcrouch
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_barrelcrouch)
        sprite_index = spr_player_barrelidle
    if (sprite_index == spr_player_barrelmove || sprite_index == spr_player_barrelidle || sprite_index == spr_player_barrelfloat || sprite_index == spr_player_barrelfall)
    {
        hsp = (movespeed * move)
        if (move != 0)
        {
            xscale = move
            sprite_index = spr_player_barrelmove
        }
        else if (sprite_index == spr_player_barrelmove)
            sprite_index = spr_player_barrelidle
        if (move != 0)
        {
            if (movespeed < 6)
                movespeed += 0.5
            else if (floor(movespeed) == 6)
                movespeed = 6
        }
        else
            movespeed = 0
        if (movespeed > 6)
            movespeed -= 0.1
    }
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
}

