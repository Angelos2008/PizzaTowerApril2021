global.breaksound = sfx_jump
if (obj_player1.character == "P" && obj_player1.spotlight == 1 && obj_player1.ispeppino)
    sprite_index = spr_destroyable2
if ((obj_player1.character == "N" || (!obj_player1.ispeppino)) && obj_player1.spotlight == 1)
    sprite_index = spr_halloweensmallblock
depth = 1
