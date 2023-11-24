switch state
{
    case (0 << 0):
        for (var i = 0; i < ds_list_size(baddielist); i++)
            instance_deactivate_object(array_get(ds_list_find_value(baddielist, i), 1))
        if (collisioned && ds_list_find_index(global.saveroom, id) == -1)
        {
            if ((dir == 1 && targetplayer.x > (x + offset)) || (dir == -1 && targetplayer.x < (x - offset)))
            {
                if (!instance_exists(block_inst))
                {
                    block_inst = instance_create_depth(x, y, depth, obj_solid)
                    block_inst.sprite_index = spr_arenagate_open
                    block_inst.mask_index = spr_arenagate_open
                    block_inst.image_xscale = image_xscale
                    block_inst.image_yscale = image_yscale
                    block_inst.visible = false
                }
                with (obj_arenagate)
                {
                    if (!instance_exists(block_inst))
                    {
                        block_inst = instance_create_depth(x, y, depth, obj_solid)
                        block_inst.sprite_index = spr_arenagate_open
                        block_inst.mask_index = spr_arenagate_open
                        block_inst.image_xscale = image_xscale
                        block_inst.image_yscale = image_yscale
                        block_inst.visible = false
                    }
                    sprite_index = spr_arenagate_close
                }
                cutscene_count = cutscene_max
                sprite_index = spr_arenagate_close
                image_speed = 0.5
                with (obj_camera)
                {
                    shake_mag = 3
                    shake_mag_acc = (3 / room_speed)
                }
                state = (115 << 0)
                round_count = round_max
                with (targetplayer)
                {
                    var _player2 = (object_index == obj_player1 ? obj_player2 : obj_player1)
                    if global.coop
                    {
                        _player2.x = x
                        _player2.y = y
                    }
                }
            }
            else if ((dir == 1 && targetplayer.x < x) || (dir == -1 && targetplayer.x > (x + sprite_width)))
                collisioned = 0
        }
        break
    case (117 << 0):
        with (obj_player)
        {
            xscale = sign((other.x - x))
            state = (117 << 0)
            sprite_index = spr_player_bossintro
        }
        if (cutscene_count > 0)
            cutscene_count--
        else
        {
            with (obj_player)
            {
                state = (0 << 0)
                image_index = 0
            }
            state = (118 << 0)
            round_count = round_max
        }
        break
    case (118 << 0):
        if (round_count > 0)
            round_count--
        else
            state = (116 << 0)
        break
    case (115 << 0):
        if (!ds_list_empty(baddielist))
        {
            for (i = 0; i < ds_list_size(baddielist); i++)
            {
                var b = ds_list_find_value(baddielist, i)
                if (b[0] == wave)
                {
                    instance_activate_object(b[1])
                    if instance_exists(b[1])
                    {
                        with (instance_create(b[1].x, b[1].y, obj_arena_pizzaportal))
                        {
                            stored_id = b[1]
                            alarm[0] = other.round_max
                        }
                        instance_deactivate_object(b[1])
                    }
                }
                else
                    instance_deactivate_object(b[1])
            }
        }
        wave_minutes = minutes
        wave_seconds = seconds
        round_count = round_max
        state = (118 << 0)
        break
    case (116 << 0):
        if ((!instance_exists(obj_baddie)) && (!instance_exists(obj_arena_pizzaportal)))
        {
            wave++
            if (wave > maxwave)
            {
                image_index = 0
                sprite_index = spr_arenagate_open
                state = (8 << 0)
                instance_destroy(block_inst)
                with (obj_arenagate)
                {
                    image_index = 0
                    sprite_index = spr_arenagate_open
                    instance_destroy(block_inst)
                }
                cutscene_count = outro_max
                with (obj_player)
                {
                    with (obj_music)
                        arena = 0
                }
            }
            else
            {
                state = (115 << 0)
                round_count = round_max
            }
        }
        break
    case (8 << 0):
        if (floor(image_index) == (image_number - 1))
            state = (74 << 0)
        break
    case (74 << 0):
        instance_destroy()
        break
}

if (sprite_index == spr_arenagate_close && image_index > (image_number - 1))
    image_index = (image_number - 1)
if (sprite_index == spr_arenagate_open && image_index > (image_number - 1))
    sprite_index = spr_arenagate_opened
