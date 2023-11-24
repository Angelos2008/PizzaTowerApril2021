with (other)
{
    if (character == "V")
        scr_hurtplayer(object_index)
    else if scr_transformationcheck()
    {
        if (instance_exists(other.baddieID) && sprite_index != spr_tumbleend && state != (5 << 0) && state != (33 << 0) && state != (27 << 0) && state != (120 << 0))
        {
            scr_losepoints()
            state = (5 << 0)
            xscale = other.baddieID.image_xscale
            movespeed = 14
            vsp = 0
            sprite_index = spr_tumble
        }
    }
}
