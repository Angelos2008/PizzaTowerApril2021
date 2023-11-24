with (other)
{
    if (state != (157 << 0) && state != (119 << 0))
    {
        var changecoord = 1
        if place_meeting(x, y, obj_superspring)
            changecoord = 0
        if (character == "P")
        {
            if (sprite_index != spr_dashpadmach)
            {
                if changecoord
                    y = (other.y - 14)
                sprite_index = spr_dashpadmach
                image_index = 0
                vsp = 0
                create_particle(x, y, (5 << 0), 0)
            }
        }
        else if (character == "N")
        {
            if (sprite_index != spr_crazyrun)
            {
                if changecoord
                    y = (other.y - 14)
                sprite_index = spr_crazyrun
                image_index = 0
                vsp = 0
                create_particle(x, y, (5 << 0), 0)
            }
        }
        xscale = sign(other.image_xscale)
        machhitAnim = 0
        state = (94 << 0)
        if (movespeed < 14)
            movespeed = 14
    }
}
