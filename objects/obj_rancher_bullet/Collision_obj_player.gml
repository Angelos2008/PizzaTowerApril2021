with (other)
{
    if (character == "V")
        scr_hurtplayer(id)
    else if (state != (13 << 0) && state != (120 << 0) && state != (157 << 0))
    {
        scr_losepoints()
        tv_push_prompt_once(tv_create_prompt("This is the ghost transformation text", (2 << 0), 1908, 3), "ghost")
        grav /= 2
        state = (13 << 0)
        sprite_index = spr_ghostidle
        with (instance_create(x, y, obj_sausageman_dead))
        {
            hsp = (other.image_xscale * 3)
            image_xscale = (-other.image_xscale)
            sprite_index = other.spr_dead
        }
        instance_destroy(other)
        other.debris = 0
    }
}
