if (room == rm_editor)
{
}
if (bombreset > 0)
    bombreset--
switch state
{
    case (107 << 0):
        if (substate_buffer > 0)
            substate_buffer--
        else
        {
            substate_buffer = substate_max
            var old_substate = substate
            while (substate == old_substate)
                substate = choose((107 << 0), (99 << 0), (103 << 0), (102 << 0))
            if (substate == (107 << 0))
                image_xscale = choose(-1, 1)
            else if (substate == (103 << 0))
            {
                sprite_index = spr_pizzaslug_turn
                image_index = 0
                hsp = 0
            }
        }
        switch substate
        {
            case (107 << 0):
                image_speed = 0.35
                if (sprite_index != spr_pizzaslug_walk)
                {
                    image_index = 0
                    sprite_index = spr_pizzaslug_walk
                }
                scr_enemy_walk()
                break
            case (99 << 0):
                image_speed = 0.35
                hsp = 0
                sprite_index = spr_pizzaslug_idle
                break
            case (103 << 0):
                image_speed = 0.35
                substate_buffer = 5
                if (sprite_index == spr_pizzaslug_turn && floor(image_index) == (image_number - 1))
                {
                    image_xscale *= -1
                    substate_buffer = substate_max
                    substate = (99 << 0)
                    sprite_index = spr_pizzaslug_idle
                }
                break
            case (102 << 0):
                state = (102 << 0)
                substate_buffer = 0
                image_index = 0
                sprite_index = spr_pizzaslug_cough
                break
        }

        break
    case (99 << 0):
        scr_enemy_idle()
        break
    case (103 << 0):
        scr_enemy_turn()
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
    case (98 << 0):
        scr_enemy_rage()
        break
}

if (state == (111 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (111 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (global.stylethreshold >= 3 && ragecooldown == 0)
{
    var player = instance_nearest(x, y, obj_player)
    if (state == (107 << 0))
    {
        if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
        {
            if (x != player.x)
                image_xscale = (-(sign((x - player.x))))
            image_speed = 0.6
            hsp = 0
            shot = 0
            sprite_index = spr_pizzaslug_rage
            image_index = 0
            state = (98 << 0)
            flash = 1
            alarm[4] = 5
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
        }
    }
}
if (ragecooldown > 0)
    ragecooldown--
scr_scareenemy()
if (state != (4 << 0))
    depth = 0
if (state != (111 << 0))
    thrown = 0
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
