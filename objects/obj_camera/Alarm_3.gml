if (room == rank_room)
    return;
if (!global.panic)
    return;
if instance_exists(obj_treasure)
    return;
var _foundtoppin = 0
if (!ds_list_empty(global.followerlist))
{
    var _inst = noone
    for (var i = 0; i < ds_list_size(global.followerlist); i++)
    {
        var b = ds_list_find_value(global.followerlist, i)
        if (instance_exists(b) && object_get_parent(b.object_index) == 36)
            _inst = b
    }
    if (_inst != noone)
    {
        switch _inst.object_index
        {
            case obj_pizzakinshroom:
                global.shroomfollow = 0
                break
            case 317:
                global.pineapplefollow = 0
                break
            case 316:
                global.sausagefollow = 0
                break
            case 315:
                global.tomatofollow = 0
                break
            case 314:
                global.cheesefollow = 0
                break
        }

        instance_destroy(_inst)
        _foundtoppin = 1
        create_particle(_inst.x, _inst.y, (9 << 0), 0)
    }
}
if (!_foundtoppin)
{
    var playerid = (obj_player1.spotlight ? obj_player1.id : obj_player2.id)
    with (playerid)
    {
        instance_destroy(obj_fadeout)
        if (state != (32 << 0))
        {
            targetDoor = "A"
            room = timesuproom
            state = (46 << 0)
            sprite_index = spr_Timesup
            image_index = 0
            audio_stop_all()
            scr_soundeffect(mu_timesup)
        }
        else
            other.alarm[3] = 15
    }
}
else
    alarm[3] = 150
