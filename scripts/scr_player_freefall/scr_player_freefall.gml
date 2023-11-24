function scr_player_freefall() //scr_player_freefall
{
    landAnim = 1
    vsp = freefallvsp
    freefallvsp += 0.2
    move = (key_left + key_right)
    if (!grounded)
    {
        hsp = (move * movespeed)
        if (move != xscale && momemtum == 1 && movespeed != 0)
            movespeed -= 0.05
        if (movespeed == 0)
            momemtum = 0
        if ((move == 0 && momemtum == 0) || scr_solid((x + hsp), y))
        {
            movespeed = 0
            mach2 = 0
        }
        if (move != 0 && movespeed < 7)
            movespeed += 0.25
        if (movespeed > 7)
            movespeed -= 0.05
        if ((scr_solid((x + 1), y) && move == 1) || (scr_solid((x - 1), y) && move == -1))
            movespeed = 0
        if (dir != xscale)
        {
            mach2 = 0
            dir = xscale
            movespeed = 0
        }
        if (move == (-xscale))
        {
            mach2 = 0
            movespeed = 0
            momemtum = 0
        }
        if (move != 0)
            xscale = move
    }
    freefallsmash++
    if (freefallsmash > 10 && (!instance_exists(superslameffectid)))
    {
        with (instance_create(x, y, obj_superslameffect))
        {
            playerid = other.object_index
            other.superslameffectid = id
        }
    }
    if (grounded && (!(input_buffer_jump < 8)) && (!(place_meeting(x, (y + vsp), obj_destructibles))))
    {
        scr_soundeffect(sfx_groundpound)
        if (shotgunAnim == 0)
            sprite_index = spr_bodyslamland
        else
            sprite_index = spr_shotgunjump2
        image_index = 0
        state = (87 << 0)
        jumpAnim = 1
        jumpstop = 0
        with (obj_camera)
        {
            shake_mag = 5
            shake_mag_acc = (15 / room_speed)
        }
        if (freefallsmash > 10)
        {
            with (obj_baddie)
            {
                if (grounded && point_in_camera(x, y, view_camera[0]) && (!invincible) && groundpound)
                {
                    state = (111 << 0)
                    if (stunned < 60)
                        stunned = 60
                    vsp = -11
                    image_xscale *= -1
                    hsp = 0
                    momentum = 0
                }
            }
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            combo = 0
            bounce = 0
        }
        create_particle(x, y, (12 << 0), 0)
        freefallstart = 0
    }
    image_speed = 0.35
    if (character == "M")
    {
        if (!key_down)
        {
            state = (68 << 0)
            sprite_index = spr_fall
            image_index = 0
        }
    }
}

