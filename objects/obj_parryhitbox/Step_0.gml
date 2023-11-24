var my_player = obj_player1.id
if (player_id == 2)
    my_player = obj_player2.id
if (my_player.state != (61 << 0) && my_player.state != (120 << 0))
    instance_destroy()
image_xscale = my_player.xscale
