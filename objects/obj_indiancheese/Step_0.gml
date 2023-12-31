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
    case (98 << 0):
        scr_enemy_rage()
        break
}

scr_scareenemy()
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
var player = instance_nearest(x, y, obj_player)
if (global.stylethreshold >= 3 && ragecooldown > 0)
    ragecooldown--
if (state == (107 << 0) && sprite_index == walkspr && sprite_index != spr_indiancheese_scared && global.stylethreshold >= 3 && ragecooldown == 0)
{
    if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
    {
        image_xscale = (-(sign((x - player.x))))
        state = (98 << 0)
        sprite_index = spr_indiancheese_howl
        image_index = 0
        shot = 0
        ragedash = 50
        hsp = 0
        flash = 1
        alarm[4] = 5
        create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
    }
}
if (state == (107 << 0) && grounded && state != (98 << 0) && place_meeting((x + (image_xscale * 10)), y, obj_solid) && (!(place_meeting((x + (image_xscale * 10)), (y - 100), obj_solid))))
{
    vsp = -11
    sprite_index = spr_indiancheese_jump
    image_index = 0
    state = (101 << 0)
    instance_create(x, y, obj_highjumpcloud2)
}
if ((!grounded) && sprite_index == spr_indiancheese_jump && floor(image_index) == (image_number - 1))
    image_speed = 0
else if (image_speed == 0)
    image_speed = 0.35
if (sprite_index == spr_indiancheese_land && floor(image_index) == (image_number - 1))
    sprite_index = spr_indiancheese_walk
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
