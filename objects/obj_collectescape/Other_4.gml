if (room == rm_editor)
    return;
if (global.timeattack == 1)
    instance_destroy()
if (ds_list_find_index(global.saveroom, id) != -1)
    instance_destroy()
if (global.panic == 0)
{
    instance_deactivate_object(id)
    visible = true
}
if (global.snickchallenge == 1)
    instance_destroy()
