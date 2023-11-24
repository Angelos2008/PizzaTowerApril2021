with (other)
{
    if (character == "V")
        scr_hurtplayer(object_index)
    else
    {
        var b = 1
        for (i = 0; i < array_length(transformation); i += 1)
        {
            if (state == transformation[i])
                b = 0
        }
        if (b == 1)
        {
            if (state != (33 << 0) && state != (43 << 0) && state != (120 << 0) && hurted == 0)
            {
                scr_losepoints()
                scr_soundeffect(sfx_becomeknight)
                hsp = 0
                movespeed = 0
                state = (33 << 0)
                image_index = 0
                sprite_index = spr_knightpepthunder
                instance_destroy(other)
            }
        }
    }
}
