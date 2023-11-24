var robot_pos = monster_pos[0]
if (player_posX != -1 && player_posY != -1)
{
    var _random_movement = 0
    if (global.monsterspeed >= 1 || global.panic)
    {
        var dist = (ceil(global.monsterspeed) == 1 ? 1 : 2)
        if ((robot_pos.x >= (player_posX - dist) && robot_pos.x <= (player_posX + dist) && robot_pos.y >= (player_posY - dist) && robot_pos.y <= (player_posY + dist)) || global.panic)
        {
            var _dirX = (player_posX > robot_pos.x ? 1 : -1)
            var _dirY = (player_posY > robot_pos.y ? 1 : -1)
            monster_dir[0].x = (player_posX != robot_pos.x ? _dirX : 0)
            monster_dir[0].y = (player_posY != robot_pos.y ? _dirY : 0)
        }
        else
            _random_movement = 1
    }
    else
        _random_movement = 1
    if _random_movement
    {
        monster_dir[0].x = irandom_range(-1, 1)
        monster_dir[0].y = irandom_range(-1, 1)
        if ((robot_pos.x + monster_dir[0].x) < 0)
            monster_dir[0].x = 1
        if ((robot_pos.x + monster_dir[0].x) > ds_grid_width(room_grid))
            monster_dir[0].x = -1
        if ((robot_pos.y + monster_dir[0].y) < 0)
            monster_dir[0].y = 1
        if ((robot_pos.y + monster_dir[0].y) > ds_grid_height(room_grid))
            monster_dir[0].y = -1
    }
    _dirX = monster_dir[0].x
    _dirY = monster_dir[0].y
    if (player_posY != robot_pos.y || _random_movement)
    {
        if ((!(self.grid_meeting((robot_pos.x + 1), robot_pos.y))) || (!(self.grid_meeting((robot_pos.x - 1), robot_pos.y))))
        {
            if self.grid_meeting(robot_pos.x, (robot_pos.y + _dirY))
                robot_pos.y += _dirY
        }
        else
        {
            var _leftcompare = self.grid_length_x(robot_pos.x, robot_pos.y, -1)
            var _rightcompare = self.grid_length_x(robot_pos.x, robot_pos.y, 1)
            _dirX = (_rightcompare < _leftcompare ? 1 : -1)
            if self.grid_meeting((robot_pos.x + _dirX), robot_pos.y)
            {
                robot_pos.x += _dirX
                monster_dir[0].x = _dirX
            }
        }
    }
    else if (self.grid_meeting((robot_pos.x + _dirX), robot_pos.y) && robot_pos.x != player_posX)
        robot_pos.x += _dirX
}
monster_room[0] = ds_grid_get(room_grid, monster_pos[0].x, monster_pos[0].y)
if (monster_room[0] == room_get_name(room))
    self.robot_create(1, 0)
