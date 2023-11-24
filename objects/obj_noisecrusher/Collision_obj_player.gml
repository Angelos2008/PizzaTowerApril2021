if (invframes == 0)
{
    if (state != (4 << 0) && obj_player.state != (24 << 0) && obj_player.state != (82 << 0))
    {
        with (obj_player)
        {
            if (y > other.y && other.vsp > 1 && other.grounded == 0 && other.state == (100 << 0))
                other.caughtplayer = 1
            if (y < other.y && attacking == 0 && state == (68 << 0) && vsp > 0 && sprite_index != spr_player_stompprep)
            {
                if (other.helmet == 0)
                {
                    other.stunned = 200
                    other.vsp = -5
                    other.hsp = ((-other.image_xscale) * 3)
                    other.state = (111 << 0)
                    other.image_index = 0
                }
                else
                    instance_create(x, (y + 50), obj_bumpeffect)
                instance_create(x, (y + 50), obj_stompeffect)
                image_index = 0
                stompAnim = 1
                sprite_index = spr_player_stompprep
                if key_jump2
                    vsp = -14
                else
                    vsp = -9
            }
            if ((state == (80 << 0) || state == (94 << 0) || state == (56 << 0)) && other.grounded == 1 && other.state == (111 << 0))
            {
                global.hit += 1
                instance_create(other.x, other.y, obj_slapstar)
                instance_create(other.x, other.y, obj_baddiegibs)
                other.flash = 1
                other.hp -= 1
                if (other.hp <= 0)
                    thrown = 1
                instance_create(x, y, obj_bumpeffect)
                other.vsp = -10
                other.hsp = xscale
                other.image_index = 0
                other.stunned = 200
                other.state = (111 << 0)
                machpunchAnim = 1
                if ((!grounded) && state != (84 << 0) && key_jump2)
                {
                    sprite_index = spr_player_mach2jump
                    vsp = -11
                }
            }
            if ((!(y < other.y)) && state != (82 << 0) && state != (83 << 0) && other.state != (111 << 0))
            {
                instance_create(x, y, obj_bumpeffect)
                if (x != other.x)
                    xscale = (-(sign((x - other.x))))
                hsp = ((-xscale) * 10)
                vsp = -4
                image_index = 0
                state = (82 << 0)
            }
        }
    }
}
