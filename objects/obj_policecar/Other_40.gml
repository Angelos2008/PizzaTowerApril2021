if (state != (124 << 0))
    return;
if (!instance_exists(obj_fadeout))
{
    scr_soundeffect(sfx_door)
    instance_create(x, y, obj_fadeout)
}
