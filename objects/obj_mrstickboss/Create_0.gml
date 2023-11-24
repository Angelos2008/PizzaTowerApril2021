event_inherited()
boss_array[0] = -4
boss_array[1] = [264, 1]
boss_array[2] = [41, 1]
boss_array[3] = [30, 1]
boss_array[4] = [264, 6]
boss_array[5] = [41, 6]
boss_array[6] = [30, 6]
state = (118 << 0)
attack_pool = [(146 << 0), (147 << 0), (148 << 0), (68 << 0), (149 << 0), (151 << 0), (152 << 0)]
ds_map_set(player_hurtstates, (31 << 0), 30)
ds_map_set(player_hurtstates, (30 << 0), 50)
ds_map_set(player_hurtstates, (80 << 0), 20)
ds_map_set(player_hurtstates, (94 << 0), 30)
ds_map_set(boss_hurtstates, (146 << 0), 80)
phase = 1
max_phase = 7
max_hp = (500 * max_phase)
hp = max_hp
stunfallspr = spr_mrstick_hurt
walkspr = spr_mrstick_idle
idlespr = spr_mrstick_idle
spr_dead = spr_mrstick_hurt
fallspr = spr_mrstick_fall
bumpspr = spr_mrstick_hurt
defeatplayerspr = spr_mrstick_idle
movespeed = 0
move = 0
normal_spd = 6
helicopterspeed = 6
panicjumpspeed = 12
shield_buffer = 0
shield_max = 180
cardboard_buffer = 0
cardboard_max = 180
do_mockery_max = 300
do_mockery_buffer = do_mockery_max
mockery_buffer = 0
mockery_max = 360
helicopterstate = 0
helicoptery = y
warped = 0
attack_max[0] = 40
attack_max[1] = 40
attack_max[2] = 40
attack_max[3] = 40
attack_max[4] = 40
attack_max[5] = 40
attack_max[6] = 40
attack_cooldown = attack_max[0]
dashcloudid = -4
targetstunned = 0
targetstunnedminus[0] = 80
targetstunnedminus[1] = 150
targetstunnedminus[2] = 200
targetstunnedminus[3] = 200
targetstunnedminus[4] = 200
targetstunnedminus[5] = 200
targetstunnedminus[6] = 200
function player_hurt(argument0) //boss_destroy_gml_Object_obj_mrstickboss_Create_0
{
    self.SUPER_boss_destroy(argument0)
    targetstunned = 1000
    stunned = 1000
}

function player_hurt(argument0, argument1) //boss_hurt_gml_Object_obj_mrstickboss_Create_0
{
    if (targetstunned > 0)
    {
        targetstunned -= targetstunnedminus[(phase - 1)]
        attack_cooldown = 0
        if (targetstunned < 0)
            targetstunned = 1
    }
    else
        targetstunned = 150
    self.SUPER_boss_hurt(argument0, argument1)
    targetxscale = (-argument1.xscale)
}

function player_hurt(argument0) //boss_hurt_noplayer_gml_Object_obj_mrstickboss_Create_0
{
    if (targetstunned > 0)
    {
        targetstunned -= targetstunnedminus[(phase - 1)]
        attack_cooldown = 0
        if (targetstunned < 0)
            targetstunned = 1
    }
    else
        targetstunned = 150
    self.SUPER_boss_hurt_noplayer(argument0)
}

function player_hurt(argument0, argument1) //player_hurt_gml_Object_obj_mrstickboss_Create_0
{
    if ((!argument1.inv_frames) && (argument1.state != (61 << 0) || argument1.parry_inst == -4))
    {
        hitstate = state
        hithsp = hsp
        hitvsp = vsp
        self.SUPER_player_hurt(argument0, argument1)
        with (argument1)
        {
            inv_frames = 1
            alarm[1] = 15
        }
    }
}

