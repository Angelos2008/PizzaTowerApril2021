if ((!instance_exists(baddieID)) && room != custom_lvl_room)
    instance_destroy()
if instance_exists(baddieID)
{
    x = baddieID.x
    y = baddieID.y
    image_xscale = baddieID.image_xscale
}
for (var i = 0; i < 2; i++)
{
    var _obj_player = asset_get_index(concat("obj_player", (i + 1)))
    var _playerindex = (i + 1)
    if (instance_exists(baddieID) && place_meeting(x, y, _obj_player) && _obj_player.cutscene == 0)
    {
        if (baddieID.state != (4 << 0) && (!baddieID.invincible))
        {
            with (_obj_player)
            {
                if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == 0 && sprite_index != spr_player_mach2jump && ((state == (3 << 0) && vsp > 0) || state == (68 << 0) || state == (79 << 0) || (state == (56 << 0) && sprite_index != spr_swingding)) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && (!other.baddieID.invincible))
                {
                    scr_soundeffect(sfx_stompenemy)
                    image_index = 0
                    if (other.baddieID.object_index != obj_tank && other.baddieID.object_index != obj_bigcheese)
                    {
                        if (x != other.baddieID.x)
                            other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
                        other.baddieID.hsp = (xscale * 5)
                        other.baddieID.vsp = -5
                        other.baddieID.state = (111 << 0)
                        if (other.baddieID.stunned < 100)
                            other.baddieID.stunned = 100
                    }
                    if key_jump2
                    {
                        instance_create(x, (y + 50), obj_stompeffect)
                        stompAnim = 1
                        vsp = -14
                        if (state == (68 << 0))
                            sprite_index = spr_stompprep
                    }
                    else
                    {
                        instance_create(x, (y + 50), obj_stompeffect)
                        stompAnim = 1
                        vsp = -9
                        if (state == (68 << 0))
                            sprite_index = spr_stompprep
                    }
                }
                if (instance_exists(other.baddieID) && other.baddieID.invtime == 0 && ((state == (31 << 0) && global.attackstyle == 1) || instakillmove == 1) && other.baddieID.state != (4 << 0) && (!other.baddieID.invincible) && other.baddieID.instantkillable)
                {
                    if (state == (94 << 0) && sprite_index != spr_mach3hit && (character == "P" || character == "V"))
                    {
                        if (fightball == 0)
                            sprite_index = spr_mach3hit
                        image_index = 0
                    }
                    if (state == (80 << 0) && grounded)
                    {
                        machpunchAnim = 1
                        image_index = 0
                    }
                    if (state == (30 << 0) && sprite_index != spr_player_chainsawhit)
                    {
                        image_index = 0
                        sprite_index = spr_player_chainsawhit
                    }
                    other.baddieID.invtime = 25
                    if (object_index == obj_player1)
                        other.baddieID.grabbedby = 1
                    else
                        other.baddieID.grabbedby = 2
                    scr_soundeffect(sfx_punch)
                    if (!other.baddieID.important)
                    {
                        if (state == (94 << 0))
                            global.style += (10 + global.combo)
                        else
                            global.style += (5 + global.combo)
                    }
                    if (state == (94 << 0) || state == (156 << 0) || state == (5 << 0) || (state == (84 << 0) && freefallsmash > 10) || state == (53 << 0) || state == (30 << 0) || state == (57 << 0) || state == (10 << 0) || state == (33 << 0) || state == (27 << 0) || state == (56 << 0))
                    {
                        if (!other.baddieID.killprotection)
                        {
                            other.baddieID.hp -= 99
                            other.baddieID.instakilled = 1
                        }
                    }
                    if (!other.baddieID.important)
                    {
                        global.combotime = 60
                        global.heattime = 60
                        global.combo += 1
                    }
                    global.hit += 1
                    if (supercharge < 10)
                        supercharge += 1
                    if ((!grounded) && state != (84 << 0) && (key_jump2 || input_buffer_jump == 0))
                    {
                        if (state == (80 << 0) || (state == (94 << 0) && fightball == 0))
                            sprite_index = spr_mach2jump
                        suplexmove = 0
                        vsp = -11
                    }
                    if (character == "M" && state == (84 << 0))
                    {
                        vsp = -11
                        state = (68 << 0)
                        sprite_index = spr_jump
                    }
                    if (state != (43 << 0))
                    {
                        tauntstoredmovespeed = movespeed
                        tauntstoredsprite = sprite_index
                        tauntstoredstate = state
                        tauntstoredvsp = vsp
                    }
                    if (state == (31 << 0) && (!key_slap))
                    {
                        image_index = random_range(0, (image_number - 1))
                        if grounded
                            sprite_index = spr_player_groundedattack
                        else
                            sprite_index = spr_player_ungroundedattack
                    }
                    if (state == (30 << 0))
                    {
                        other.baddieID.hp -= 99
                        sprite_index = spr_player_chainsawhit
                        image_index = 0
                    }
                    var lag = 5
                    other.baddieID.hitLag = lag
                    other.baddieID.hitX = other.baddieID.x
                    other.baddieID.hitY = other.baddieID.y
                    other.baddieID.hp -= 1
                    hitLag = lag
                    hitX = x
                    hitY = y
                    instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect)
                    other.baddieID.alarm[3] = 3
                    other.baddieID.state = (110 << 0)
                    other.baddieID.image_xscale = (-xscale)
                    instance_create(x, y, obj_slapstar)
                    instance_create(x, y, obj_slapstar)
                    instance_create(x, y, obj_slapstar)
                    instance_create(x, y, obj_baddiegibs)
                    instance_create(x, y, obj_baddiegibs)
                    instance_create(x, y, obj_baddiegibs)
                    with (obj_camera)
                    {
                        shake_mag = 3
                        shake_mag_acc = (3 / room_speed)
                    }
                    if key_up
                    {
                        other.baddieID.hitvsp = -11
                        other.baddieID.hithsp = 0
                    }
                    else if key_down
                    {
                        other.baddieID.hitvsp = 11
                        other.baddieID.hithsp = 0
                    }
                    else
                    {
                        other.baddieID.hitvsp = -8
                        other.baddieID.hithsp = ((-other.baddieID.image_xscale) * 8)
                    }
                    state = (43 << 0)
                }
                else if (state == (31 << 0) && global.attackstyle == 0)
                {
                    movespeed = 0
                    image_index = 0
                    sprite_index = spr_haulingstart
                    state = (56 << 0)
                    baddiegrabbedID = other.baddieID
                    grabbingenemy = 1
                    other.baddieID.state = (4 << 0)
                    other.baddieID.grabbedby = _playerindex
                }
                if (place_meeting(x, (y + 1), other) && state == (40 << 0) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_playerN_pogobounce && (!other.baddieID.invincible))
                {
                    switch pogochargeactive
                    {
                        case 0:
                            pogospeedprev = 0
                            other.baddieID.vsp = -3
                            scr_soundeffect(sfx_stompenemy)
                            other.baddieID.state = (111 << 0)
                            if (other.baddieID.stunned < 100)
                                other.baddieID.stunned = 100
                            sprite_index = spr_playerN_pogobounce
                            break
                        case 1:
                            pogospeedprev = 0
                            scr_throwenemy()
                            sprite_index = spr_playerN_pogobouncemach
                            break
                    }

                    instance_create(x, (y + 50), obj_stompeffect)
                    image_index = 0
                    movespeed = 0
                    vsp = 0
                }
                var pepp_grab = 0
                if (character == "M" && instance_exists(other.baddieID) && (state == (0 << 0) || state == (68 << 0)) && pepperman_grabID == -4 && sprite_index != spr_pepperman_throw && other.baddieID.state == (111 << 0) && other.baddieID.stuntouchbuffer == 0 && (!other.baddieID.thrown) && (!other.baddieID.invincible))
                {
                    other.baddieID.pepperman_grab = 1
                    pepperman_grabID = other.baddieID.id
                    other.baddieID.state = (4 << 0)
                    other.baddieID.grabbedby = _playerindex
                    pepp_grab = 1
                }
                if (instance_exists(other.baddieID) && (!(y < other.baddieID.y)) && other.baddieID.state != (57 << 0) && other.baddieID.state != (110 << 0) && (!pepp_grab) && other.baddieID.thrown == 0 && other.baddieID.stuntouchbuffer == 0 && other.baddieID.vsp > 0 && state != (57 << 0) && state != (61 << 0) && state != (67 << 0) && state != (53 << 0) && other.baddieID.state != (4 << 0) && state != (40 << 0) && state != (81 << 0) && state != (84 << 0) && state != (80 << 0) && state != (6 << 0) && state != (31 << 0) && state != (83 << 0) && other.baddieID.state != (30 << 0) && other.baddieID.state != (43 << 0) && other.baddieID.state != (114 << 0) && state != (94 << 0) && state != (47 << 0) && state != (26 << 0) && (!other.baddieID.invincible))
                {
                    if (state != (36 << 0) && state != (79 << 0) && state != (78 << 0) && character != "M" && other.baddieID.object_index != obj_tank)
                        movespeed = 0
                    if (other.baddieID.object_index == obj_tank)
                        other.baddieID.stuntouchbuffer = 10
                    if (other.baddieID.object_index != obj_tank)
                    {
                        scr_soundeffect(sfx_bumpwall)
                        other.baddieID.stuntouchbuffer = 50
                        if (other.baddieID.object_index == obj_pizzaball)
                            global.golfhit += 1
                        if (other.baddieID.stunned < 100)
                            other.baddieID.stunned = 100
                        if (x != other.baddieID.x)
                            other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
                        other.baddieID.vsp = -5
                        other.baddieID.hsp = ((-other.baddieID.image_xscale) * 2)
                        other.baddieID.state = (111 << 0)
                        other.baddieID.image_index = 0
                    }
                    else if (y == other.baddieID.y && state != (41 << 0) && grounded && hurted == 0 && (other.baddieID.state == (107 << 0) || other.baddieID.state == (102 << 0)) && other.baddieID.image_xscale == (-(sign((other.baddieID.x - x)))))
                    {
                        state = (41 << 0)
                        sprite_index = spr_squished
                        image_index = 0
                    }
                }
                if (character != "M" && instance_exists(other.baddieID) && state == (37 << 0) && (!other.baddieID.invincible))
                {
                    if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == 0 && state != (31 << 0) && other.baddieID.state != (4 << 0) && sprite_index != spr_player_mach2jump && (state == (68 << 0) || state == (79 << 0) || (state == (56 << 0) && sprite_index != spr_swingding)) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && (!other.baddieID.invincible))
                    {
                        scr_soundeffect(sfx_stompenemy)
                        if (x != other.baddieID.x)
                            other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
                        image_index = 0
                        other.baddieID.state = (111 << 0)
                        if (other.baddieID.stunned < 100)
                            other.baddieID.stunned = 100
                        if key_jump2
                        {
                            instance_create(x, (y + 50), obj_stompeffect)
                            stompAnim = 1
                            other.baddieID.image_index = 0
                            vsp = -14
                            if (state != (56 << 0))
                                sprite_index = spr_stompprep
                        }
                        else
                        {
                            instance_create(x, (y + 50), obj_stompeffect)
                            stompAnim = 1
                            other.baddieID.image_index = 0
                            vsp = -9
                            if (state != (56 << 0))
                                sprite_index = spr_stompprep
                        }
                    }
                    if (other.baddieID.thrown == 0 && (character == "P" || character == "N"))
                    {
                        movespeed = 0
                        image_index = 0
                        sprite_index = spr_haulingstart
                        state = (56 << 0)
                        other.baddieID.state = (4 << 0)
                        other.baddieID.grabbedby = _playerindex
                    }
                }
            }
        }
    }
}
