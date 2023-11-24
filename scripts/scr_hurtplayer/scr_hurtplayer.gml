function scr_hurtplayer(argument0) //scr_hurtplayer
{
    with (argument0)
    {
        if global.failcutscene
        {
        }
        else if (state == (94 << 0) || (state == (56 << 0) && sprite_index == spr_swingding))
        {
            if (state == (56 << 0))
            {
                var _gby = (object_index == obj_player1 ? 1 : 2)
                with (obj_baddie)
                {
                    if (state == (4 << 0) && grabbedby == _gby)
                        instance_destroy()
                }
            }
            state = (120 << 0)
            sprite_index = choose(spr_parry1, spr_parry2, spr_parry3)
            image_index = 0
            image_speed = 0.35
            taunttimer = 20
            movespeed = 8
            parry_inst = -4
            parry_count = parry_max
            with (instance_create(x, y, obj_parryeffect))
                image_xscale = other.xscale
            flash = 1
        }
        else if (state == (120 << 0))
        {
        }
        else if (state == (61 << 0) || state == (43 << 0))
        {
        }
        else if (state == (10 << 0))
        {
        }
        else if (state == (9 << 0))
        {
        }
        else if ((state == (33 << 0) || state == (34 << 0) || state == (27 << 0)) && cutscene == 0)
        {
        }
        else if (state == (13 << 0))
        {
        }
        else if (state == (70 << 0))
        {
        }
        else if (state == (30 << 0))
        {
        }
        else if (state == (36 << 0) && hurted == 0)
        {
        }
        else if (state == (23 << 0))
        {
        }
        else if (state == (89 << 0))
        {
        }
        else if (state == (24 << 0))
        {
            hsp = ((-xscale) * 4)
            vsp = -5
            state = (82 << 0)
            sprite_index = spr_bump
            alarm[5] = 2
            alarm[8] = 60
            alarm[7] = 120
            hurted = 1
        }
        else if (state == (5 << 0))
        {
        }
        else if (pizzashield == 1)
        {
            pizzashield = 0
            with (instance_create(x, y, obj_sausageman_dead))
                sprite_index = spr_pizzashield_collectible
            hsp = ((-xscale) * 4)
            vsp = -5
            state = (82 << 0)
            sprite_index = spr_bump
            invhurt_buffer = 120
            alarm[8] = 60
            alarm[7] = 120
            hurted = 1
            scr_soundeffect(sfx_pephurt)
        }
        else if (state != (83 << 0) && state != (4 << 0) && (hurted == 0 || state == (19 << 0) || state == (21 << 0) || state == (22 << 0)) && cutscene == 0)
        {
            if instance_exists(obj_hardmode)
                global.heatmeter_count = ((global.heatmeter_threshold - 1) * global.heatmeter_threshold_count)
            if instance_exists(obj_bosscontroller)
                obj_bosscontroller.player_hp -= 30
            global.combo = 0
            global.combotime = 0
            global.heattime = 0
            global.style -= 25
            if (character == "V")
                global.playerhealth -= 25
            if (state == (11 << 0))
            {
                with (instance_create(x, y, obj_sausageman_dead))
                    sprite_index = spr_mortdead
                repeat (6)
                {
                    with (instance_create(x, y, obj_debris))
                        sprite_index = spr_feather
                }
                grav = 0.5
            }
            if (global.pizzadelivery == 0)
            {
                with (instance_create(x, y, obj_smallnumber))
                {
                    negative = 1
                    number = "-50"
                }
            }
            if (global.pizzadelivery == 1)
            {
                if (global.hp > 1)
                {
                    global.hp -= 1
                    with (obj_camera)
                        healthshaketime = 60
                }
                else
                {
                    with (obj_music)
                        arena = 0
                    vsp = -20
                    global.hp = 0
                    global.pizzadelivery = 0
                    cutscene = 1
                    with (instance_create(x, y, obj_debris))
                        sprite_index = spr_healthpickupeaten
                    with (instance_create(0, 0, obj_cutscene_handler))
                    {
                        var player = other
                        scene_info = [[cutscene_taxi_start, player], [cutscene_waitfor_sprite, player], [cutscene_set_sprite, player, 803, 0.5, player.xscale], [cutscene_player_check_ground, player], [cutscene_set_sprite, player, 804, 0.5, player.xscale], [cutscene_waitfor_sprite, player], [cutscene_set_sprite, player, 805, 0.5, player.xscale], [cutscene_taxi_end, player, 401]]
                    }
                }
            }
            if (state == (4 << 0))
            {
                if (object_index == obj_player1)
                    y = obj_player2.y
                else
                    y = obj_player1.y
            }
            scr_soundeffect(sfx_pephurt)
            alarm[8] = 100
            alarm[7] = 50
            hurted = 1
            if (xscale == other.image_xscale)
                sprite_index = spr_hurtjump
            else
                sprite_index = spr_hurt
            movespeed = 12
            vsp = -5
            timeuntilhpback = 300
            instance_create(x, y, obj_spikehurteffect)
            state = (83 << 0)
            image_index = 0
            flash = 1
            global.hurtcounter += 1
            var loseamount = (50 * (global.stylethreshold + 1))
            if (global.pizzadelivery == 0)
            {
                if (global.collect > loseamount)
                    global.collect -= loseamount
                else
                    global.collect = 0
            }
            if (global.pizzadelivery == 0)
            {
                if (global.collect != 0)
                {
                    if (character == "P" || character == "V")
                    {
                        repeat (10)
                        {
                            with (instance_create(x, y, obj_pizzaloss))
                                sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect)
                        }
                    }
                    else
                    {
                        repeat (10)
                            instance_create(x, y, obj_pizzaloss)
                    }
                }
            }
        }
    }
}

