if (state == (124 << 0))
{
}
if (other.state != (61 << 0) || other.parry_inst == noone)
{
    with (obj_player)
    {
        targetRoom = other.targetRoom
        lastroom = room
        targetDoor = other.targetDoor
        visible = false
        if (state != (157 << 0))
            state = (124 << 0)
        cutscene = 1
        hsp = 0
        vsp = 0
    }
    grav = 0
    state = (124 << 0)
    hsp = 10
    image_xscale = 1
    vsp = 0
}
else
{
    with (other.parry_inst)
    {
        if (!collisioned)
            event_user(0)
    }
    instance_destroy()
}
