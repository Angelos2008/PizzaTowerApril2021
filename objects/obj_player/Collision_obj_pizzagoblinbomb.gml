if (character == "V")
    scr_hurtplayer(object_index)
var b = 1
for (i = 0; i < array_length(transformation); i += 1)
{
    if (state == transformation[i])
        b = 0
}
if (b == 1)
{
    if (cutscene == 0 && other.grounded == 1 && state != (36 << 0) && (state == (31 << 0) || state == (57 << 0) || character == "S"))
    {
        bombpeptimer = 100
        state = (36 << 0)
        image_index = 0
        sprite_index = spr_bombpepintro
        instance_destroy(other)
        tv_push_prompt_once(tv_create_prompt("This is the bomb transformation text", (2 << 0), 2231, 3), "bombpep")
    }
}
