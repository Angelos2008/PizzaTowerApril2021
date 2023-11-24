if global.levelreset
{
    scr_playerreset()
    global.levelreset = 0
}
if (state == (71 << 0) && global.coop == 1 && (!(place_meeting(x, y, obj_exitgate))))
{
    if (object_index == obj_player1 && obj_player1.spotlight == 0)
        visible = false
    if (object_index == obj_player2 && obj_player1.spotlight == 1)
        visible = false
}
if (global.coop == 1)
{
    scr_changetoppings()
    if (!instance_exists(obj_cooppointer))
        instance_create(x, y, obj_cooppointer)
    if (!instance_exists(obj_coopflag))
        instance_create(x, y, obj_coopflag)
}
if (state == (56 << 0))
    state = (0 << 0)
if (place_meeting(x, y, obj_boxofpizza) || place_meeting(x, (y - 1), obj_boxofpizza))
{
    box = 1
    hallway = 0
    state = (76 << 0)
}
if (object_index != obj_player2 || global.coop == 1)
{
    if (targetDoor == "A" && instance_exists(obj_doorA))
    {
        if (hallway == 1)
            x = (obj_doorA.x + (hallwaydirection * 100))
        else if (box == 1)
            x = (obj_doorA.x + 32)
        else
            x = (obj_doorA.x + 16)
        y = (obj_doorA.y - 14)
    }
    if (targetDoor == "B" && instance_exists(obj_doorB))
    {
        if (hallway == 1)
            x = (obj_doorB.x + (hallwaydirection * 100))
        else if (box == 1)
            x = (obj_doorB.x + 32)
        else
            x = (obj_doorB.x + 16)
        y = (obj_doorB.y - 14)
    }
    if (targetDoor == "C" && instance_exists(obj_doorC))
    {
        if (hallway == 1)
            x = (obj_doorC.x + (hallwaydirection * 100))
        else if (box == 1)
            x = (obj_doorC.x + 32)
        else
            x = (obj_doorC.x + 16)
        y = (obj_doorC.y - 14)
    }
    if (targetDoor == "D" && instance_exists(obj_doorD))
    {
        if (hallway == 1)
            x = (obj_doorD.x + (hallwaydirection * 100))
        else if (box == 1)
            x = (obj_doorD.x + 32)
        else
            x = (obj_doorD.x + 16)
        y = (obj_doorD.y - 14)
    }
    if (targetDoor == "E" && instance_exists(obj_doorE))
    {
        if (hallway == 1)
            x = (obj_doorE.x + (hallwaydirection * 100))
        else if (box == 1)
            x = (obj_doorE.x + 32)
        else
            x = (obj_doorE.x + 16)
        y = (obj_doorE.y - 14)
    }
}
if verticalhallway
    y += (vhallwaydirection * 50)
if (character == "M" && place_meeting(x, y, obj_boxofpizza))
{
    while place_meeting(x, y, obj_boxofpizza)
    {
        var _inst = instance_place(x, y, obj_boxofpizza)
        y -= _inst.image_yscale
    }
}
hallway = 0
verticalhallway = 0
box = 0
roomstartx = x
roomstarty = y
