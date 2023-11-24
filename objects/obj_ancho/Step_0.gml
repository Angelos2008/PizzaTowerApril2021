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
if (state == (107 << 0) && y > ystart && (!(scr_solid(x, (y - 1)))))
    y--
if (state == (107 << 0) && y < ystart && (!(scr_solid(x, (y + 1)))))
    y++
if (state == (111 << 0))
    grav = 0.5
else
    grav = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != (4 << 0))
    depth = 0
if (state != (101 << 0))
    scr_scareenemy()
if (sprite_index == spr_ancho_chargestart && floor(image_index) == (image_number - 1))
{
    if (hitboxcreate == 0 && state == (101 << 0))
    {
        hitboxcreate = 1
        with (instance_create(x, y, obj_forkhitbox))
            ID = other.id
    }
    sprite_index = spr_ancho_charge
    movespeed = 10
}
var player = instance_nearest(x, y, obj_player)
if (ragebuffer > 0)
    ragebuffer--
if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
{
    if (state != (98 << 0) && ragebuffer == 0 && global.stylethreshold >= 3 && (state == (107 << 0) || state == (101 << 0)))
    {
        state = (98 << 0)
        sprite_index = spr_ancho_rage1
        if (x != player.x)
            image_xscale = (-(sign((x - player.x))))
        ragebuffer = 100
        image_index = 0
        image_speed = 0.5
        flash = 1
        alarm[4] = 5
        with (instance_create(x, y, obj_forkhitbox))
        {
            sprite_index = spr_bighitbox
            mask_index = spr_bighitbox
            ID = other.id
        }
        create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
    }
    else if (x != player.x && state != (101 << 0) && y == ystart)
    {
        if (state == (107 << 0))
        {
            image_index = 0
            image_xscale = (-(sign((x - obj_player.x))))
            state = (101 << 0)
            sprite_index = spr_ancho_chargestart
        }
    }
}
if (state == (111 << 0) || state == (107 << 0))
    movespeed = 0
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
