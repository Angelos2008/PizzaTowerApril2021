function state_boss_stun() //state_boss_stun
{
    switch hp
    {
        case -1:
            grav = 1.1
            break
        case -2:
            grav = 1.3
            break
    }

    switch global.stylethreshold
    {
        case 0:
            stunned -= 0.5
            break
        case 1:
            stunned -= 1
            break
        case 2:
            stunned -= 1.5
            break
        case 3:
            stunned -= 2
    }

    if (stuntouchbuffer > 0)
        stuntouchbuffer--
    sprite_index = stunfallspr
    image_speed = 0.35
    if ((grounded || (grounded && (!(place_meeting(x, y, obj_platform))))) && vsp > 0)
    {
        if (thrown == 1 && hp <= 0 && destroyable)
            instance_destroy()
        thrown = 0
        grav = 0.5
        hsp = 0
    }
    if place_meeting(x, (y + 1), obj_railh)
        hsp = -5
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = 5
    if (place_meeting((x - image_xscale), y, obj_solid) && (!(place_meeting((x - image_xscale), y, obj_destructibles))))
    {
        particle_set_scale((8 << 0), (-image_xscale), 1)
        create_particle(x, y, (8 << 0), 0)
        if (thrown == 1 && hp <= 0 && destroyable)
            instance_destroy()
        thrown = 0
        grav = 0.5
        image_xscale *= -1
        hsp = ((-image_xscale) * 4)
    }
    if (stunned <= 0)
    {
        if (object_index != obj_miniufo && object_index != obj_ancho && object_index != obj_pizzaboy)
            vsp = -4
        else
            vsp = 0
        image_index = 0
        sprite_index = walkspr
        state = (107 << 0)
    }
}

