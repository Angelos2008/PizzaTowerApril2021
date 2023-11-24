if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (4)
        create_debris((x + 32), (y + 32), 1389)
    tile_layer_delete_at(1, x, y)
    tile_layer_delete_at(1, (x + 32), y)
    tile_layer_delete_at(1, (x + 32), (y + 32))
    tile_layer_delete_at(1, x, (y + 32))
    with (obj_camera)
    {
        shake_mag = 20
        shake_mag_acc = (40 / room_speed)
    }
    GamepadSetVibration(playerindex, 1, 1, 0.8)
    scr_soundeffect(sfx_breakmetal)
    ds_list_add(global.saveroom, id)
}
depth = 1
