function scr_player_cheeseball() //scr_player_cheeseball
{
    image_speed = 0.35
    if ((x + hsp) == xprevious)
        stop_buffer--
    else
        stop_buffer = 8
    hsp = (xscale * 12)
    if (((!scr_slope()) && instance_place((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_cheeseballblock)))) || stop_buffer <= 0)
    {
        grav = 0.5
        repeat (8)
            instance_create(x, y, obj_slimedebris)
        if (x != other.x)
            hsp = (sign((x - other.x)) * 5)
        else
            hsp = 5
        vsp = -3
        visible = true
        image_index = 0
        image_index = 0
        flash = 1
        state = (82 << 0)
    }
    sprite_index = spr_cheeseballplayer
    if ((!grounded) && key_down)
        vsp = 10
    if key_jump
        input_buffer_jump = 0
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 10
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump < 8 && grounded)
    {
        instance_create(x, y, obj_highjumpcloud2)
        vsp = -11
    }
}

