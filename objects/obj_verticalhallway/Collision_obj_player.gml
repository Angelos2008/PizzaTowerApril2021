with (other)
{
    x = (other.x + (other.sprite_width / 2))
    y = (other.y + (other.sprite_height - 46))
    if (!instance_exists(obj_fadeout))
    {
        obj_player1.lastroom = room
        obj_player2.lastroom = room
        obj_player1.targetDoor = other.targetDoor
        obj_player1.targetRoom = other.targetRoom
        obj_player1.verticalhallway = 1
        obj_player2.verticalhallway = 1
        obj_player1.vhallwaydirection = other.image_yscale
        obj_player2.vhallwaydirection = other.image_yscale
        if instance_exists(obj_player2)
        {
            obj_player2.targetDoor = other.targetDoor
            obj_player2.targetRoom = other.targetRoom
        }
        other.visited = 1
        scr_soundeffect(sfx_door)
        instance_create(x, y, obj_fadeout)
    }
}
