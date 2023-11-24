if (room == custom_lvl_room)
    tile_layer_delete_at(1, x, y)
if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (6)
        create_debris((x + 16), (y + 16), 1055)
    tile_layer_delete_at(1, x, y)
    if (audio_is_playing(sfx_breakblock1) || audio_is_playing(sfx_breakblock2))
    {
        audio_stop_sound(sfx_breakblock1)
        audio_stop_sound(sfx_breakblock2)
    }
    scr_soundeffect(sfx_breakblock1, 4)
    ds_list_add(global.saveroom, id)
}
