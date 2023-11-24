with (other)
{
    if (state != (73 << 0) && state != (157 << 0))
    {
        if (state == (33 << 0) || state == (34 << 0) || state == (27 << 0))
        {
            with (instance_create(x, y, obj_knightdebris))
                image_index = 0
            with (instance_create(x, y, obj_knightdebris))
                image_index = 1
            with (instance_create(x, y, obj_knightdebris))
                image_index = 2
            with (instance_create(x, y, obj_knightdebris))
                image_index = 3
            with (instance_create(x, y, obj_knightdebris))
                image_index = 4
            with (instance_create(x, y, obj_knightdebris))
                image_index = 5
        }
        if (state == (36 << 0))
            instance_create(x, y, obj_bombexplosion)
        x = other.x
        instance_create(x, (y - 20), obj_bangeffect)
        sprite_index = spr_superspringplayer
        state = (73 << 0)
        vsp = -10
        other.image_index = 0
        other.sprite_index = spr_presentbox_activate
    }
}
