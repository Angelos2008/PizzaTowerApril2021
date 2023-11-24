if (other.state != (43 << 0) && other.skateboarding == 0)
{
    instance_create(x, y, obj_genericpoofeffect)
    other.movespeed = 10
    other.state = (80 << 0)
    other.skateboarding = 1
    tv_push_prompt_once(tv_create_prompt("This is the clown transformation text", (2 << 0), 1121, 3), "skateboard")
}
