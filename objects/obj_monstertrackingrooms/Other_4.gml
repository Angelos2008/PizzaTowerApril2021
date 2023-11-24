player_posX = ds_grid_value_x(room_grid, 0, 0, (map_width - 1), (map_height - 1), room_get_name(room))
player_posY = ds_grid_value_y(room_grid, 0, 0, (map_width - 1), (map_height - 1), room_get_name(room))
for (var i = 0; i < array_length(monster_room); i++)
{
    if (i == 4)
    {
    }
    else
        monster_room[i] = ds_grid_get(room_grid, monster_pos[i].x, monster_pos[i].y)
}
if (player_posX != -1 && player_posY != -1)
{
    if (monster_room[0] == room_get_name(room) && monster_active[0])
        self.robot_create(0, 0)
    if (monster_room[1] == room_get_name(room) && monster_active[1])
        self.blob_create((monster_dir[1].y > 0 ? 0 : 1), 0)
    if (monster_room[2] == room_get_name(room) && monster_active[2])
        self.puppet_create(0, 0)
    if (monster_room[3] == room_get_name(room) && monster_active[3])
    {
        with (obj_door)
            event_perform(ev_step, ev_step_normal)
        with (obj_hallway)
            event_perform(ev_step, ev_step_normal)
        self.hillbilly_create(0)
    }
    if (monster_active[4] && pineapple_effect != 0)
    {
        switch pineapple_effect
        {
            case 1:
                self.robot_create(0, 1)
                break
            case 2:
                self.blob_create(choose(1, 0), 1)
                break
            case 3:
                self.puppet_create(0, 1)
                break
            case 4:
                self.hillbilly_create(1)
                break
        }

    }
}
