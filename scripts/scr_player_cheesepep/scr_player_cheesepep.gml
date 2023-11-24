function scr_player_cheesepep() //scr_player_cheesepep
{
    stickdir = -1
    key_particles = 0
    mach2 = 0
    alarm[5] = 2
    alarm[7] = 60
    hurted = 1
    move = (key_left + key_right)
    if key_jump
        input_buffer_jump = 0
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (!(place_meeting(x, (y + 1), obj_railparent)))
        hsp = (xscale * movespeed)
    else
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp = ((xscale * movespeed) + (_railinst.movespeed * _railinst.dir))
    }
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 0
    }
    if (grounded && move != 0 && sprite_index == spr_cheesepepidle)
        sprite_index = spr_cheesepepwalk
    else if (grounded && move == 0 && sprite_index == spr_cheesepepwalk)
        sprite_index = spr_cheesepepidle
    if (input_buffer_jump < 8 && vsp > 0 && grounded && (sprite_index == spr_cheesepepidle || sprite_index == spr_cheesepepwalk))
    {
        input_buffer_jump = 8
        image_index = 0
        sprite_index = spr_cheesepepjumpstart
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheesepepjumpstart)
    {
        vsp = -11
        cheesepep_buffer = 0
        if key_right
            hsp = 4
        if (-key_left)
            hsp = -4
        sprite_index = spr_cheesepepjump
    }
    if ((floor(image_index) == (image_number - 1) && sprite_index == spr_cheesepepjump) || ((!grounded) && sprite_index != spr_cheesepepjump) || (vsp > 0 && sprite_index == spr_cheesepepjump))
        sprite_index = spr_cheesepepfall
    if (sprite_index == spr_cheesepepfall && grounded)
    {
        image_index = 0
        create_particle(x, y, (12 << 0), 0)
        freefallstart = 0
        momemtum = 0
        create_particle(x, y, (12 << 0), 0)
        sprite_index = spr_cheesepepland
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheesepepland)
        sprite_index = spr_cheesepepidle
    if (move != 0)
        xscale = move
    if (move != 0)
    {
        if (movespeed < 6)
            movespeed += 0.5
        else if (movespeed == 6)
            movespeed = 6
    }
    else
        movespeed = 0
    if (move != 0)
    {
        if (movespeed < 1)
            image_speed = 0.15
        else if (movespeed > 1 && movespeed < 6)
            image_speed = 0.35
        else
            image_speed = 0.6
    }
    else
        image_speed = 0.35
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheesepep_intro)
        sprite_index = spr_cheesepepidle
    if ((!instance_exists(obj_cloudeffect)) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
        instance_create(x, (y + 43), obj_cloudeffect)
    if (move != 0 && (floor(image_index) == 3 || floor(image_index) == 8) && steppy == 0)
        steppy = 1
    if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
        steppy = 0
    if place_meeting((x + sign(hsp)), y, obj_solid)
    {
        mask_index = spr_crouchmask
        if scr_solid((x + sign(hsp)), y)
        {
            cheesepep_buffer = cheesepep_max
            state = (21 << 0)
        }
        else if scr_solid((x + sign(hsp)), (y - 8))
        {
            cheesepep_buffer = cheesepep_max
            state = (22 << 0)
            if place_meeting((x + sign(hsp)), (y + 4), obj_solid)
            {
                while (!(place_meeting((x + sign(hsp)), (y + 1), obj_solid)))
                    y++
                stickdir = 1
            }
        }
    }
    var coldown = collision_line((x + (2 * sign(hsp))), y, (x + (2 * sign(hsp))), (bbox_bottom + 8), obj_solid, false, true)
    if (coldown == -4 && scr_solid(x, (y + 1)) && (!(place_meeting(x, (y + 1), obj_platform))) && (!(place_meeting((x + xscale), (y + 16), obj_slope))) && (!(place_meeting(x, (y + 15), obj_slope))))
    {
        if (cheesepep_buffer <= 0)
        {
            var old_y = y
            y++
            var tx = try_solid(sign(hsp), 0, 92, 64)
            if (tx != -1)
                x += (tx * sign(hsp))
            y = old_y
            y += 28
            if scr_solid(x, y)
            {
                tx = try_solid(xscale, 0, 92, 128)
                if (tx != -1)
                    x += (tx * xscale)
                else
                {
                    tx = try_solid((-xscale), 0, 92, 128)
                    if (tx != -1)
                        x += (tx * xscale)
                }
            }
            cheesepep_buffer = cheesepep_max
            state = (21 << 0)
            sprite_index = spr_cheesepepstickside
            hsp = 0
            vsp = 0
        }
        else
            hsp = 0
    }
    if (place_meeting(x, (y - 16), obj_solid) && vsp <= 1 && state != (21 << 0))
    {
        stickdir = -1
        mask_index = spr_crouchmask
        y = floor(y)
        var colup = collision_line(x, (bbox_bottom - 6), x, (bbox_top - 64), obj_solid, false, true)
        if (colup != -4)
        {
            while (!(place_meeting(x, (y - 1), obj_solid)))
                y--
        }
        hsp = 0
        vsp = -10
        cheesepep_buffer = cheesepep_max
        state = (22 << 0)
        stickdir = -1
        sprite_index = spr_cheesepepstickceiling
        trace(state)
    }
    if (place_meeting(x, y, obj_solid) && state != (22 << 0))
    {
        mask_index = spr_crouchmask
        if place_meeting((x + sign(hsp)), (y + 4), obj_solid)
        {
            while (!(place_meeting((x + sign(hsp)), (y + 1), obj_solid)))
                y++
            stickdir = 1
        }
        vsp = 0
        cheesepep_buffer = cheesepep_max
        state = (22 << 0)
        sprite_index = spr_cheesepepstickceiling
    }
}

