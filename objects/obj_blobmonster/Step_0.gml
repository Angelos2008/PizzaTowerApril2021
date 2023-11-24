image_speed = 0.35
playerinst = instance_nearest(x, y, obj_player)
switch state
{
    case (0 << 0):
        scr_blob_normal()
        scr_robot_detect()
        break
    case (108 << 0):
        scr_blob_fall()
        break
    case (114 << 0):
        scr_blob_chase()
        break
}

if (image_yscale > 0)
    grav = normal_grav
else
    grav = (-normal_grav)
if (changeside_buffer > 0)
    changeside_buffer--
scr_collide()
grounded = 0
grounded |= scr_solid(x, (y + (1 * sign(grav))))
grounded |= ((!(place_meeting(x, y, obj_platform))) && place_meeting(x, (y + 1), obj_platform))
