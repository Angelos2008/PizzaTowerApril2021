if ((!instance_exists(ID)) && room != custom_lvl_room)
    instance_destroy()
if instance_exists(ID)
{
    x = ID.x
    y = ID.y
    image_xscale = ID.image_xscale
    image_index = ID.image_index
    with (ID)
    {
        if (object_index == obj_coolpineapple || object_index == obj_forknight || object_index == obj_noisey || object_index == obj_smokingpizzaslice)
        {
            if (state != (107 << 0) && state != (98 << 0))
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
        }
        if (object_index == obj_robot)
        {
            if (state != (80 << 0) && state != (18 << 0) && state != (67 << 0))
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            else if (state == (18 << 0))
                other.x = (x + (image_xscale * 32))
        }
        if (object_index == obj_soldier)
        {
            other.x = (x + (image_xscale * 24))
            if (state != (98 << 0))
                instance_destroy(other)
        }
        if (object_index == obj_indiancheese)
        {
            if (state != (107 << 0) && sprite_index != spr_indiancheese_howl)
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
        }
        if (object_index == obj_thug_red || object_index == obj_thug_blue || object_index == obj_thug_green)
        {
            if (state != (57 << 0))
            {
                instance_destroy(other)
                punchinst = -4
            }
        }
        if (object_index == obj_weeniesquire)
        {
            if (stun == 1)
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
        }
        if (object_index == obj_minijohn)
        {
            if (state != (98 << 0))
                instance_destroy(other)
        }
        if (object_index == obj_ninja)
        {
            if (state != (101 << 0) && state != (57 << 0))
                instance_destroy(other)
            if (state == (57 << 0))
            {
                if (image_index > 14)
                    instance_destroy(other)
                other.x = (x + (image_xscale * 24))
            }
        }
        if (object_index == obj_boulder)
        {
            if (hitwall == 0)
                instance_destroy(other)
        }
        if (object_index == obj_snickexe)
        {
            if (obj_player1.instakillmove == 1 || obj_player1.state == (31 << 0))
            {
                instance_destroy(other)
                hitboxcreate = 0
            }
        }
        if (object_index == obj_pickle)
        {
            if (state != (102 << 0))
                instance_destroy(other)
        }
        if (object_index == obj_noisecrusher)
        {
            if (state != (100 << 0))
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
        }
        if (object_index == obj_peasanto || object_index == obj_fencer || object_index == obj_pizzice || object_index == obj_ancho)
        {
            if (state != (101 << 0) && state != (98 << 0))
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
        }
    }
}
