with (obj_player)
{
    if place_meeting(x, y, other)
    {
        if (state == (36 << 0) && hurted == 0)
        {
            scr_soundeffect(sfx_bombpep2)
            image_index = 0
            hurted = 1
            vsp = -4
            sprite_index = spr_bombpepend
            state = (36 << 0)
            bombpeptimer = 0
            instance_create(x, y, obj_bombexplosion)
        }
    }
}
