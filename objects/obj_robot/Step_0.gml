switch state
{
    case (99 << 0):
        scr_enemy_idle()
        break
    case (101 << 0):
        scr_enemy_charge()
        break
    case (103 << 0):
        scr_enemy_turn()
        break
    case (107 << 0):
        scr_enemy_walk()
        break
    case (109 << 0):
        scr_enemy_land()
        break
    case (110 << 0):
        scr_enemy_hit()
        break
    case (111 << 0):
        scr_enemy_stun()
        break
    case (102 << 0):
        scr_pizzagoblin_throw()
        break
    case (4 << 0):
        scr_enemy_grabbed()
        break
    case (79 << 0):
        if (image_index > (image_number - 1))
        {
            hsp = (image_xscale * startmachspeed)
            sprite_index = spr_robot_mach
            image_index = 0
            state = (80 << 0)
        }
        break
    case (80 << 0):
        hsp = Approach(hsp, (image_xscale * machspeed), 0.5)
        if (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
        {
            state = (111 << 0)
            stunned = 100
            vsp = -4
            hsp = ((-image_xscale) * 2)
        }
        break
    case (67 << 0):
        if (image_index > 8)
            hsp = (image_xscale * tacklespeed)
        if (image_index > (image_number - 1))
        {
            state = (107 << 0)
            sprite_index = walkspr
        }
        if (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
        {
            state = (111 << 0)
            stunned = 100
            vsp = -8
            hsp = ((-image_xscale) * 5)
        }
        break
    case (18 << 0):
        hsp = 0
        if (image_index > (image_number - 1))
        {
            state = (107 << 0)
            sprite_index = walkspr
        }
        break
}

if (state == (111 << 0) && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (111 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != (4 << 0))
    depth = 0
if (state != (111 << 0))
    thrown = 0
if (bombreset > 0)
    bombreset--
invincible = state == (80 << 0)
targetplayer = instance_nearest(x, y, obj_player)
if (x != targetplayer.x && state != (102 << 0) && bombreset == 0)
{
    if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 20) && y >= (targetplayer.y - 20))
    {
        if (state == (107 << 0) || state == (99 << 0))
        {
            image_index = 0
            image_xscale = (-(sign((x - targetplayer.x))))
            state = choose((79 << 0), (67 << 0), (18 << 0))
            bombreset = 100
            switch state
            {
                case (79 << 0):
                    sprite_index = spr_robot_machstart
                    image_index = 0
                    image_speed = 0.6
                    hsp = 0
                    break
                case (67 << 0):
                    sprite_index = spr_robot_tackle
                    image_index = 0
                    image_speed = 0.6
                    hsp = 0
                    break
                case (18 << 0):
                    sprite_index = spr_robot_slap
                    image_index = 0
                    image_speed = 0.6
                    hsp = 0
                    break
            }

        }
    }
}
if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
if (state == (80 << 0) || (state == (18 << 0) && image_index > 13) || (state == (67 << 0) && image_index > 8))
{
    if (!hitboxcreate)
    {
        hitboxcreate = 1
        with (instance_create(x, y, obj_forkhitbox))
        {
            if (other.state == (18 << 0))
                sprite_index = spr_swordhitbox
            ID = other.id
        }
    }
}
else
    hitboxcreate = 0
