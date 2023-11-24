for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
    var b = ds_list_find_value(global.afterimage_list, i)
    with (b)
    {
        for (var l = 0; l < array_length(alarm); l++)
        {
            if (alarm[l] >= 0)
                alarm[l]--
        }
        switch identifier
        {
            case (1 << 0):
                if ((!((playerid.state == (68 << 0) && playerid.sprite_index == spr_playerN_noisebombspinjump))) && playerid.pizzapepper == 0 && playerid.sprite_index != spr_player_barrelroll && playerid.state != (37 << 0) && playerid.state != (120 << 0) && playerid.state != (30 << 0) && playerid.state != (57 << 0) && playerid.state != (30 << 0) && playerid.state != (23 << 0) && playerid.state != (78 << 0) && playerid.state != (4 << 0) && playerid.pogochargeactive == 0 && playerid.state != (16 << 0) && playerid.state != (94 << 0) && playerid.state != (26 << 0) && playerid.state != (15 << 0) && playerid.state != (101 << 0) && playerid.state != (80 << 0) && playerid.state != (31 << 0) && playerid.state != (81 << 0) && playerid.state != (52 << 0) && playerid.state != (45 << 0) && playerid.state != (50 << 0) && playerid.state != (53 << 0) && playerid.state != (47 << 0) && playerid.state != (43 << 0) && playerid.state != (73 << 0) && playerid.state != (24 << 0))
                    alarm[0] = 0
                visible = playerid.visible
                break
            case (2 << 0):
                x += hsp
                y += vsp
                break
        }

        if (alarm[1] == 0)
        {
            other.alpha[identifier] = 0
            alarm[2] = 3
        }
        if (alarm[2] == 0)
        {
            other.alpha[identifier] = 1
            alarm[2] = 3
        }
        if (alarm[0] == 0)
        {
            b = undefined
            ds_list_delete(global.afterimage_list, i)
            i--
        }
    }
}
