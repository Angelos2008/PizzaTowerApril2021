image_speed = 0.35
if (!grounded)
    sprite_index = spr_monstertomato_chase
else if (sprite_index != spr_monstertomato_land && sprite_index != spr_monstertomato_idle)
{
    sprite_index = spr_monstertomato_land
    image_index = 0
}
else if (sprite_index == spr_monstertomato_land && floor(image_index) == (image_number - 1))
    sprite_index = spr_monstertomato_idle
scr_collide()
