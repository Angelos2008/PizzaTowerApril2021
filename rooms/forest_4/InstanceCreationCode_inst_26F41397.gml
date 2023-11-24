if ((!global.pizzadelivery) && global.pizzasdelivered < 5 && global.panic == 0)
{
    if (!global.failcutscene)
    {
        if (global.pizzasdelivered <= 0)
            scene_info = [[cutscene_set_sprite, 599, 2030, 0.35, -1], [cutscene_gustavo_start], [cutscene_wait, 30], [cutscene_set_sprite, 599, 2021, 0.35, -1], [cutscene_wait, 10], [cutscene_move_player, 102, (obj_gustavo.x - 48), 6, 16], [cutscene_set_sprite, 102, 2014, 0.35, 1], [cutscene_set_sprite, 599, 2022, 0.35, -1], [cutscene_gustavo_end]]
        else
            scene_info = [[cutscene_set_sprite, 599, 2021, 0.35, -1]]
    }
    else
        scene_info = [[cutscene_gustavofail_start], [cutscene_wait, 20], [cutscene_set_sprite, 599, 2025, 0.35, -1], [cutscene_waitfor_sprite, 599], [cutscene_set_sprite, 599, 2026, 0.35, -1], [cutscene_wait, 50], [cutscene_set_sprite, 599, 2027, 0.35, -1], [cutscene_set_sprite, 102, 2016, 0.35, 1], [cutscene_waitfor_sprite, 599], [cutscene_set_sprite, 599, 2028, 0.35, -1], [cutscene_set_hsp, 599, -12], [cutscene_set_sprite, 102, 2018, 0.35, 1], [cutscene_waitfor_sprite, 102], [cutscene_set_sprite, 102, 2019, 0.35, 1], [cutscene_check_collision, 599, 102], [cutscene_set_hsp, 599, 0], [cutscene_gustavofail_end, 100], [cutscene_move_actor, 599, obj_gustavo.xstart, obj_gustavo.ystart, 0.05], [cutscene_set_sprite, 599, 2021, 0.35, -1]]
}
else
    scene_info = [[cutscene_wait, 2]]
