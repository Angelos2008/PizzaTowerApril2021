var _player1 = (obj_player1.spotlight ? obj_player1 : obj_player2)
var _player2 = (obj_player1.spotlight ? 101 : 102)
var _p1state = _player1.state
if (_p1state == (61 << 0) || _p1state == (43 << 0))
    _p1state = _player1.tauntstoredstate
var _p1spr = _player1.sprite_index
var _p1movespeed = _player1.movespeed
switch _player1.character
{
    case "P":
        var _validstate = (_p1state == (79 << 0) || _p1state == (80 << 0) || _p1state == (94 << 0) || _p1state == (26 << 0) || _p1state == (81 << 0) || _p1state == (47 << 0) || _p1state == (31 << 0))
        spr_speedbarHUD = spr_speedbar
        spr_speedbar_index = spr_plug
        if _validstate
        {
            if (_p1movespeed < 2.4)
                spr_speedbar_index = spr_plug
            else if (_p1movespeed >= 2.4 && _p1movespeed < 4.8)
                spr_speedbar_index = spr_cheeseblob
            else if (_p1movespeed >= 4.8 && _p1movespeed < 7.2)
                spr_speedbar_index = spr_cheesemaker
            else if (_p1movespeed >= 7.2 && _p1movespeed < 9.6)
                spr_speedbar_index = spr_railh2right
            else if (_p1movespeed >= 9.6 && _p1movespeed < 12)
                spr_speedbar_index = spr_railh2left
            else if (_p1movespeed >= 12)
            {
                spr_speedbarHUD = spr_speedbarmax
                spr_speedbar_index = -1
            }
        }
        break
    case "N":
        var _p1pogospeed = _player1.pogospeed
        spr_speedbarHUD = spr_speedbar
        if (_p1pogospeed < 10)
            spr_speedbar_index = spr_plug
        else if (_p1pogospeed >= 10 && _p1pogospeed < 14)
            spr_speedbar_index = spr_railh2right
        else if (_p1pogospeed >= 14)
        {
            spr_speedbar_index = -1
            spr_speedbarHUD = spr_speedbar
        }
        break
    case "V":
        spr_speedbarHUD = -4
        break
}

