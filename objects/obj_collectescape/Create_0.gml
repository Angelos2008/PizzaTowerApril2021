if (room == rm_editor)
    return;
with (other)
{
    if ((obj_player1.character == "P" && obj_player1.spotlight == 1) || (obj_player2.character == "P" && obj_player1.spotlight == 0))
        sprite_index = choose(spr_eggcollect, spr_fishcollect, spr_bananacollect, spr_baconcollect, spr_shrimpcollect)
    if ((obj_player1.character == "N" && obj_player1.spotlight == 1) || (obj_player2.character == "N" && obj_player1.spotlight == 0))
        sprite_index = choose(spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5)
    image_speed = 0.35
    global.collected = 0
    global.collectsound = sfx_jump
}
if (obj_player.character == "S")
    sprite_index = spr_snickcollectible1
depth = 11
