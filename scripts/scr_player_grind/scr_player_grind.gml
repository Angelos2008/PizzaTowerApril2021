function scr_player_grind() //scr_player_grind
{
    sprite_index = ((!skateboarding) ? spr_grind : spr_clown)
    image_speed = 0.35
    machhitAnim = 0
    crouchslideAnim = 1
    hsp = (xscale * movespeed)
    if (movespeed < 10)
        movespeed = 10
    if ((!(place_meeting(x, (y + 18), obj_grindrail))) && (!(place_meeting(x, (y + 18), obj_grindrailslope))))
    {
        if (movespeed < 12 || skateboarding)
            state = (80 << 0)
        else
            state = (94 << 0)
    }
    if (place_meeting((x + xscale), y, obj_solid) && (!(place_meeting(x, (y + 18), obj_grindrailslope))) && (!(place_meeting(x, (y + 1), obj_slope))))
    {
        state = (82 << 0)
        hsp = ((-xscale) * 5)
        vsp = 1
    }
    if (movespeed < 24 && move == xscale)
        movespeed += 0.1
    if key_jump
    {
        vsp = -11
        jumpstop = 0
        if skateboarding
        {
            sprite_index = spr_clownjump
            image_index = 0
        }
        if (movespeed < 12 || skateboarding)
            state = (80 << 0)
        else
            state = (94 << 0)
    }
    if (!instance_exists(obj_grindeffect))
        instance_create(x, y, obj_grindeffect)
}

