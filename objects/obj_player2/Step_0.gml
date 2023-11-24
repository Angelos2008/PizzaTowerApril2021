if (room == rm_editor)
{
    visible = false
    return;
}
scr_getinput2()
event_inherited()
if (!global.coop)
{
    obj_player1.spotlight = 1
    x = -1000
    y = 500
    state = (14 << 0)
    if instance_exists(obj_coopflag)
        instance_destroy(obj_coopflag)
    if instance_exists(obj_cooppointer)
        instance_destroy(obj_cooppointer)
    if (key_jump2 && room != rank_room && room != Realtitlescreen && room != rm_levelselect && obj_player1.cutscene && (!instance_exists(obj_fadeout)) && (!instance_exists(obj_endlevelfade)))
    {
        image_blend = make_colour_hsv(0, 0, 255)
        alarm[5] = 2
        alarm[7] = 60
        hurted = 1
        x = obj_player1.x
        y = obj_player1.y
        state = (0 << 0)
        global.coop = 1
        instance_create(x, y, obj_cooppointer)
        instance_create(x, y, obj_coopflag)
    }
}
else if (key_start && (!fightball) && obj_player1.state != (94 << 0) && obj_player1.state != (4 << 0))
    state = (157 << 0)
if ((!visible) && state == (71 << 0))
{
    coopdelay++
    image_index = 0
    if (coopdelay == 50)
    {
        visible = true
        coopdelay = 0
    }
}
