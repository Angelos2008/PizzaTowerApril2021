function following_character_delete() //following_character_delete
{
    var p = ds_list_find_index(global.followerlist, id)
    if (p != -1)
    {
        ds_list_delete(global.followerlist, p)
        var _id = id
        with (obj_followcharacter)
        {
            if (id != _id)
            {
                pos = ds_list_find_index(global.followerlist, id)
                followid = (pos > 0 ? ds_list_find_value(global.followerlist, (pos - 1)) : -4)
            }
        }
    }
}

function following_character_calculate() //following_character_calculate
{
    with (obj_followcharacter)
    {
        pos = ds_list_find_index(global.followerlist, id)
        followid = (pos > 0 ? ds_list_find_value(global.followerlist, (pos - 1)) : -4)
    }
}

