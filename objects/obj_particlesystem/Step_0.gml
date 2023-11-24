if (!ds_list_empty(global.debris_list))
{
    for (var i = 0; i < ds_list_size(global.debris_list); i++)
    {
        var q = ds_list_find_value(global.debris_list, i)
        if is_struct(q)
        {
            with (q)
            {
                if (vsp < 20)
                    vsp += grav
                x += hsp
                y += vsp
                var outofx = (x > (room_width + sprw) || x < (-sprw))
                var outofy = (y > (room_height + sprh) || y < (-sprh))
                if (outofx || outofy)
                {
                    ds_list_delete(global.debris_list, i)
                    i--
                    q = undefined
                }
            }
        }
    }
}
if (!ds_list_empty(global.collect_list))
{
    for (i = 0; i < ds_list_size(global.collect_list); i++)
    {
        var b = ds_list_find_value(global.collect_list, i)
        if is_struct(b)
        {
            with (b)
            {
                var _dir = point_direction(x, y, 146, 109)
                hsp = lengthdir_x(16, _dir)
                vsp = lengthdir_y(16, _dir)
                x += hsp
                y += vsp
                outofx = x < 238
                outofy = y < 159
                if (outofx && outofy)
                {
                    with (obj_camera)
                        collect_shake += 10
                    ds_list_delete(global.collect_list, i)
                    i--
                    b = undefined
                }
            }
        }
    }
}
