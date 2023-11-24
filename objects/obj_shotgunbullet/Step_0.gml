if (!is_solid)
    shotgun = 1
if (shotgun == 1)
{
    with (instance_place((x + spd), y, obj_shotgunblock))
        instance_destroy()
}
if (shotgun == 1)
{
    with (instance_place(x, (y - spdh), obj_shotgunblock))
        instance_destroy()
}
with (instance_place((x + spd), y, obj_destructibles))
{
    if (object_index != obj_onwaybigblock && (object_index != obj_hungrypillar || other.sprite_index != spr_peppinobullet))
        instance_destroy()
}
x += (image_xscale * spd)
y += (-spdh)
if (sprite_index == spr_mortprojectile)
{
    with (instance_place(x, (y - spdh), obj_mortblock))
        instance_destroy()
}
