var _actor = 0
with (obj_player)
{
    if (state == (119 << 0))
        _actor = 1
}
if _actor
    return;
with (other)
{
    if (key_up && grounded && (!instance_exists(obj_option)) && (state == (0 << 0) || state == (79 << 0) || state == (80 << 0) || state == (40 << 0) || state == (94 << 0) || state == (75 << 0)))
    {
        instance_create(x, y, obj_option)
        state = (119 << 0)
    }
}
