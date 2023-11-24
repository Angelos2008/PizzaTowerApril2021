with (obj_player)
{
    if (other.image_yscale == 1)
    {
        if (((key_down && (!(place_meeting(x, (y + 1), obj_destructibles))) && place_meeting(x, (y + 1), other) && (state == (76 << 0) || character == "S" || character == "M" || state == (47 << 0))) || ((state == (78 << 0) || state == (84 << 0) || state == (87 << 0)) && (!(place_meeting(x, (y + 1), obj_destructibles))) && place_meeting(x, (y + 1), other))) && (!instance_exists(obj_fadeout)) && state != (88 << 0) && state != (71 << 0))
        {
            obj_player1.lastroom = room
            obj_player2.lastroom = room
            other.depth = -10
            scr_soundeffect(sfx_box)
            obj_player1.box = 1
            obj_player2.box = 1
            mach2 = 0
            obj_camera.chargecamera = 0
            x = other.x
            obj_player1.targetDoor = other.targetDoor
            obj_player1.targetRoom = other.targetRoom
            obj_player2.targetDoor = other.targetDoor
            obj_player2.targetRoom = other.targetRoom
            if (global.coop == 1)
            {
                var _box = other.id
                with (obj_player)
                {
                    x = _box.x
                    y = (_box.y - 76)
                }
                obj_player1.sprite_index = obj_player1.spr_downpizzabox
                obj_player1.image_index = 0
                obj_player1.state = (88 << 0)
                obj_player2.sprite_index = obj_player2.spr_downpizzabox
                obj_player2.image_index = 0
                if (obj_player2.state != (157 << 0))
                    obj_player2.state = (88 << 0)
            }
            else
            {
                sprite_index = spr_downpizzabox
                image_index = 0
                state = (88 << 0)
            }
        }
    }
    if (other.image_yscale == -1)
    {
        if (((key_up && (!(place_meeting(x, (y - 1), obj_destructibles))) && place_meeting(x, (y - 10), other) && (state == (0 << 0) || state == (40 << 0) || state == (68 << 0) || state == (79 << 0) || state == (80 << 0) || state == (94 << 0) || state == (75 << 0) || (state == (57 << 0) && sprite_index == spr_player_breakdanceuppercut))) || ((state == (73 << 0) || state == (96 << 0)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && place_meeting(x, (y - 1), other))) && (!instance_exists(obj_fadeout)) && state != (88 << 0) && state != (71 << 0))
        {
            obj_player1.lastroom = room
            obj_player2.lastroom = room
            scr_soundeffect(sfx_box)
            other.depth = -10
            obj_player1.box = 1
            obj_player2.box = 1
            other.depth = -8
            mach2 = 0
            obj_camera.chargecamera = 0
            x = other.x
            y = (other.y + 24)
            obj_player1.targetDoor = other.targetDoor
            obj_player1.targetRoom = other.targetRoom
            obj_player2.targetDoor = other.targetDoor
            obj_player2.targetRoom = other.targetRoom
            if (global.coop == 1)
            {
                _box = other.id
                with (obj_player)
                {
                    x = _box.x
                    y = (_box.y + 24)
                }
                obj_player1.sprite_index = obj_player1.spr_uppizzabox
                obj_player1.image_index = 0
                obj_player1.state = (88 << 0)
                obj_player2.sprite_index = obj_player2.spr_uppizzabox
                obj_player2.image_index = 0
                if (obj_player2.state != (157 << 0))
                    obj_player2.state = (88 << 0)
            }
            else
            {
                sprite_index = spr_uppizzabox
                image_index = 0
                state = (88 << 0)
            }
        }
    }
}
if (place_meeting(x, (y + 1), obj_doorA) || place_meeting(x, (y - 1), obj_doorA))
    targetDoor = "A"
if (place_meeting(x, (y + 1), obj_doorB) || place_meeting(x, (y - 1), obj_doorB))
    targetDoor = "B"
if (place_meeting(x, (y + 1), obj_doorC) || place_meeting(x, (y - 1), obj_doorC))
    targetDoor = "C"
if (place_meeting(x, (y + 1), obj_doorD) || place_meeting(x, (y - 1), obj_doorD))
    targetDoor = "D"
if (place_meeting(x, (y + 1), obj_doorE) || place_meeting(x, (y - 1), obj_doorE))
    targetDoor = "E"
