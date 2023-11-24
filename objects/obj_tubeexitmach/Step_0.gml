if (state == (123 << 0))
{
    if (image_index > (image_number - 1))
    {
        with (playerid)
        {
            if (sprite_index != spr_dashpadmach)
            {
                sprite_index = spr_dashpadmach
                vsp = 0
                image_index = 0
                instance_create(x, y, obj_jumpdust)
            }
            xscale = other.image_xscale
            if place_meeting(x, y, other.id)
            {
                while place_meeting(x, y, other.id)
                    x += sign(other.image_xscale)
            }
            machhitAnim = 0
            state = (94 << 0)
            if (movespeed < 14)
                movespeed = 14
            if (!(place_meeting(x, y, other.id)))
            {
                with (other)
                {
                    state = (0 << 0)
                    playerid = -1
                }
            }
        }
    }
}
