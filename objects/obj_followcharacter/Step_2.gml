if (followid != noone && (!instance_exists(obj_player1)))
{
}
playerid = obj_player1.id
if (playerid.state != (69 << 0) && playerid.state != (88 << 0) && playerid.state != (71 << 0))
{
    if (space < maxspace && dir == -1)
        space += spaceaccel
    if (space > (-maxspace) && dir == 1)
        space -= spaceaccel
}
else
    space = Approach(space, 0, spaceaccel)
if (dir != playerid.xscale)
    dir = playerid.xscale
if (followid != noone && (!instance_exists(followid)))
    followid = noone
var tx = round((xoffset * space))
var xx = (followid == noone ? playerid.x : followid.x)
var yy = (followid == noone ? playerid.y : followid.y)
var msk = (followid == noone ? playerid.mask_index : followid.mask_index)
var ixs = (followid == noone ? playerid.xscale : followid.image_xscale)
ds_queue_enqueue(followqueue, (xx + tx))
ds_queue_enqueue(followqueue, yy)
ds_queue_enqueue(followqueue, msk)
ds_queue_enqueue(followqueue, ixs)
if (ds_queue_size(followqueue) > (LAG_STEPS * 2))
{
    x = ds_queue_dequeue(followqueue)
    y = ds_queue_dequeue(followqueue)
    mask_index = ds_queue_dequeue(followqueue)
    image_xscale = ds_queue_dequeue(followqueue)
}
