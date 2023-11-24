if (sprite_index != spr_mortspawn && sprite_index != spr_mortfall)
{
    with (other)
    {
        repeat (6)
            create_debris(x, y, 1080)
        mort = 1
        instance_create_unique(x, y, 12)
        global.mort = 1
        tv_push_prompt_once(tv_create_prompt("This is the mort powerup text", (2 << 0), 2254, 3), "mort")
    }
    instance_destroy()
}
