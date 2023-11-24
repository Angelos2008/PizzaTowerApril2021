if ((other.state == (31 << 0) || other.state == (57 << 0)) && other.grounded == 1)
{
    instance_create((x + (obj_player1.xscale * 40)), y, obj_punchdust)
    with (other)
    {
        image_index = 0
        sprite_index = spr_haulingstart
        grabbingenemy = 1
        baddiegrabbedID = other.id
        state = (56 << 0)
    }
    playerid = other.object_index
    grabbed = 1
}
if (other.state == (80 << 0) || other.state == (94 << 0) || (other.state == (47 << 0) && grounded))
{
    create_particle(x, y, (9 << 0), 0)
    with (other)
    {
        vsp = 0
        mask_index = spr_crouchmask
        x = other.x
        y = other.y
        state = (89 << 0)
        sprite_index = spr_barrelroll
        movespeed = 12
    }
    instance_destroy()
}
