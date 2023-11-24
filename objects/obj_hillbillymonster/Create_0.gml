if (instance_number(obj_hillbillymonster) > 1)
    instance_destroy()
threshold_x = 300
threshold_y = 64
threshold_idle_x = 800
threshold_idle_y = 256
slide_threshold_x = 64
deccel = 0.5
accel = 1
dir = 0
hsp = 0
vsp = 0
grav = 0.5
movespeed = 8
state = (99 << 0)
idlespr = spr_hillbilly_idle
chasespr = spr_hillbilly_chase
chasespr_idle = spr_hillbilly_idle
skidspr = spr_hillbilly_chase
event_inherited()
monsterid = 3
