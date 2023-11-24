if ((!grabbed) && (other.state == (31 << 0) || other.state == (57 << 0)) && unpickable == 0)
{
    instance_create((x + (obj_player1.xscale * 40)), y, obj_punchdust)
    with (other)
    {
        image_index = 0
        sprite_index = spr_haulingstart
        baddiegrabbedID = other.id
        grabbingenemy = 1
        state = (56 << 0)
    }
    playerid = other.object_index
    grabbed = 1
}
