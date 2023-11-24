if (instance_number(obj_monstertrackingrooms) > 1)
{
    instance_destroy()
    return;
}
global.monsterlives_max = 3
global.monsterlives = global.monsterlives_max
global.monsterspeed = 0
global.monster_targetRoom = kidsparty_14
global.monster_targetDoor = "A"
map_width = 5
map_height = 5
room_grid = ds_grid_create(map_width, map_height)
ds_grid_clear(room_grid, -4)
ds_grid_add(room_grid, 0, 0, room_get_name(kidsparty_00))
ds_grid_add(room_grid, 1, 0, room_get_name(kidsparty_10))
ds_grid_add(room_grid, 2, 0, room_get_name(kidsparty_20))
ds_grid_add(room_grid, 3, 0, room_get_name(kidsparty_30))
ds_grid_add(room_grid, 4, 0, room_get_name(kidsparty_40))
ds_grid_add(room_grid, 0, 1, room_get_name(kidsparty_01))
ds_grid_add(room_grid, 1, 1, room_get_name(kidsparty_11))
ds_grid_add(room_grid, 2, 1, room_get_name(kidsparty_21))
ds_grid_add(room_grid, 3, 1, room_get_name(kidsparty_31))
ds_grid_add(room_grid, 4, 1, room_get_name(kidsparty_41))
ds_grid_add(room_grid, 0, 2, room_get_name(kidsparty_02))
ds_grid_add(room_grid, 1, 2, room_get_name(kidsparty_12))
ds_grid_add(room_grid, 2, 2, room_get_name(kidsparty_22))
ds_grid_add(room_grid, 3, 2, room_get_name(kidsparty_32))
ds_grid_add(room_grid, 4, 2, room_get_name(kidsparty_42))
ds_grid_add(room_grid, 0, 3, room_get_name(kidsparty_03))
ds_grid_add(room_grid, 1, 3, room_get_name(kidsparty_13))
ds_grid_add(room_grid, 2, 3, room_get_name(kidsparty_23))
ds_grid_add(room_grid, 3, 3, room_get_name(kidsparty_33))
ds_grid_add(room_grid, 4, 3, room_get_name(kidsparty_43))
ds_grid_add(room_grid, 0, 4, room_get_name(kidsparty_04))
ds_grid_add(room_grid, 1, 4, room_get_name(kidsparty_14))
ds_grid_add(room_grid, 2, 4, room_get_name(kidsparty_24))
ds_grid_add(room_grid, 3, 4, room_get_name(kidsparty_34))
ds_grid_add(room_grid, 4, 4, room_get_name(kidsparty_44))
monster_alarm[0] = 300
monster_pos[0] = new Vector2(2, 0)
monster_dir[0] = new Vector2(0, 0)
monster_active[0] = 0
monster_room[0] = -4
monster_alarm[1] = 300
monster_pos[1] = new Vector2(3, 0)
monster_dir[1] = new Vector2(0, 0)
monster_active[1] = 0
monster_room[1] = -4
monster_alarm[2] = 600
monster_pos[2] = new Vector2(3, 0)
monster_dir[2] = new Vector2(0, 0)
monster_active[2] = 0
monster_room[2] = -4
monster_alarm[3] = 300
monster_pos[3] = new Vector2(3, 0)
monster_dir[3] = new Vector2(0, 0)
monster_active[3] = 0
monster_room[3] = -4
monster_alarm[4] = 300
monster_active[4] = 0
monster_room[4] = -4
for (var i = 0; i < array_length(monster_pos); i++)
{
    var bpos = monster_pos[i]
    monster_startpos[i] = new Vector2(bpos.x, bpos.y)
}
pineapple_effect = 0
pineapple_effect_max = 5
effect_buffer = 0
effect_max = 1800
player_posX = ds_grid_value_x(room_grid, 0, 0, (map_width - 1), (map_height - 1), room_get_name(room))
player_posY = ds_grid_value_y(room_grid, 0, 0, (map_width - 1), (map_height - 1), room_get_name(room))
function room_place(argument0, argument1) //robot_create_gml_Object_obj_monstertrackingrooms_Create_0
{
    if (!instance_exists(obj_robotmonster))
    {
        var _inst = instance_create(x, y, obj_robotmonster)
        var _dir = monster_dir[0]
        with (_inst)
        {
            fake = argument1
            if argument0
            {
                if (_dir.x != 0)
                {
                    var _door = obj_player1.targetDoor
                    if instance_exists(obj_hallway)
                    {
                        with (obj_hallway)
                        {
                            if ((_dir.x < 0 && x > (room_width / 2)) || (_dir.x > 0 && x < (room_width / 2)))
                                _door = targetDoor
                        }
                    }
                    else
                        _door = obj_player1.targetDoor
                    var _doorInst = asset_get_index(("obj_door" + _door))
                    if (_doorInst == self || (!instance_exists(_doorInst)))
                        _doorInst = asset_get_index(("obj_door" + obj_player1.targetDoor))
                    image_xscale = sign(_dir.x)
                    if instance_exists(_doorInst)
                    {
                        x = (_doorInst.x + 32)
                        y = (_doorInst.y - 14)
                    }
                    else
                        instance_destroy()
                }
                else
                {
                    _doorInst = (instance_exists(obj_doorRobot) ? obj_doorRobot : obj_doorMonster)
                    if (!instance_exists(_doorInst))
                        _doorInst = asset_get_index(("obj_door" + obj_player1.targetDoor))
                    if instance_exists(_doorInst)
                    {
                        x = (_doorInst.x + 32)
                        y = (_doorInst.y - 14)
                    }
                    else
                        instance_destroy()
                }
            }
            else
            {
                _doorInst = noone
                with (obj_doorMonster)
                {
                    if (!(place_meeting(x, (y - 32), obj_solid)))
                        _doorInst = id
                }
                if (!instance_exists(_doorInst))
                    _doorInst = asset_get_index(("obj_door" + obj_player1.targetDoor))
                if instance_exists(_doorInst)
                {
                    x = (_doorInst.x + 32)
                    y = (_doorInst.y - 14)
                }
                else
                    instance_destroy()
            }
        }
    }
}

