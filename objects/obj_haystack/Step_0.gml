mask_index = spr_haystack
if (sprite_index != spr_haystackburning && sprite_index != spr_haystackburningup)
{
    with (obj_peasanto)
    {
        if (state == (101 << 0) && place_meeting((x + hsp), y, other))
            other.sprite_index = spr_haystackburningup
    }
    with (obj_player)
    {
        if ((state == (10 << 0) && (place_meeting((x + hsp), y, other) || place_meeting(x, (y + 1), other))) || (state == (9 << 0) && place_meeting(x, (y + 1), other)))
            other.sprite_index = spr_haystackburningup
    }
}
else if (sprite_index == spr_haystackburningup)
{
    if (floor(image_index) == (image_number - 1))
        sprite_index = spr_haystackburning
}
else if (sprite_index == spr_haystackburning)
{
    with (instance_place((x + 1), y, obj_haystack))
    {
        if (sprite_index != spr_haystackburningup && sprite_index != spr_haystackburning)
            sprite_index = spr_haystackburningup
    }
    with (instance_place((x - 1), y, obj_haystack))
    {
        if (sprite_index != spr_haystackburningup && sprite_index != spr_haystackburning)
            sprite_index = spr_haystackburningup
    }
    with (instance_place(x, (y + 1), obj_haystack))
    {
        if (sprite_index != spr_haystackburningup && sprite_index != spr_haystackburning)
            sprite_index = spr_haystackburningup
    }
    with (instance_place(x, (y - 1), obj_haystack))
    {
        if (sprite_index != spr_haystackburningup && sprite_index != spr_haystackburning)
            sprite_index = spr_haystackburningup
    }
    with (instance_place(x, (y - 1), obj_baddie))
    {
        if (state != (4 << 0))
            instance_destroy()
    }
    if (ds_list_find_index(global.saveroom, id) == -1)
        ds_list_add(global.saveroom, id)
    playerid = instance_place(x, (y - 1), obj_player)
    with (playerid)
    {
        if (state != (9 << 0) && state != (33 << 0))
        {
            if (character == "V")
                scr_hurtplayer(id)
            else if scr_transformationcheck()
            {
                scr_losepoints()
                scr_soundeffect(sfx_scream3)
                if (state != (9 << 0))
                    tv_push_prompt_once(tv_create_prompt("This is the fireass transformation text", (2 << 0), 542, 3), "fireass")
                state = (9 << 0)
                image_index = 0
                vsp = -5
                sprite_index = spr_fireass
            }
        }
    }
}
