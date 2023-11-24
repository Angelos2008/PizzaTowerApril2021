playerid = instance_nearest(x, y, obj_player)
if (!activated)
{
    if (playerid.x < (x + 100) && playerid.x >= (x - 100) && playerid.y > y)
    {
        grav = 0.5
        activated = 1
        image_speed = 0.35
        sprite_index = spr_meatball_roll
    }
}
else
{
    if (place_meeting(x, y, obj_player) && (!hitwall))
    {
        with (obj_player)
        {
            if (state != (41 << 0) && grounded && scr_transformationcheck() && place_meeting(x, y, other))
            {
                if (place_meeting(x, (y + 1), obj_platform) && (!(place_meeting(x, (y + 1), obj_solid))))
                    y += 1
                state = (41 << 0)
                tv_push_prompt_once(tv_create_prompt("This is the squished transformation text", (2 << 0), 357, 3), "squished")
                sprite_index = spr_squished
                image_index = 0
            }
        }
    }
    if (vsp > 0 && scr_solid(x, (y + 1)))
    {
        vsp = -6
        hsp = (image_xscale * 8)
    }
    with (instance_place((x + hsp), y, obj_destructibles))
        instance_destroy()
    if ((!hitwall) && (!(place_meeting((x + hsp), y, obj_destructibles))) && place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && scr_solid(x, (y + 1)))
    {
        with (instance_create(x, y, obj_sausageman_dead))
            sprite_index = spr_meatball_dead
        instance_destroy()
    }
}
if (!hitwall)
    scr_collide()
