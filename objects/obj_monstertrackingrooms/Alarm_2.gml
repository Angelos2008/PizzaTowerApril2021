var puppet_pos = monster_pos[2]
if (player_posX != -1 && player_posY != -1)
{
    puppet_pos.x = player_posX
    puppet_pos.y = player_posY
    monster_room[2] = ds_grid_get(room_grid, monster_pos[2].x, monster_pos[2].y)
}
if (monster_room[2] == room_get_name(room))
    self.puppet_create(1, 0)
