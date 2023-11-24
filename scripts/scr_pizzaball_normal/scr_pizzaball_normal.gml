function scr_pizzaball_normal() //scr_pizzaball_normal
{
    if thrown
    {
        hsp = (image_xscale * (movespeed + slopespeed))
        with (obj_destructibles)
        {
            if place_meeting((x - other.hsp), y, other.id)
                instance_destroy()
            if place_meeting(x, (y - other.vsp), other.id)
                instance_destroy()
        }
        with (obj_rollblock)
        {
            if place_meeting((x - other.hsp), y, other.id)
                instance_destroy()
            if place_meeting(x, (y - other.vsp), other.id)
                instance_destroy()
        }
        var num = instance_place_list((x + hsp), y, 302, global.instancelist, 0)
        for (var i = 0; i < num; i++)
        {
            var b = ds_list_find_value(global.instancelist, i)
            instance_destroy(b)
        }
        ds_list_clear(global.instancelist)
        if place_meeting((x + hsp), y, obj_solid)
        {
            angle = 0
            image_xscale *= -1
            movespeed /= 2
        }
        if (grounded && (!kicked))
        {
            if (movespeed > 2)
            {
                vsp = (-jspd)
                jspd /= 2
                movespeed /= 2
            }
            else
            {
                vsp = (-jspd)
                jspd /= 2
                if (movespeed > 0)
                    movespeed -= deccel
                else if (slopespeed <= 0)
                {
                    thrown = 0
                    movespeed = 0
                }
                if scr_slope()
                {
                    var _inst = instance_place(x, (y + 1), obj_slope)
                    slopespeed += 0.1
                    if (_inst.image_xscale > 0)
                        image_xscale = -1
                    else
                        image_xscale = 1
                }
                else
                    slopespeed = Approach(slopespeed, 0, deccel)
            }
        }
        else if (grounded || kicked)
        {
            if (movespeed > 0)
                movespeed -= deccel
            else
            {
                thrown = 0
                movespeed = 0
            }
        }
        if place_meeting(x, (y + 1), obj_current)
        {
            var _currentinst = instance_place(x, (y + 1), obj_current)
            movespeed = 8
            image_xscale = sign(_currentinst.image_xscale)
            hsp = (image_xscale * movespeed)
            vsp = 0
            kicked = 1
        }
    }
    else
    {
        kicked = 0
        hsp = (image_xscale * (movespeed + slopespeed))
        if scr_slope()
        {
            _inst = instance_place(x, (y + 1), obj_slope)
            slopespeed += 0.1
            if (_inst.image_xscale > 0)
                image_xscale = -1
            else
                image_xscale = 1
        }
        else
            slopespeed = 0
        var _deccel = 0.1
        if (movespeed > 0)
            movespeed -= _deccel
        else
            movespeed = 0
    }
    if (jspd < 0)
        jspd = 0
}

function scr_pizzaball_roll() //scr_pizzaball_roll
{
    if scr_slope()
    {
        kicked = 1
        _inst = instance_place(x, (y + 1), obj_slope)
        var _slope_spd2 = 6
        if (_inst.image_xscale > 0)
            movespeed = (-_slope_spd2)
        else
            movespeed = _slope_spd2
    }
    else
    {
        thrown = 0
        kicked = 0
        state = (0 << 0)
    }
}

