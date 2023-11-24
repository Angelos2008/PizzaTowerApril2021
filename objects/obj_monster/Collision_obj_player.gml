if (!can_touch)
{
}
if (!fake)
{
    if (global.monsterlives > 0 || global.panic)
    {
        if (!instance_exists(obj_fadeout))
        {
            with (obj_monstertrackingrooms)
            {
                var b = monster_pos[other.monsterid]
                b.x = monster_startpos[other.monsterid].x
                b.y = monster_startpos[other.monsterid].y
            }
            with (obj_drawcontroller)
                flash = 0.8
            instance_destroy()
            if (!global.panic)
                global.monsterlives--
        }
    }
    else if (!instance_exists(obj_fadeout))
    {
        global.monsterlives = global.monsterlives_max
        with (obj_player)
        {
            targetRoom = other.targetRoom
            targetDoor = other.targetDoor
            state = (0 << 0)
            instance_create(x, y, obj_fadeout)
            with (instance_create(x, y, obj_fadeout))
            {
                if (other.targetRoom == room)
                    roomreset = 1
            }
        }
        with (obj_drawcontroller)
            flash = 2
        instance_destroy()
        with (obj_monstertrackingrooms)
        {
            b = monster_pos[other.monsterid]
            b.x = monster_startpos[other.monsterid].x
            b.y = monster_startpos[other.monsterid].y
        }
    }
}
else
{
    touched = 1
    instance_destroy()
    with (obj_drawcontroller)
        flash = 0.8
    with (obj_monstertrackingrooms)
        effect_buffer = 0
}
