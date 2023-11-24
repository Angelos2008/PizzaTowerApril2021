targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : 102)
if (hp <= 0 && state != (118 << 0))
{
    if ((!destroyed) && (!thrown) && (!destroyable))
        self.boss_destroy(lastplayerid)
}
if (chooseparry_buffer > 0)
    chooseparry_buffer--
if ((state == (31 << 0) || state == (78 << 0) || state == (139 << 0) || state == (143 << 0) || state == (145 << 0) || (state == (40 << 0) && pogochargeactive) || state == (54 << 0)) && alarm[0] <= 0)
    alarm[0] = 6
switch state
{
    case (118 << 0):
        grav = 0.5
        state_boss_arenaround()
        movespeed = 0
        inv_timer = 2
        invincible = 1
        break
    case (0 << 0):
        grav = 0.5
        boss_noise_normal()
        break
    case (82 << 0):
        grav = 0.5
        state_boss_bump()
        break
    case (31 << 0):
        grav = 0.5
        boss_noise_handstandjump()
        break
    case (78 << 0):
        grav = 0.5
        boss_noise_crouchslide()
        break
    case (54 << 0):
        grav = 0.5
        boss_noise_skateboard()
        break
    case (139 << 0):
        grav = 0.5
        boss_noise_skateboardturn()
        break
    case (68 << 0):
        grav = 0.5
        boss_noise_jump()
        break
    case (51 << 0):
        grav = 0.5
        boss_noise_throwing()
        break
    case (40 << 0):
        grav = 0.5
        boss_noise_pogo()
        break
    case (142 << 0):
        grav = 0.5
        boss_noise_jetpackstart()
        break
    case (143 << 0):
        grav = 0.5
        boss_noise_jetpack()
        break
    case (145 << 0):
        grav = 0.5
        boss_noise_jetpackspin()
        break
    case (107 << 0):
        grav = 0.5
        state_boss_walk(boss_noise_do_attack)
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

angry = phase > 6
attacking = (state == (31 << 0) || state == (78 << 0) || state == (54 << 0) || state == (139 << 0) || state == (40 << 0) || state == (142 << 0) || state == (143 << 0) || state == (145 << 0) || state == (51 << 0))
