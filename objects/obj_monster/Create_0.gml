fake = 0
monsterid = 0
targetRoom = room
targetDoor = "A"
can_touch = 0
touched = 0
depth = -7
if variable_global_exists("monster_targetRoom")
{
    targetRoom = global.monster_targetRoom
    targetDoor = global.monster_targetDoor
}
alarm[0] = 30
if (distance_to_object(instance_nearest(x, y, obj_player)) < 100)
    alarm[0] = 80
if place_meeting(x, y, obj_boxofpizza)
{
    var bx = instance_place(x, y, obj_boxofpizza)
    var ty = try_solid(0, bx.image_yscale, 92, (abs(bx.sprite_height) + abs(sprite_height)))
    if (ty != -1)
        y += (ty * bx.image_yscale)
}
