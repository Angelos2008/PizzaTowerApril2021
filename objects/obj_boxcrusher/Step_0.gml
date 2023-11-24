if (y == ystart && obj_player.state != (24 << 0) && obj_player.x > (x - 50) && obj_player.x < (x + 50) && obj_player.y > y && obj_player.y < (y + 200))
{
    grav = 0.35
    vsp = 10
    sprite_index = spr_boxcrusher_fall
}
if (sprite_index == spr_boxcrusher_fall && grounded)
{
    with (obj_camera)
    {
        shake_mag = 10
        shake_mag_acc = (30 / room_speed)
    }
    vsp = 0
    image_index = 0
    sprite_index = spr_boxcrusher_land
}
else if (sprite_index == spr_boxcrusher_land && floor(image_index) == (image_number - 1))
{
    grav = 0
    sprite_index = spr_boxcrusher_idle
    vsp = -1
}
if (y == ystart && vsp == -1)
    vsp = 0
scr_collide()
