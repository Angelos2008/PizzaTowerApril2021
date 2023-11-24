if (room == rm_editor)
    return;
if global.key_inv
    return;
with (other)
{
    if (state != (36 << 0) && state != (157 << 0) && state != (13 << 0) && state != (33 << 0) && state != (17 << 0) && state != (24 << 0) && state != (19 << 0) && state != (34 << 0) && state != (27 << 0) && state != (83 << 0))
    {
        instance_destroy(other)
        global.key_inv = 1
        key_particles = 1
        alarm[7] = 30
        scr_soundeffect(sfx_collecttoppin)
        state = (66 << 0)
        image_index = 0
        global.heattime = 60
    }
}
