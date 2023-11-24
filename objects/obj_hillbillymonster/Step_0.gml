playerinst = instance_nearest(x, y, obj_player)
image_speed = 0.35
switch state
{
    case (99 << 0):
        scr_hillbilly_idle()
        break
    case (114 << 0):
        scr_hillbilly_chase()
        scr_hillbilly_destroyables()
        break
    case (0 << 0):
        scr_hillbilly_detect()
        break
    case (81 << 0):
        scr_hillbilly_machslide()
        scr_hillbilly_destroyables()
        break
}

scr_collide()
