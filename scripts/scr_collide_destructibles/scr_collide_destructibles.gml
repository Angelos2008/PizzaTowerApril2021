function scr_collide_destructibles() //scr_collide_destructibles
{
    for (var i = 0; i < 2; i++)
    {
        var _obj_player = asset_get_index(concat("obj_player", (i + 1)))
        with (_obj_player)
        {
            if ((state == (68 << 0) && sprite_index == spr_playerN_noisebombspinjump) || (state == (40 << 0) && pogochargeactive == 1))
            {
                with (instance_place((x + xscale), y, obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.5)
                    instance_destroy()
                }
                with (instance_place(((x + hsp) + xscale), y, obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.5)
                    instance_destroy()
                }
                with (instance_place(x, ((y + vsp) + 1), obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.5)
                    instance_destroy()
                }
                with (instance_place(x, ((y + vsp) - 1), obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.5)
                    instance_destroy()
                }
                with (instance_place(x, (y + 1), obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.5)
                    instance_destroy()
                }
                with (instance_place(x, (y - 1), obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.5)
                    instance_destroy()
                }
            }
            if (state == (5 << 0))
            {
                with (instance_place((x + xscale), y, obj_rollblock))
                    instance_destroy()
            }
            if (state == (94 << 0) && sprite_index == spr_player_fightball)
            {
                with (instance_place((x + xscale), y, obj_fightballblock))
                    instance_destroy()
            }
            if (state == (57 << 0) || state == (17 << 0) || state == (156 << 0) || state == (97 << 0) || state == (70 << 0) || state == (16 << 0) || sprite_index == spr_barrelroll || state == (78 << 0) || state == (80 << 0) || state == (30 << 0) || state == (94 << 0) || state == (33 << 0) || state == (47 << 0) || state == (27 << 0) || state == (5 << 0) || state == (15 << 0) || state == (125 << 0))
            {
                if place_meeting((x + hsp), y, obj_destructibles)
                {
                    if (character != "V")
                    {
                        with (instance_place((x + hsp), y, obj_destructibles))
                        {
                            GamepadSetVibration(0, 0.8, 0.5)
                            instance_destroy()
                        }
                        if (state == (80 << 0))
                            machpunchAnim = 1
                    }
                }
            }
            if (state == (83 << 0) && thrown == 1)
            {
                if place_meeting((x - hsp), y, obj_destructibles)
                {
                    with (instance_place((x - hsp), y, obj_destructibles))
                    {
                        GamepadSetVibration(0, 0.8, 0.5)
                        instance_destroy()
                    }
                }
            }
            if ((state == (33 << 0) || state == (53 << 0) || state == (15 << 0)) && vsp > 0)
            {
                if place_meeting(x, (y + 1), obj_destructibles)
                {
                    with (instance_place(x, (y + 1), obj_destructibles))
                    {
                        GamepadSetVibration(0, 0.8, 0.5)
                        instance_destroy()
                    }
                }
            }
            if place_meeting(x, (y + 1), obj_destructibleplatform)
            {
                with (instance_place(x, (y + 1), obj_destructibleplatform))
                {
                    falling = 1
                    if (falling == 1)
                        image_speed = 0.35
                }
            }
            if (vsp <= 0.5 && (state == (68 << 0) || state == (40 << 0) || state == (57 << 0) || state == (26 << 0) || state == (9 << 0) || state == (73 << 0) || state == (80 << 0) || state == (94 << 0) || (state == (57 << 0) && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))))
            {
                var vy = -1
                if (state == (57 << 0) && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))
                    vy = vsp
                if place_meeting(x, (y + vy), obj_destructibles)
                {
                    with (instance_place(x, (y + vy), obj_destructibles))
                    {
                        GamepadSetVibration(0, 0.6, 0.5)
                        instance_destroy()
                        with (other)
                        {
                            if (state != (73 << 0) && state != (57 << 0) && state != (26 << 0))
                                vsp = 0
                            if (state == (73 << 0))
                                vsp = -11
                        }
                    }
                }
            }
            if (vsp >= 0 && (state == (84 << 0) || state == (87 << 0)))
            {
                if place_meeting(x, ((y + vsp) + 2), obj_destructibles)
                {
                    with (instance_place(x, ((y + vsp) + 2), obj_destructibles))
                    {
                        with (_obj_player)
                        {
                            if place_meeting(x, ((y + vsp) + 2), obj_bigdestructibles)
                            {
                                var _inst = instance_place(x, ((y + vsp) + 2), obj_bigdestructibles)
                                if instance_exists(_inst)
                                {
                                    var j = 0
                                    var _max = 256
                                    while (!(place_meeting(x, (y + 1), obj_bigdestructibles)))
                                    {
                                        y += 1
                                        j++
                                        if (j >= _max)
                                            break
                                        else
                                            continue
                                    }
                                }
                                if (freefallsmash <= 10)
                                {
                                    if (shotgunAnim == 0)
                                        sprite_index = spr_bodyslamland
                                    else
                                        sprite_index = spr_shotgunjump2
                                    state = (87 << 0)
                                    image_index = 0
                                }
                            }
                        }
                        instance_destroy()
                    }
                }
            }
            if (state == (84 << 0) || state == (87 << 0))
            {
                if (place_meeting(x, (y + 1), obj_metalblock) && freefallsmash > 10)
                {
                    with (instance_place(x, (y + 1), obj_metalblock))
                        instance_destroy()
                }
            }
            if (state == (31 << 0) || state == (57 << 0))
            {
                with (obj_destructibles)
                {
                    if place_meeting((x - _obj_player.hsp), y, _obj_player)
                    {
                        with (_obj_player)
                        {
                            if place_meeting((x + hsp), y, obj_bigdestructibles)
                            {
                                sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
                                image_index = 0
                                state = (67 << 0)
                                movespeed = 3
                                vsp = -3
                                instance_destroy(other)
                            }
                            else if (other.object_index != obj_bigdestructibles)
                                instance_destroy(other)
                        }
                    }
                }
            }
        }
    }
}

