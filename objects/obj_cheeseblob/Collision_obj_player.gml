if (other.state != (43 << 0))
{
    repeat (8)
    {
        with (create_debris(x, y, 1067))
        {
            vsp = random_range(-5, 0)
            hsp = random_range(-3, 3)
        }
    }
    if (other.state != (19 << 0))
        tv_push_prompt_once(tv_create_prompt("This is the cheese transformation text", (2 << 0), 2189, 3), "cheesepep")
    other.state = (19 << 0)
    other.movespeed = 0
    other.sprite_index = other.spr_cheesepepintro
    instance_destroy()
}
