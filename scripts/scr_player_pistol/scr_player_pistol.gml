function scr_player_pistol() //scr_player_pistol
{
    move = (key_right + key_left)
    hsp = (xscale * movespeed)
    if (grounded && movespeed > 0)
        movespeed -= 0.25
    if (floor(image_index) == (image_number - 1))
        state = (0 << 0)
    if (scr_solid((x + sign(hsp)), y) && xscale == 1 && move == 1 && ((!(place_meeting((x + 1), y, obj_slope))) || scr_solid_slope((x + 1), y)))
        movespeed = 0
    if (scr_solid((x + sign(hsp)), y) && xscale == -1 && move == -1 && ((!(place_meeting((x - 1), y, obj_slope))) || scr_solid_slope((x - 1), y)))
        movespeed = 0
    landAnim = 0
    image_speed = 0.4
    if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 4)
        instance_create(x, y, obj_slidecloud)
}

