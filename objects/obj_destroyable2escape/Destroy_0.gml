if (ds_list_find_index(global.saveroom, id) == -1)
{
    if (global.panic == 1)
    {
        repeat (6)
            create_debris((x + 16), (y + 16), 1056)
        create_baddiegibsticks((x + 16), (y + 16))
        instance_create(x, y, obj_collect)
        tile_layer_delete_at(1, x, y)
        if (audio_is_playing(sfx_breakblock1) || audio_is_playing(sfx_breakblock2))
        {
            audio_stop_sound(sfx_breakblock1)
            audio_stop_sound(sfx_breakblock2)
        }
        scr_soundeffect(sfx_breakblock1, 4)
        ds_list_add(global.saveroom, id)
    }
}
