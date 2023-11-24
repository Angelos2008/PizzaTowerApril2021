var blob_pos = monster_pos[1]
if (player_posX != -1 && player_posY != -1)
{
    var target_gridX = player_posX
    var target_gridY = player_posY
    var _random_movement = 0
    if (global.monsterspeed >= 1 || global.panic)
    {
        var dist = (ceil(global.monsterspeed) == 1 ? 1 : 2)
        if ((blob_pos.x >= (player_posX - dist) && blob_pos.x <= (player_posX + dist) && blob_pos.y >= (player_posY - dist) && blob_pos.y <= (player_posY + dist)) || global.panic)
        {
            target_gridX = player_posX
            target_gridY = player_posY
            if self.grid_meeting(player_posX, (player_posY - 1))
                target_gridY = (player_posY - 1)
            else if self.grid_meeting(player_posX, (player_posY + 1))
                target_gridY = (player_posY + 1)
            if (self.room_place(target_gridX, target_gridY) == self.room_place(blob_pos.x, blob_pos.y))
                target_gridY = player_posY
        }
        else
            _random_movement = 1
    }
    if _random_movement
    {
        while (target_gridX == blob_pos.x)
            target_gridX = irandom((ds_grid_width(room_grid) - 1))
        while (target_gridY == blob_pos.y)
            target_gridY = irandom((ds_grid_height(room_grid) - 1))
    }
    trace(target_gridX, " ", target_gridY)
    var _dirX = (target_gridX > blob_pos.x ? 1 : -1)
    var _dirY = (target_gridY > blob_pos.y ? 1 : -1)
    monster_dir[1].x = (target_gridX != blob_pos.x ? _dirX : 0)
    monster_dir[1].y = (target_gridY != blob_pos.y ? _dirY : 0)
    _dirX = monster_dir[1].x
    _dirY = monster_dir[1].y
    if (blob_pos.y != target_gridY && self.grid_meeting(blob_pos.x, (blob_pos.y + _dirY)) && target_gridY != blob_pos.y)
    {
        var _room = self.room_place(blob_pos.x, (blob_pos.y + _dirY))
        if (_room != -4 && (_room != room_get_name(room) || blob_pos.x == target_gridX))
            blob_pos.y += _dirY
    }
    else if (self.grid_meeting((blob_pos.x + _dirX), blob_pos.y) && blob_pos.x != target_gridX)
    {
        _room = self.room_place((blob_pos.x + _dirX), blob_pos.y)
        if (_room != -4 && _room != room_get_name(room))
            blob_pos.x += _dirX
    }
}
monster_room[1] = ds_grid_get(room_grid, monster_pos[1].x, monster_pos[1].y)
if (monster_room[1] == room_get_name(room))
    self.blob_create((monster_dir[1].y > 0 ? 0 : 1), 0)
