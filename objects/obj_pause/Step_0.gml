if ((!pause) && (!instance_exists(obj_fadeout)))
{
    if (obj_player1.key_start && room != rank_room && room != Realtitlescreen && room != timesuproom)
    {
        selected = 0
        if (!instance_exists(obj_pausefadeout))
            instance_create(x, y, obj_pausefadeout)
    }
}
if (instance_exists(obj_pausefadeout) && instance_exists(obj_fadeout))
    instance_destroy(obj_pausefadeout)
if pause
{
    scr_getinput()
    application_surface_draw_enable(true)
    moveselect = ((-key_up2) + key_down2)
    selected += moveselect
    if (moveselect != 0 && selected >= 0 && selected <= 2)
        scr_soundeffect(sfx_step)
    selected = clamp(selected, 0, 2)
    if (key_jump && selected == 0)
    {
        if (!instance_exists(obj_pausefadeout))
            instance_create(x, y, obj_pausefadeout)
    }
    if (key_jump && selected == 1)
    {
        var roomname = room_get_name(room)
        if (!global.snickchallenge)
        {
            var rm = -4
            var str_rm = string_letters(roomname)
            switch string_letters(roomname)
            {
                case "entrance":
                case "entrancesecret":
                    rm = entrance_1
                    break
                case "medieval":
                case "medievalsecret":
                    rm = medieval_1
                    break
                case "chateau":
                case "chateausecret":
                    rm = chateau_1
                    break
                case "ruin":
                case "ruinsecret":
                    rm = ruin_1
                    break
                case "dungeon":
                case "dungeonsecret":
                    rm = dungeon_1
                    break
                case "floorroom":
                case "floorsecret":
                    rm = floor1_room0
                    break
                case "graveyard":
                case "graveyardsecret":
                    rm = graveyard_1
                    break
                case "farm":
                case "farmsecret":
                    rm = farm_1
                    break
                case "ufo":
                case "ufosecret":
                    rm = ufo_1
                    break
                case "beach":
                case "beachsecret":
                    rm = beach_1
                    break
                case "forest":
                case "forestsecret":
                    rm = forest_1
                    break
                case "dragonlair":
                case "dragonlairsecret":
                    rm = dragonlair_1
                    break
                case "strongcold":
                case "strongcoldsecret":
                    rm = strongcold_10
                    break
                case "kidspartyentrance":
                case "kidsparty":
                case "kidspartysecret":
                    rm = kidsparty_entrance1
                    break
            }

            if (rm == -4)
                rm = asset_get_index((str_rm + "_1"))
            if (rm == -1)
                rm = asset_get_index((string_copy(str_rm, 1, (string_length(str_rm) - string_length("secret"))) + "_1"))
            if (rm != -4 && rm != -1)
            {
                instance_activate_all()
                global.levelreset = 1
                room_goto(rm)
                scr_playerreset()
                pause = 0
                obj_player1.targetDoor = "A"
                if instance_exists(obj_player2)
                    obj_player2.targetDoor = "A"
            }
            else
                scr_soundeffect(sfx_enemyprojectile)
        }
    }
    else if (key_jump2 && selected == 2)
    {
        if (room == hub_room1 || room == characterselect || room == cowboytask || room == Titlescreen || room == Scootertransition || room == rm_levelselect)
        {
            pause = 0
            instance_activate_all()
            room = Realtitlescreen
            with (obj_player1)
            {
                character = "P"
                scr_characterspr()
            }
            scr_playerreset()
            obj_player1.state = (14 << 0)
            obj_player2.state = (14 << 0)
            obj_player1.targetDoor = "A"
            if instance_exists(obj_player2)
                obj_player2.targetDoor = "A"
            global.cowboyhat = 0
            global.coop = 0
        }
        else
        {
            pause = 0
            instance_activate_all()
            scr_playerreset()
            global.levelreset = 1
            obj_player1.targetDoor = "A"
            if instance_exists(obj_player2)
                obj_player2.targetDoor = "A"
            room = rm_levelselect
        }
    }
}
