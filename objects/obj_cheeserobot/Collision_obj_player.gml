if (state != (4 << 0))
{
    with (obj_player)
    {
        if (y < other.y && attacking == 0 && state == (68 << 0) && vsp > 0)
        {
            if (vsp > 0)
            {
                other.stunned = 200
                if (x != other.x)
                    other.image_xscale = (-(sign((other.x - x))))
                image_index = 0
                if key_jump2
                {
                    other.vsp = -5
                    other.hsp = ((-other.image_xscale) * 3)
                    instance_create(x, (y + 50), obj_stompeffect)
                    other.state = (111 << 0)
                    stompAnim = 1
                    other.image_index = 0
                    vsp = -14
                    sprite_index = spr_player_stompprep
                }
                else
                {
                    other.vsp = -5
                    other.hsp = ((-other.image_xscale) * 3)
                    instance_create(x, (y + 50), obj_stompeffect)
                    other.state = (111 << 0)
                    stompAnim = 1
                    other.image_index = 0
                    vsp = -9
                    sprite_index = spr_player_stompprep
                }
            }
        }
        if (state == (79 << 0))
        {
            instance_create(x, y, obj_bumpeffect)
            other.stunned = 40
            if (x != other.x)
                other.image_xscale = (-(sign((other.x - x))))
            other.vsp = -5
            other.hsp = ((-other.image_xscale) * 3)
            hsp = ((-xscale) * 4)
            vsp = -4
            machpunchAnim = 1
            if (x != other.x)
                other.image_xscale = (-(sign((other.x - x))))
            other.state = (111 << 0)
            image_index = 0
            state = (67 << 0)
        }
        if ((state == (80 << 0) || state == (56 << 0)) && other.grounded == 1)
        {
            instance_create(x, y, obj_bumpeffect)
            other.vsp = -10
            other.hsp = xscale
            other.image_index = 0
            other.stunned = 200
            other.state = (111 << 0)
            machpunchAnim = 1
            if ((!grounded) && state != (84 << 0))
            {
                sprite_index = spr_player_mach2jump
                vsp = -10
            }
        }
        if (attacking == 1 && state != (80 << 0))
        {
            if (state == (94 << 0))
                other.shot = 1
            image_index = 0
            instance_destroy(other)
            machpunchAnim = 1
            if ((!grounded) && state != (84 << 0))
                vsp = -10
        }
        if (attacking == 0 && state != (67 << 0) && state != (83 << 0) && (!(y < other.y)) && grabbing == 0 && other.state != (111 << 0))
        {
            if (x != other.x)
            {
                other.image_xscale = (-(sign((other.x - x))))
                xscale = (-(sign((x - other.x))))
            }
            hsp = ((-xscale) * 4)
            vsp = -4
            other.image_xscale = (-xscale)
            other.hsp = ((-other.image_xscale) * 4)
            other.vsp = -4
            if (other.state == (107 << 0) || other.state == (103 << 0))
                other.state = (99 << 0)
            image_index = 0
            state = (82 << 0)
            if (other.state == (109 << 0))
                other.state = (99 << 0)
        }
    }
}