function room_place(argument0, argument1) //blob_create_gml_Object_obj_monstertrackingrooms_Create_0
{
    if (!instance_exists(obj_blobmonster))
    {
        _inst = instance_create(x, y, obj_blobmonster)
        var target_inst = noone
        var highest_y = -16
        if argument0
        {
            with (obj_doorMonster)
            {
                if (y > highest_y)
                {
                    highest_y = y
                    target_inst = id
                }
            }
        }
        else
        {
            highest_y = (room_height * 2)
            with (obj_doorMonster)
            {
                if (y < highest_y)
                {
                    highest_y = y
                    target_inst = id
                }
            }
        }
        with (_inst)
        {
            fake = argument1
            if (target_inst == noone)
                target_inst = obj_doorMonster
            if (!argument0)
            {
                image_yscale = -1
                x = (target_inst.x + 32)
                y = (target_inst.y + 47)
            }
            else
            {
                x = (target_inst.x + 32)
                y = (target_inst.y - 14)
            }
        }
    }
}

function room_place(argument0, argument1) //puppet_create_gml_Object_obj_monstertrackingrooms_Create_0
{
    var _xdir = 96
    i = 0
    while collision_line(obj_player1.x, obj_player1.y, (obj_player1.x + (_xdir * obj_player1.xscale)), obj_player1.y, obj_solid, false, true)
    {
        _xdir--
        i++
        if (i > room_width)
        {
            x = obj_player1.x
            break
        }
        else
            continue
    }
    if (!instance_exists(obj_puppetmonster))
    {
        var xx = (obj_player.x + (abs(_xdir) * obj_player1.xscale))
        var yy = obj_player1.y
        if (!argument0)
        {
            highest_y = -16
            _doorInst = noone
            with (obj_doorMonster)
            {
                if (y > highest_y)
                {
                    highest_y = y
                    _doorInst = id
                }
                if (!(place_meeting(_doorInst.x, (_doorInst.y + 16), obj_solid)))
                {
                    xx = (_doorInst.x + 32)
                    yy = (_doorInst.y + 32)
                }
                else
                {
                    xx = (_doorInst.x + 32)
                    yy = (_doorInst.y - 14)
                }
            }
        }
        _inst = instance_create(xx, yy, obj_puppetmonster)
        with (_inst)
        {
            fake = argument1
            i = 0
            while place_meeting(x, y, obj_solid)
            {
                x += (obj_player1.x > x ? 1 : -1)
                i++
                if (i > room_width)
                {
                    x = obj_player1.x
                    break
                }
                else
                    continue
            }
            var _col = collision_line(x, y, x, (y - room_height), obj_solid, true, false)
            if (_col != -4)
            {
                while (!(place_meeting(x, (y - 1), obj_solid)))
                    y--
            }
        }
    }
}

