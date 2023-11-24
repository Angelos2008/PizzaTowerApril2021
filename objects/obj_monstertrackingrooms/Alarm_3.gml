var hillbilly_pos = monster_pos[3]
if (player_posX != -1 && player_posY != -1)
{
    var target_gridX = player_posX
    var target_gridY = player_posY
    var _random_movement = 0
    if (global.monsterspeed >= 1 || global.panic)
    {
        var dist = (ceil(global.monsterspeed) == 1 ? 1 : 2)
        if ((hillbilly_pos.x >= (player_posX - dist) && hillbilly_pos.x <= (player_posX + dist) && hillbilly_pos.y >= (player_posY - dist) && hillbilly_pos.y <= (player_posY + dist)) || global.panic)
        {
            if self.grid_meeting((player_posX - 1), player_posY)
                target_gridX = (player_posX - 1)
            else if self.grid_meeting((player_posX + 1), player_posY)
                target_gridX = (player_posX + 1)
        }
        else
            _random_movement = 1
    }
    else
        _random_movement = 1
    if _random_movement
    {
        target_gridX = irandom((ds_grid_width(room_grid) - 1))
        target_gridY = irandom((ds_grid_height(room_grid) - 1))
    }
    trace(target_gridX, " ", target_gridY, " ", _random_movement)
    var _dirX = (target_gridX > hillbilly_pos.x ? 1 : -1)
    var _dirY = (target_gridY > hillbilly_pos.y ? 1 : -1)
    monster_dir[3].x = (target_gridX != hillbilly_pos.x ? _dirX : 0)
    monster_dir[3].y = (target_gridY != hillbilly_pos.y ? _dirY : 0)
    _dirX = monster_dir[3].x
    _dirY = monster_dir[3].y
    if (hillbilly_pos.y != target_gridY && self.grid_meeting(hillbilly_pos.x, (hillbilly_pos.y + _dirY)))
    {
        var _room = self.room_place(hillbilly_pos.x, (hillbilly_pos.y + _dirY))
        if (_room != -4 && _room != room_get_name(room))
            hillbilly_pos.y += _dirY
        else if self.grid_meeting((hillbilly_pos.x + 1), hillbilly_pos.y)
        {
            hillbilly_pos.x += 1
            monster_dir[3].x = 1
        }
        else if self.grid_meeting((hillbilly_pos.x - 1), hillbilly_pos.y)
        {
            hillbilly_pos.x -= 1
            monster_dir[3].x = -1
        }
    }
    else if (self.grid_meeting((hillbilly_pos.x + _dirX), hillbilly_pos.y) && hillbilly_pos.x != target_gridX)
    {
        _room = self.room_place((hillbilly_pos.x + _dirX), hillbilly_pos.y)
        if (_room != -4 && _room != room_get_name(room))
            hillbilly_pos.x += _dirX
    }
}
monster_room[3] = ds_grid_get(room_grid, monster_pos[3].x, monster_pos[3].y)
