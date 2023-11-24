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
}

if (state == (111 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (111 << 0))
    birdcreated = 0
if (state == (107 << 0) && y > ystart && (!(scr_solid(x, (y - 1)))))
    y--
if (state == (107 << 0) && y < ystart && (!(scr_solid(x, (y + 1)))))
    y++
if (state == (111 << 0))
    grav = 0.5
else
    grav = 0
if (bombreset > 0 && state == (107 << 0))
    bombreset--
var player = instance_nearest(x, y, obj_player)
if (ragebuffer > 0)
    ragebuffer--
if (player.x > (x - 200) && player.x < (x + 200) && player.y <= (y + 400) && player.y >= (y - 60))
{
    if (x != player.x && state != (102 << 0) && bombreset == 0)
    {
        if (state == (107 << 0) || state == (99 << 0))
        {
            sprite_index = spr_ufolive_shoot
            image_index = 0
            state = (102 << 0)
        }
    }
}
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state == (102 << 0) || state == (98 << 0))
{
    hsp = 0
    vsp = 0
}
if (state != (4 << 0))
    depth = 0
scr_scareenemy()
if (state == (107 << 0))
{
    if (turntimer > 0)
        turntimer--
}
if (turntimer <= 0)
{
    image_xscale *= -1
    turntimer = 600
}
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
