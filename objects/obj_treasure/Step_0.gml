if (sprite_index != sprgot)
    sprite_index = spridle
if (place_meeting(x, y, obj_player) && (player == 0))
{
    with (obj_player)
    {
        treasure_x = x
        treasure_y = y
        treasure_room = room
            ds_list_add(global.saveroom, other.id)
            global.treasure = 1
            hsp = 0
            vsp = 0
            if (other.sprite_index == other.spridle)
                other.alarm[0] = 150
            if (other.sprite_index == other.spridle)
            {
                state = (32 << 0)
                scr_soundeffect(sfx_secretfound)
            }
            other.sprite_index = other.sprgot
            other.x = obj_player1.x
            other.y = (obj_player1.y - 35)
            obj_tv.showtext = 1
			global.combotime = 60
            obj_tv.message = "YOU GOT A TOWER SECRET TREASURE!!!"
            obj_tv.alarm[0] = 200
            other.player = 1
            ini_close()
    }
}


