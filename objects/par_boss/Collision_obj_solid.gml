if (!colliding)
    return;
var ty = try_solid(0, -1, 92, 64)
if (ty != -1)
    y -= ty
var tx = try_solid(image_xscale, 0, 92, 64)
if (tx != -1)
    x += (tx * image_xscale)
if place_meeting(x, y, obj_solid)
{
    ty = try_solid(0, 1, 92, 64)
    if (ty != -1)
        y += ty
    tx = try_solid((-image_xscale), 0, 92, 64)
    if (tx != -1)
        x += (tx * (-image_xscale))
}
