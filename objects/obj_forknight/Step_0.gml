if (room == rm_editor)
{
}
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
    case (126 << 0):
        scr_enemy_pummel()
        break
    case (127 << 0):
        scr_enemy_staggered()
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
scr_scareenemy()
if (global.stylethreshold >= 3 && ragecooldown == 0)
{
    var player = instance_nearest(x, y, obj_player)
    if (state == (107 << 0))
    {
        if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
        {
            image_xscale = (-(sign((x - player.x))))
            sprite_index = spr_forknight_ragestart
            image_index = 0
            flash = 1
            alarm[4] = 5
            state = (98 << 0)
            ragedash = 50
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
        }
    }
}
if (ragedash > 0 && state == (98 << 0))
    ragedash--
if (ragedash == 0 && state == (98 << 0))
{
    state = (107 << 0)
    sprite_index = walkspr
    ragecooldown = 100
}
if (ragecooldown > 0)
    ragecooldown--
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (hitboxcreate == 0 && state == (107 << 0))
{
    hitboxcreate = 1
    with (instance_create(x, y, obj_forkhitbox))
        ID = other.id
}
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
