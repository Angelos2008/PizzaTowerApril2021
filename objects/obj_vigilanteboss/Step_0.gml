targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : 102)
if (hp <= 0 && state != (118 << 0) && state != (134 << 0))
{
    if ((!thrown) && (!destroyable))
        self.boss_destroy(lastplayerid)
}
if ((state == (79 << 0) || state == (81 << 0) || state == (78 << 0) || state == (59 << 0) || state == (57 << 0) || state == (138 << 0) || state == (31 << 0)) && alarm[0] <= 0)
    alarm[0] = 6
if (chooseparry_buffer > 0)
    chooseparry_buffer--
if (important && honor && nexthonor && phase > 3 && state != (132 << 0))
{
    var ch = 0
    with (obj_player)
    {
        if (state == (30 << 0))
            ch = 1
    }
    if (instance_exists(obj_shotgunbullet) || ch)
    {
        nexthonor = 0
        with (obj_tv)
        {
            showtext = 1
            message = "NO HONOR"
            alarm[0] = 200
        }
    }
}
switch phase
{
    case 4:
    case 5:
    case 6:
        normal_func = boss_vigilante_normal_phase4
        break
    default:
        normal_func = boss_vigilante_normal
}

switch state
{
    case (118 << 0):
        grav = 0.5
        state_boss_arenaround()
        honor = nexthonor
        break
    case (0 << 0):
        grav = 0.5
        self.normal_func()
        break
    case (122 << 0):
        grav = 0.5
        boss_vigilante_float()
        break
    case (1 << 0):
        grav = 0.5
        boss_vigilante_revolver()
        break
    case (79 << 0):
        grav = 0.5
        boss_vigilante_mach1()
        break
    case (78 << 0):
        grav = 0.5
        boss_vigilante_crouchslide()
        break
    case (81 << 0):
        grav = 0.5
        boss_vigilante_machslide()
        break
    case (82 << 0):
        grav = 0.5
        state_boss_bump()
        break
    case (68 << 0):
        grav = 0.5
        boss_vigilante_jump()
        break
    case (2 << 0):
        grav = 0.5
        boss_vigilante_dynamite()
        break
    case (101 << 0):
        grav = 0.5
        boss_vigilante_charge()
        break
    case (57 << 0):
        grav = 0.5
        boss_vigilante_punch()
        break
    case (136 << 0):
        grav = 0.5
        boss_vigilante_groundpunchstart()
        break
    case (95 << 0):
        grav = 0.5
        boss_vigilante_freefallprep()
        break
    case (84 << 0):
        grav = 0.5
        boss_vigilante_freefall()
        break
    case (87 << 0):
        grav = 0.5
        boss_vigilante_freefallland()
        break
    case (138 << 0):
        grav = 0.5
        boss_vigilante_millionpunch()
        break
    case (59 << 0):
        grav = 0.5
        boss_vigilante_uppunch()
        break
    case (31 << 0):
        grav = 0.5
        boss_vigilante_handstandjump()
        break
    case (130 << 0):
        grav = 0.5
        boss_vigilante_superattackstart()
        break
    case (132 << 0):
        grav = 0.5
        boss_vigilante_superattack()
        break
    case (107 << 0):
        grav = 0.5
        state_boss_walk(boss_vigilante_decide_attack)
        inv_timer = 2
        invincible = 1
        break
    case (43 << 0):
        grav = 0.5
        state_boss_chainsaw()
        break
    case (61 << 0):
        grav = 0.5
        state_boss_taunt()
        invincible = 1
        inv_timer = 2
        break
    case (120 << 0):
        grav = 0.5
        state_boss_parry()
        invincible = 1
        inv_timer = 2
        normalattack_cooldown = normalattack_max[(phase - 1)]
        break
    case (110 << 0):
        grav = 0.5
        scr_enemy_hit()
        stunned = targetstunned
        break
    case (111 << 0):
        grav = 0.5
        state_boss_stun()
        if (stunned < 0)
            vsp = 0
        break
}

if (hitstate == (132 << 0) || state == (132 << 0))
{
    with (lastplayerid)
    {
        if (state != (110 << 0) && state != (128 << 0))
        {
            if (sprite_index == spr_player_pistolshot && image_index > (image_number - 1))
                sprite_index = spr_player_pistolidle
            if (sprite_index != spr_player_pistolshot && sprite_index != spr_idle && other.state == (132 << 0) && other.duel_buffer > 0)
                sprite_index = spr_idle
        }
    }
}
attacking = (state == (1 << 0) || state == (79 << 0) || state == (101 << 0) || state == (57 << 0) || state == (136 << 0) || state == (138 << 0) || state == (84 << 0) || state == (59 << 0) || state == (31 << 0) || state == (132 << 0) || state == (130 << 0) || state == (78 << 0))