var _char = _player1.character
ispeppino = _player1.ispeppino
if (_char == "P" && ispeppino)
{
    spr_player = spr_pepinoHUD
    switch _p1spr
    {
        case 480:
            spr_player = spr_pepinoHUDthunder
            break
        case 481:
            spr_player = spr_pepinoHUD
            break
        case 465:
            spr_player = spr_pepinoHUDknight
            break
        case 464:
            spr_player = spr_pepinoHUDknight
            break
        case 457:
            spr_player = spr_pepinoHUDbombend
            break
        case 460:
        case 458:
        case 459:
        case 737:
            spr_player = spr_pepinoHUDscream
            break
        case 685:
            spr_player = spr_pepinoHUDhappy
            break
        case 632:
        case 765:
            spr_player = spr_pepinoHUDrolling
            break
        case 768:
        case 592:
            spr_player = spr_pepinoHUDmach2
            break
        case 591:
            spr_player = spr_pepinoHUDmach3
            break
        case 739:
            spr_player = spr_pepinoHUDhurt
            break
    }

    if (spr_player == spr_pepinoHUD && instance_exists(obj_itspizzatime))
        spr_player = spr_pepinoHUDscream
    if (spr_player == spr_pepinoHUD && global.combo >= 20)
        spr_player = spr_pepinoHUDmenacing
    if (spr_player == spr_pepinoHUD)
    {
        switch _p1state
        {
            case (33 << 0):
                if (sprite_index != _player1.spr_knightpepstart)
                    spr_player = spr_pepinoHUDknight
                break
            case (27 << 0):
                spr_player = spr_pepinoHUDknight
                break
            case (96 << 0):
                spr_player = spr_pepinoHUDstun
                break
            case (87 << 0):
                if (shake_mag > 0)
                    spr_player = spr_pepinoHUDstun
                break
            case (66 << 0):
            case (72 << 0):
            case (32 << 0):
                spr_player = spr_pepinoHUDhappy
                break
            case (79 << 0):
            case (43 << 0):
            case (95 << 0):
            case (84 << 0):
            case (67 << 0):
            case (73 << 0):
            case (52 << 0):
            case (75 << 0):
            case (56 << 0):
            case (57 << 0):
            case (61 << 0):
            case (58 << 0):
            case (59 << 0):
            case (60 << 0):
                spr_player = spr_pepinoHUDmach1
                break
            case (80 << 0):
            case (26 << 0):
            case (31 << 0):
            case (53 << 0):
                spr_player = spr_pepinoHUDmach2
                break
            case (94 << 0):
                spr_player = spr_pepinoHUDmach3
                if (_p1spr == spr_player_crazyrun)
                    spr_player = spr_pepinoHUDmach4
                break
            case (83 << 0):
            case (46 << 0):
            case (36 << 0):
                spr_player = spr_pepinoHUDhurt
                break
            case (64 << 0):
                if (_p1spr == spr_player_bossintro || _p1spr == spr_player_idle)
                    spr_player = spr_pepinoHUDhurt
                else if (_p1spr == spr_player_levelcomplete)
                    spr_player = spr_pepinoHUDhappy
                break
        }

        if (spr_player == spr_pepinoHUD)
        {
            if (global.stylethreshold == 2)
                spr_player = spr_pepinoHUD3hp
            else if (_p1spr == spr_player_hurtidle || _p1spr == spr_player_hurtwalk)
                spr_player = spr_pepinoHUD1hp
            else if (global.stylethreshold >= 3)
                spr_player = spr_pepinoHUDpanic
            else if (_p1spr == spr_shotgun_pullout)
                spr_player = spr_pepinoHUDmenacing
        }
    }
}
else if (_char == "N" || (_char == "P" && (!ispeppino)))
{
    spr_player = spr_noiseHUD_idle
    switch _p1spr
    {
        case _player1.spr_knightpepthunder:
            spr_player = spr_noiseHUD_thunder
            break
        case _player1.spr_knightpepstart:
            spr_player = spr_noiseHUD_knight
            break
        case _player1.spr_bombpepend:
            spr_player = spr_noiseHUD_bomb
            break
        case _player1.spr_bombpepintro:
        case _player1.spr_bombpeprunabouttoexplode:
        case _player1.spr_bombpeprun:
        case _player1.spr_fireass:
            spr_player = spr_noiseHUD_panic
            break
        case 685:
            spr_player = spr_noiseHUD_happy
            break
        case 632:
        case 765:
            spr_player = spr_pepinoHUDrolling
            break
        case _player1.spr_dive:
        case _player1.spr_machslideboost:
            spr_player = spr_noiseHUD_mach2
            break
        case _player1.spr_mach3boost:
            spr_player = spr_noiseHUD_mach3
            break
        case _player1.spr_fireassend:
            spr_player = spr_noiseHUD_hurt
            break
    }

    if (spr_player == spr_noiseHUD_idle && instance_exists(obj_itspizzatime))
        spr_player = spr_noiseHUD_panic
    if (spr_player == spr_noiseHUD_idle && global.combo >= 20)
        spr_player = spr_noiseHUD_menacing
    if (spr_player == spr_noiseHUD_idle)
    {
        switch _p1state
        {
            case (33 << 0):
                if (sprite_index != _player1.spr_knightpepstart)
                    spr_player = spr_noiseHUD_knight
                break
            case (27 << 0):
                spr_player = spr_noiseHUD_knight
                break
            case (96 << 0):
                spr_player = spr_noiseHUD_groundpound
                break
            case (87 << 0):
                if (shake_mag > 0)
                    spr_player = spr_noiseHUD_groundpound
                break
            case (66 << 0):
            case (72 << 0):
            case (32 << 0):
                spr_player = spr_noiseHUD_happy
                break
            case (79 << 0):
            case (43 << 0):
            case (95 << 0):
            case (84 << 0):
            case (67 << 0):
            case (73 << 0):
            case (52 << 0):
            case (75 << 0):
            case (56 << 0):
            case (57 << 0):
            case (61 << 0):
            case (58 << 0):
            case (59 << 0):
            case (60 << 0):
                spr_player = spr_noiseHUD_mach1
                break
            case (40 << 0):
            case (80 << 0):
            case (26 << 0):
            case (31 << 0):
            case (53 << 0):
                spr_player = spr_noiseHUD_mach2
                break
            case (94 << 0):
                spr_player = spr_noiseHUD_mach3
                if (_p1spr == _player1.spr_crazyrun)
                    spr_player = spr_noiseHUD_crazyrun
                break
            case (83 << 0):
            case (46 << 0):
            case (36 << 0):
                spr_player = spr_noiseHUD_hurt
                break
            case (64 << 0):
                if (_p1spr == spr_player_bossintro || _p1spr == spr_player_idle)
                    spr_player = spr_noiseHUD_hurt
                else if (_p1spr == spr_player_levelcomplete)
                    spr_player = spr_noiseHUD_happy
                break
        }

        if (spr_player == spr_noiseHUD_idle)
        {
            if _player1.angry
                spr_player = spr_noiseHUD_angry
            else if (_p1spr == _player1.spr_hurtidle || _p1spr == _player1.spr_hurtwalk)
                spr_player = spr_noiseHUD_lowhealth
            else if (global.panic || global.miniboss)
                spr_player = spr_noiseHUD_panic
            else if (_p1spr == spr_shotgun_pullout)
                spr_player = spr_noiseHUD_menacing
        }
    }
}
else if (_char == "V")
{
    spr_speedbarHUD = -4
    spr_player = spr_playerV_normalHUD
    if ((healthshaketime > 0 && playerhealthup) || _p1spr == spr_playerV_keydoor || _p1state == (66 << 0) || _p1state == (32 << 0))
        spr_player = spr_playerV_happyHUD
    else if (_p1state == (3 << 0))
        spr_player = spr_playerV_machHUD
    else if (healthshaketime > 0 && playerhealthup && _p1state == (83 << 0))
        spr_player = spr_playerV_hurtHUD
    else if global.panic
        spr_player = spr_playerV_panicHUD
    else if _player1.angry
        spr_player = spr_playerV_angryHUD
}