function room_place(argument0) //hillbilly_create_gml_Object_obj_monstertrackingrooms_Create_0
{
    if (!instance_exists(obj_hillbillymonster))
    {
        _inst = instance_create(x, y, obj_hillbillymonster)
        var _target_door = obj_player1.targetDoor
        if instance_exists(obj_hallway)
        {
            if (instance_number(obj_hallway) != 1)
            {
                if (obj_player1.x > (room_width / 2))
                {
                    with (obj_hallway)
                    {
                        if (x < (room_width / 2))
                        {
                            _target_door = targetDoor
                            show_debug_message("left")
                        }
                    }
                }
                else
                {
                    with (obj_hallway)
                    {
                        if (x > (room_width / 2))
                        {
                            _target_door = targetDoor
                            show_debug_message("right")
                        }
                    }
                }
            }
            else
            {
                with (obj_hallway)
                    _target_door = targetDoor
            }
        }
        else
        {
            var _highest_y = -16
            var _lowest_y = (room_height + 16)
            with (obj_door)
            {
                if (obj_player1.y < (room_height / 2))
                {
                    if (y > _highest_y)
                    {
                        _highest_y = y
                        _target_door = targetDoor
                    }
                }
                else if (y < _lowest_y)
                {
                    _lowest_y = y
                    _target_door = targetDoor
                }
            }
        }
        show_debug_message(("obj_door" + _target_door))
        var _instdoor = asset_get_index(("obj_door" + _target_door))
        if (!instance_exists(_instdoor))
            _instdoor = obj_doorMonster
        with (_inst)
        {
            fake = argument0
            x = (_instdoor.x + 32)
            y = (_instdoor.y - 14)
        }
    }
}

function room_place(argument0, argument1) //grid_meeting_gml_Object_obj_monstertrackingrooms_Create_0
{
    if (argument0 < 0 || argument0 > (map_width - 1) || argument1 < 0 || argument1 > (map_height - 1))
        return 0;
    if (ds_grid_get(room_grid, argument0, argument1) != -4)
        return 1;
    return 0;
}

function room_place(argument0, argument1, argument2) //grid_length_x_gml_Object_obj_monstertrackingrooms_Create_0
{
    var count = 0
    while self.grid_meeting((argument0 + argument2), argument1)
    {
        count++
        argument0 += argument2
    }
    return count;
}

function room_place(argument0, argument1) //room_place_gml_Object_obj_monstertrackingrooms_Create_0
{
    if (argument0 < 0 || argument0 > (map_width - 1) || argument1 < 0 || argument1 > (map_height - 1))
        return -4;
    return ds_grid_get(room_grid, argument0, argument1);
}

