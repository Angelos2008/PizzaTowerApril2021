if (room == rank_room)
    visible = false
else
    visible = true
for (var i = 0; i < array_length(monster_alarm); i++)
{
    if monster_active[i]
    {
        if (i != 4 || effect_buffer <= 0)
        {
            if (monster_room[i] != room_get_name(room))
            {
                if (alarm[i] < 0)
                    alarm[i] = monster_alarm[i]
            }
            else
                alarm[i] = monster_alarm[i]
        }
    }
}
if (player_posX == -1 && player_posY == -1)
    effect_buffer = 0
if (effect_buffer > 0)
    effect_buffer--
else if (pineapple_effect != 0)
{
    pineapple_effect = 0
    with (obj_monster)
    {
        if fake
            instance_destroy()
    }
    with (obj_pizzakinpineapple)
    {
        sprite_index = choose(spr_monsterpineapple_pose1, spr_monsterpineapple_pose2, spr_monsterpineapple_pose3)
        image_index = 0
    }
}
monster_active[0] = global.shroomfollow
monster_active[1] = global.cheesefollow
monster_active[2] = global.tomatofollow
monster_active[3] = global.sausagefollow
monster_active[4] = global.pineapplefollow
