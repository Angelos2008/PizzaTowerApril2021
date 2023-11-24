playerid = obj_player2.id
if (room != Realtitlescreen && room != rm_levelselect && room != characterselect)
{
    with (playerid)
    {
        if (state != (157 << 0) && (!(bbox_in_camera(view_camera[0], 48))))
            state = (157 << 0)
    }
}
