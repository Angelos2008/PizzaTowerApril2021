function scr_player_handstandjump() //scr_player_handstandjump
{
    landAnim = 0
    hsp = (xscale * movespeed)
    move = (key_left + key_right)
    momemtum = 1
    dir = xscale
    if (movespeed < 10 && grounded)
        movespeed += 0.5
    else if (!grounded)
        movespeed = 10
    if (shotgunAnim == 1)
        var attackdash = spr_shotgunsuplexdash
    else
        attackdash = spr_suplexdash
    var airattackdash = spr_suplexdashjump
    var airattackdashstart = spr_suplexdashjumpstart
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 10
        jumpstop = 1
    }
    if (key_jump && grounded && (!key_down))
    {
        jumpstop = 0
        vsp = -11
        state = (80 << 0)
        sprite_index = spr_mach2jump
    }
    if (sprite_index == attackdash && (!grounded))
    {
        image_index = 0
        sprite_index = airattackdashstart
    }
    if (grounded && sprite_index == airattackdash && ((!key_attack) || character == "N"))
        state = (0 << 0)
    if (grounded && sprite_index == airattackdash && key_attack && character != "N")
        state = (80 << 0)
    if (floor(image_index) == (image_number - 1) && sprite_index == attackdash)
        state = (0 << 0)
    if (floor(image_index) == (image_number - 1) && sprite_index == airattackdashstart)
        sprite_index = airattackdash
    if (floor(image_index) == (image_number - 1) && key_attack && sprite_index == attackdash && character != "N")
    {
        if (!grounded)
            sprite_index = spr_mach2jump
        image_speed = 0.35
        state = (80 << 0)
        grav = 0.5
    }
    if (key_jump && doublejump == 0 && global.mort == 1 && (!grounded))
    {
        state = (68 << 0)
        repeat (6)
            create_debris(x, y, 1080)
        scr_soundeffect(sfx_woosh)
        sprite_index = spr_mortdoublejump
        image_index = 0
        grav = 0.25
        with (instance_create(x, y, obj_highjumpcloud2))
            image_xscale = other.xscale
        mort = 1
    }
    if (key_down && grounded)
    {
        grav = 0.5
        sprite_index = spr_breakdancesuper
        machhitAnim = 0
        state = (78 << 0)
        movespeed = 15
    }
    if (scr_solid((x + xscale), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x + xscale), y, obj_destructibles))))
    {
        var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
        if _bump
        {
            jumpstop = 1
            state = (68 << 0)
            vsp = -4
            sprite_index = spr_suplexbump
            instance_create((x + (xscale * 10)), (y + 10), obj_bumpeffect)
        }
    }
    if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
    {
        with (instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale
    }
    if (character == "S")
    {
        if key_attack
        {
            hsp = 0
            if (movespeed < 20)
                movespeed += 0.5
            if (movespeed == 20)
                sprite_index = spr_snick_superpeelout
            else if (movespeed < 20 && movespeed > 12)
                sprite_index = spr_snick_mach3
            else if (movespeed < 12 && movespeed > 8)
                sprite_index = spr_snick_mach2
            else
                sprite_index = spr_snick_walk
        }
        else if (movespeed >= 12)
            state = (94 << 0)
        else
        {
            state = (0 << 0)
            movespeed = 0
        }
        if ((!instance_exists(obj_dashcloud2)) && grounded && movespeed > 5)
        {
            with (instance_create(x, y, obj_dashcloud2))
                image_xscale = other.xscale
        }
    }
    image_speed = 0.35
    if (state != (82 << 0) && move != xscale && move != 0)
    {
        image_index = 0
        if (!grounded)
        {
            sprite_index = spr_suplexcancel
            jumpAnim = 1
            grav = 0.5
            state = (68 << 0)
        }
        else
        {
            state = (0 << 0)
            grav = 0.5
        }
    }
}

