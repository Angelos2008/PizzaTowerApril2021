function scr_player_chainsaw() //scr_player_chainsaw
{
    hsp = 0
    vsp = 0
    x = (hitX + random_range(-4, 4))
    y = (hitY + random_range(-4, 4))
    hitLag--
    if key_jump
        input_buffer_jump = 0
    image_speed = 0
    if (hitLag <= 0)
    {
        x = hitX
        y = hitY
        movespeed = tauntstoredmovespeed
        sprite_index = tauntstoredsprite
        state = tauntstoredstate
        vsp = tauntstoredvsp
        if ((tauntstoredstate == (31 << 0) && (tauntstoredsprite == spr_player_suplexgrabjumpstart || tauntstoredsprite == spr_player_suplexgrabjump || tauntstoredsprite == spr_player_airattack || tauntstoredsprite == spr_player_airattackstart)) || sprite_index == spr_piledriverland)
        {
            jumpAnim = 1
            state = (68 << 0)
            sprite_index = spr_suplexland
            vsp = -11
            jumpstop = 0
            image_index = 0
        }
        else if (tauntstoredstate == (31 << 0) || tauntstoredstate == (6 << 0))
            state = (0 << 0)
    }
}

