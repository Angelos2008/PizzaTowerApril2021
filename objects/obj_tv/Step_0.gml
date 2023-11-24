if (room == Realtitlescreen || room == rank_room || room == rm_levelselect || room == timesuproom || room == boss_room1 || room == characterselect)
{
    visible = false
    sprite_index = spr_tv_off
}
else
    visible = true
if (instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud))
    visible = false
image_speed = 0.35
if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
{
    if (prompt != -4)
        prompt_buffer = 2
    bubbleindex += image_speed
    if (floor(bubbleindex) == sprite_get_number(bubblespr))
    {
        bubbleindex = 0
        switch bubblespr
        {
            case spr_tv_bubbleopen:
                bubblespr = spr_tv_bubble
                break
            case spr_tv_bubbleclose:
                bubblespr = spr_tv_bubbleclosed
                if (prompt == -4 || prompt == "")
                    bubblespr = -4
                break
        }

    }
}
switch state
{
    case (0 << 0):
        idlespr = spr_tv_idle
        if (!obj_player.ispeppino)
            idlespr = spr_tv_idleN
        var _state = obj_player1.state
        if (_state == (61 << 0) || _state == (43 << 0))
            _state = obj_player1.tauntstoredstate
        switch _state
        {
            case (33 << 0):
            case (34 << 0):
            case (27 << 0):
                idlespr = spr_tv_knight
                break
            case (36 << 0):
                idlespr = spr_tv_bombpep
                break
            case (9 << 0):
                idlespr = spr_tv_fireass
                if (obj_player1.sprite_index == obj_player1.spr_scaredjump1 || obj_player1.sprite_index == obj_player1.spr_scaredjump2)
                    idlespr = spr_tv_scaredjump
                break
            case (5 << 0):
                idlespr = spr_tv_tumble
                break
            case (10 << 0):
                idlespr = spr_tv_firemouth
                break
            case (13 << 0):
                idlespr = spr_tv_ghost
                break
            case (41 << 0):
                if (obj_player1.sprite_index == obj_player1.spr_squished)
                    idlespr = spr_tv_squished
                break
            case (0 << 0):
            case (68 << 0):
            case (31 << 0):
            case (76 << 0):
            case (69 << 0):
                with (obj_player1)
                {
                    if shotgunAnim
                        other.idlespr = spr_tv_shotgun
                    else if global.mort
                        other.idlespr = spr_tv_mort
                }
                break
            case (95 << 0):
            case (84 << 0):
            case (87 << 0):
                if obj_player1.shotgunAnim
                    idlespr = spr_tv_shotgun
                break
            case (49 << 0):
                if global.mort
                    idlespr = spr_tv_mort
                break
            case (48 << 0):
                idlespr = spr_tv_shotgun
                break
            case (89 << 0):
                idlespr = spr_tv_barrel
                break
            case (121 << 0):
                idlespr = spr_tv_golf
                break
            case (156 << 0):
                idlespr = spr_tv_rocket
                break
            case (17 << 0):
                idlespr = spr_tv_cheeseball
                break
            case (19 << 0):
            case (20 << 0):
            case (21 << 0):
            case (22 << 0):
                idlespr = spr_tv_cheesepep
                break
            case (24 << 0):
                idlespr = spr_tv_boxxedpep
                break
            case (80 << 0):
            case (26 << 0):
            case (47 << 0):
            case (55 << 0):
                if obj_player1.skateboarding
                    idlespr = spr_tv_clown
                break
        }

        if (!obj_player1.ispeppino)
        {
            var spr = sprite_get_name(idlespr)
            spr = asset_get_index(concat(spr, "N"))
            if (spr > -1)
                idlespr = spr
        }
        switch sprite_index
        {
            case spr_tv_off:
                if visible
                {
                    sprite_index = spr_tv_open
                    image_index = 0
                }
                break
            case 2215:
                if (floor(image_index) == (image_number - 1))
                    sprite_index = idlespr
                break
            case 2271:
            case 783:
                if (idleanim > 0)
                    idleanim--
                if (sprite_index != idlespr)
                    sprite_index = idlespr
                if (idleanim <= 0 && floor(image_index) == (image_number - 1))
                {
                    sprite_index = choose(spr_tv_idleanim1, spr_tv_idleanim2)
                    if (!obj_player1.ispeppino)
                    {
                        if (sprite_index == spr_tv_idleanim1)
                            sprite_index = spr_tv_idleanim1N
                        if (sprite_index == spr_tv_idleanim2)
                            sprite_index = spr_tv_idleanim2N
                    }
                    image_index = 0
                }
                break
            case 1052:
            case 487:
            case 2220:
            case 2293:
                if (floor(image_index) == (image_number - 1))
                {
                    sprite_index = idlespr
                    idleanim = (240 + (60 * irandom_range(-1, 2)))
                }
                if (idlespr != spr_tv_idle && idlespr != spr_tv_idleN)
                    sprite_index = idlespr
                break
            default:
                sprite_index = idlespr
        }

        if (sprite_index != spr_tv_open)
        {
            if (!ds_list_empty(tvprompts_list))
            {
                var b = ds_list_find_value(tvprompts_list, 0)
                prompt_buffer = prompt_max
                if (b[0] != "" && b[0] != -4)
                {
                    bubblespr = spr_tv_bubbleopen
                    bubbleindex = 0
                    prompt = b[0]
                    promptspd = b[3]
                    promptx = promptxstart
                }
                else
                {
                    if (bubblespr != -4 && bubblespr != 1258)
                        bubblespr = spr_tv_bubbleclose
                    if (bubblespr == spr_tv_bubbleclosed)
                        bubblespr = -4
                    bubbleindex = 0
                    promptx = promptxstart
                    prompt = -4
                }
                if (b[1] == (0 << 0))
                {
                    sprite_index = spr_tv_open
                    image_index = 0
                    tvsprite = b[2]
                    if (!obj_player1.ispeppino)
                    {
                        spr = sprite_get_name(tvsprite)
                        spr = asset_get_index(concat(spr, "N"))
                        if (spr > -1)
                            tvsprite = spr
                    }
                }
                else
                {
                    tvsprite = b[2]
                    if (!obj_player1.ispeppino)
                    {
                        spr = sprite_get_name(tvsprite)
                        spr = asset_get_index(concat(spr, "N"))
                        if (spr > -1)
                            tvsprite = spr
                    }
                    sprite_index = tvsprite
                    image_index = 0
                }
                state = (8 << 0)
            }
            else
                bubblespr = -4
        }
        break
    case (8 << 0):
        if (sprite_index == spr_tv_open && floor(image_index) == (image_number - 1))
            sprite_index = tvsprite
        if (sprite_index == tvsprite)
        {
            if (prompt_buffer > 0)
                prompt_buffer--
            else
            {
                promptx = promptxstart
                ds_list_delete(tvprompts_list, 0)
                state = (0 << 0)
            }
        }
        break
}

var change_pos = 0
if (obj_player.x > (room_width - 224) && obj_player.y < 187)
    change_pos = 1
if (bubblespr != -4 && obj_player.x > 316 && obj_player.y < 101)
    change_pos = 1
var spd = 15
if change_pos
    hud_posY = Approach(hud_posY, -300, spd)
else
    hud_posY = Approach(hud_posY, 0, spd)
