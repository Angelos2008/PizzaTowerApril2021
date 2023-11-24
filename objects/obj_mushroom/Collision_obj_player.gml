if (other.cutscene == 0 && other.state != (84 << 0) && other.state != (95 << 0) && other.state != (157 << 0))
{
    sprite_index = spr_bigmushroom_bounce
    if (other.state == (68 << 0) || other.state == (0 << 0))
        other.sprite_index = spr_player_machfreefall
    image_index = 0
    other.vsp = -20
    other.jumpstop = 1
}
