function scr_player_backbreaker() //scr_player_backbreaker
{
    mach2 = 0
    if (sprite_index != spr_player_machfreefall)
    {
        hsp = 0
        movespeed = 0
    }
    else
        hsp = (xscale * movespeed)
    move = (key_right2 + key_left2)
    landAnim = 0
    if (sprite_index == spr_player_machfreefall && place_meeting(x, (y + 1), obj_solid))
    {
        state = (81 << 0)
        sprite_index = spr_player_crouchslide
    }
    if (sprite_index == spr_taunt || sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3 || sprite_index == spr_supertaunt4)
    {
        if key_up2
        {
            if (character == "P" && ispeppino)
            {
                character = "P"
                ispeppino = 0
                paletteselect = 0
            }
            else if (character == "P" && (!ispeppino))
            {
                character = "V"
                ispeppino = 1
                paletteselect = 0
            }
            else if (character == "V")
            {
                character = "P"
                ispeppino = 1
                paletteselect = 1
            }
            scr_characterspr()
            scr_soundeffect(sfx_taunt)
            taunttimer = 20
            state = (61 << 0)
            if (supercharged == 1)
            {
                image_index = 0
                sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4)
                tauntstoredstate = (0 << 0)
            }
            else
            {
                taunttimer = 20
                image_index = random_range(0, 11)
                sprite_index = spr_taunt
                tauntstoredstate = (0 << 0)
            }
            instance_create(x, y, obj_taunteffect)
        }
        if ((!instance_exists(parry_inst)) && taunttimer > parry_max)
        {
            parry_inst = instance_create(x, y, obj_parryhitbox)
            var _playerid = 1
            if (object_index == obj_player2)
                _playerid = 2
            with (parry_inst)
            {
                player_id = _playerid
                image_xscale = other.xscale
            }
        }
        if (taunttimer < taunt_to_parry_max)
        {
            if instance_exists(parry_inst)
            {
                instance_destroy(parry_inst)
                parry_inst = noone
            }
        }
        if (character == "P" && ispeppino)
        {
            if key_down2
            {
                if (paletteselect < 9)
                    paletteselect += 1
                else
                    paletteselect = 1
                taunttimer = 20
            }
        }
        if (character == "N" || (!ispeppino))
        {
            if key_down2
            {
                if (paletteselect < 6)
                    paletteselect += 1
                else
                    paletteselect = 0
                taunttimer = 20
            }
        }
        if (supercharged == 1 && (!instance_exists(obj_tauntaftereffectspawner)))
        {
            instance_create(x, y, obj_tauntaftereffectspawner)
            with (obj_baddie)
            {
                if point_in_camera(x, y, view_camera[0])
                {
                    global.combo += 1
                    hp = 0
                    state = (110 << 0)
                    hitLag = 20
                    hitX = x
                    hitY = y
                    instance_create(x, y, obj_parryeffect)
                    alarm[3] = 3
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
                }
            }
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            supercharge = 0
            supercharged = 0
        }
        taunttimer--
        vsp = 0
    }
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3 || sprite_index == spr_supertaunt4))
    {
        movespeed = tauntstoredmovespeed
        vsp = tauntstoredvsp
        sprite_index = tauntstoredsprite
        state = tauntstoredstate
        if instance_exists(parry_inst)
        {
            instance_destroy(parry_inst)
            parry_inst = noone
        }
    }
    if (sprite_index == spr_taunt && taunttimer == 0)
    {
        movespeed = tauntstoredmovespeed
        vsp = tauntstoredvsp
        sprite_index = tauntstoredsprite
        state = tauntstoredstate
        trace(state)
        if instance_exists(parry_inst)
        {
            instance_destroy(parry_inst)
            parry_inst = -4
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_eatspaghetti)
        state = (0 << 0)
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_throw)
        state = (0 << 0)
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_Timesup && place_meeting(x, y, obj_exitgate))
        state = (0 << 0)
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_player_levelcomplete || sprite_index == spr_playerN_victory))
        state = (0 << 0)
    if (key_jump && sprite_index == spr_player_phoneidle)
    {
        global.panic = 1
        sprite_index = spr_bossintro
        image_index = 0
        with (instance_create(x, y, obj_debris))
        {
            image_index = 0
            sprite_index = spr_phonedebris
        }
    }
    if (global.miniboss == 1 && sprite_index == spr_bossintro && floor(image_index) == (image_number - 1))
        state = (0 << 0)
    image_speed = 0.4
}

