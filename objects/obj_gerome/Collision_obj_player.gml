if (global.panic == 1)
{
    ds_list_add(global.saveroom, id)
    global.gerome = 1
    global.stylelock = 1
    instance_create(x, y, obj_geromefollow)
    instance_destroy()
}
