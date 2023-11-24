function cutscene_customer_check(argument0, argument1, argument2) //cutscene_customer_check
{
    with (obj_gnome_checklist)
        gnome_check[argument0] = 1
    global.pizzasdelivered++
    if instance_exists(obj_gnomecustomerblock)
        instance_destroy(obj_gnomecustomerblock)
    with (instance_create(argument1.x, argument1.y, obj_pizzaboxunopen))
    {
        content = argument2.content
        depth = argument1.depth
        visible = false
    }
    ds_list_add(global.saveroom, argument2.id)
    cutscene_end_action()
}

function cutscene_customer_end(argument0, argument1) //cutscene_customer_end
{
    with (obj_customeractor)
        happy = 1
    with (instance_create((argument0.x - 1000), argument0.y, obj_taxi_cutscene))
    {
        targetplayer = argument0
        depth = -127
        targetDoor = "E"
        targetRoom = argument1
    }
    cutscene_end_action()
}

