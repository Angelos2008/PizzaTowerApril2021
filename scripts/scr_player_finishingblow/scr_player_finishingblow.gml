function scr_player_finishingblow() //scr_player_finishingblow
{
    hsp = 0
    vsp = 0
    if (floor(image_index) == (image_number - 1))
        state = (0 << 0)
    if (floor(image_index) == 5 && (!instance_exists(obj_swordhitbox)))
    {
        GamepadSetVibration((object_index == obj_player1 ? 0 : 1), 0.8, 0.65)
        scr_soundeffect(sfx_punch)
        scr_soundeffect(sfx_killingblow)
        with (instance_create(x, y, obj_swordhitbox))
            playerid = other.object_index
    }
    if (floor(image_index) == 0 && (!instance_exists(obj_swordhitbox)) && sprite_index == spr_swingdingend)
    {
        GamepadSetVibration((object_index == obj_player1 ? 0 : 1), 0.8, 0.65)
        scr_soundeffect(sfx_killingblow)
        with (instance_create(x, y, obj_swordhitbox))
            playerid = other.object_index
    }
    image_speed = 0.4
    landAnim = 0
}

