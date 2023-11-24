var cx = camera_get_view_x(view_camera[0])
switch state
{
    case (107 << 0):
        if (playerid.x != x)
            image_xscale = sign((playerid.x - x))
        currentx = Approach(currentx, targetx, 2)
        x = (cx + currentx)
        if (currentx == targetx)
        {
            state = (101 << 0)
            attack_buffer = attack_max
        }
        y = Approach(y, playerid.y, 8)
        break
    case (101 << 0):
        if (playerid.x != x)
            image_xscale = sign((playerid.x - x))
        y = Approach(y, playerid.y, 8)
        x = (cx + currentx)
        if (attack_buffer > 0)
            attack_buffer--
        else
        {
            state = (57 << 0)
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
        }
        break
    case (57 << 0):
        if (!hitboxcreate)
        {
            with (instance_create(x, y, obj_forkhitbox))
            {
                ID = other.id
                other.hitboxcreate = 1
            }
        }
        x += (image_xscale * 14)
        break
}

