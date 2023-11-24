with (other)
{
    if (state != (157 << 0))
    {
        if (state == (70 << 0) || state == (156 << 0) || state == (55 << 0) || state == (5 << 0) || state == (17 << 0) || state == (27 << 0) || state == (47 << 0) || state == (94 << 0) || state == (80 << 0))
        {
            other.sprite_index = spr_sidespringblock_bounce
            other.image_index = 0
            if (xscale != other.image_xscale)
                xscale = other.image_xscale
        }
    }
}
