if (player_posX != -1 && player_posY != -1)
{
    pineapple_effect = irandom_range(1, pineapple_effect_max)
    if (pineapple_effect == 5)
    {
        with (obj_tv)
        {
            message = "YOU TOOK TOO LONG"
            showtext = 1
            alarm[0] = 200
        }
    }
    with (obj_pizzakinpineapple)
    {
        sprite_index = spr_monsterpineapple_smile
        image_index = 0
    }
    effect_buffer = effect_max
}
