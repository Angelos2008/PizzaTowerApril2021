depth = -999
function bosssprshadow() //get_player_hp_gml_Object_obj_bosscontroller_Create_0
{
    player_hpmax = player_hpbase
    player_hp = player_hpbase
    ini_open(concat("saveData", global.currentsavefile, ".ini"))
    for (var i = 0; i < array_length(level_array); i++)
    {
        for (var j = 0; j < array_length(toppin_count); j++)
        {
            toppin_count[j][i] = ini_read_real("Toppin", (level_array[i] + string((j + 1))), 0)
            player_hp += (player_hpmultiplier * toppin_count[j][i])
        }
    }
    ini_close()
    player_hpmax += ((array_length(level_array) * array_length(toppin_count)) * player_hpmultiplier)
}

player_hpmultiplier = 300
player_hpbase = (player_hpmultiplier * 5)
player_hpmax = player_hpbase
player_hp = 0
level_array[0] = "entrance"
level_array[1] = "medieval"
level_array[2] = "ruin"
level_array[3] = "dungeon"
toppin_count[0] = array_create(5, 0)
toppin_count[1] = array_create(5, 0)
toppin_count[2] = array_create(5, 0)
toppin_count[3] = array_create(5, 0)
toppin_count[4] = array_create(5, 0)
maxminutes = 0
maxseconds = 45
round_count = 1
round_max = 6
timer_max = (room_speed * 3)
timer_buffer = timer_max
minutes = maxminutes
seconds = maxseconds
bossID = -4
state = (117 << 0)
fade = 1
fakedeath = 0
extrarounds = 0
extrarounds_count = 3
startroundfunc = -4
endroundfunc = -4
intro_buffer = 300
playerx = -415
bossx = room_width
vsy = -400
flamey = 0
flash = 0
flashed = 0
vstitle = 1326
playerspr = spr_vspeppino
playersprshadow = 1329
bossspr = spr_vsnoise
bosssprshadow = 1327
