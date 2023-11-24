function scr_scareenemy() //scr_scareenemy
{
    var player = instance_nearest(x, y, obj_player)
    if (state != (4 << 0) && state != (111 << 0) && state != (110 << 0))
    {
        if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
        {
            if (sprite_index != scaredspr && state != (111 << 0) && state != (127 << 0) && (player.state == (30 << 0) || player.state == (94 << 0) || player.state == (23 << 0) || player.state == (156 << 0) || player.state == (16 << 0) || player.state == (27 << 0)))
            {
                state = (99 << 0)
                sprite_index = scaredspr
                if (x != player.x)
                    image_xscale = (-(sign((x - player.x))))
                scaredbuffer = 100
                if grounded
                    vsp = -5
            }
        }
    }
}

