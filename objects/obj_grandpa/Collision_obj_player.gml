with (obj_player)
{
    if (state == (33 << 0) || state == (27 << 0))
        instance_destroy(other)
}
sprite_index = spr_grandpa_punch
image_index = 0
scr_hurtplayer(other)
