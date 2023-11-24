if (other.state != (157 << 0) && other.state != (43 << 0))
{
    if (other.state == (33 << 0) || other.state == (27 << 0) || other.state == (17 << 0))
    {
        repeat (8)
        {
            with (create_debris(x, y, 1067))
            {
                vsp = random_range(-5, 0)
                hsp = random_range(-3, 3)
            }
        }
        instance_destroy()
    }
    else
    {
        tv_push_prompt_once(tv_create_prompt("This is the cheeseball transformation text", (2 << 0), 2017, 3), "cheeseball")
        other.xscale = image_xscale
        other.hsp = hsp
        other.vsp = vsp
        other.x = x
        other.y = y
        other.state = (17 << 0)
        other.stop_buffer = other.stop_max
        repeat (8)
        {
            with (create_debris(x, y, 1067))
            {
                vsp = random_range(-5, 0)
                hsp = random_range(-3, 3)
            }
        }
        instance_destroy()
    }
}
