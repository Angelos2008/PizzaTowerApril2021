if (!released)
{
    if (inst != noone && (!instance_exists(inst)))
        inst = noone
    with (obj_baddie)
    {
        if (state == (4 << 0) || state == (110 << 0))
        {
            other.grabbedby = grabbedby
            other.released = 1
            other.image_speed = 0.35
            other.image_index = 0
        }
    }
}
else if (floor(image_index) == 3 && (!instance_exists(inst)))
{
    var _p = obj_player1.id
    if (grabbedby == 2)
        _p = obj_player2.id
    inst = instance_create(x, (y + 13), obj_policecar)
    inst.targetplayer = _p
    inst.targetRoom = targetRoom
    inst.targetDoor = targetDoor
}
