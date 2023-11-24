targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : 102)
if (obj_bosscontroller.state == (117 << 0))
{
}
if (hp <= 0 && state != (118 << 0) && state != (134 << 0))
{
    if ((!thrown) && (!destroyable))
        self.boss_destroy(lastplayerid)
}
if (chooseparry_buffer > 0)
    chooseparry_buffer--
switch phase
{
    case 1:
    case 2:
        normal_func = boss_pepperman_normal
        break
    case 3:
    case 4:
    case 5:
    case 6:
        normal_func = boss_pepperman_phase3normal
        break
}

switch state
{
    case (118 << 0):
        grav = 0.5
        state_boss_arenaround()
        break
    case (0 << 0):
        grav = 0.5
        self.normal_func()
        break
    case (68 << 0):
        grav = 0.5
        boss_pepperman_jump()
        invincible = 1
        inv_timer = 2
        break
    case (84 << 0):
        grav = 0.5
        boss_pepperman_freefall()
        break
    case (87 << 0):
        grav = 0.5
        boss_pepperman_freefallland()
        break
    case (95 << 0):
        grav = 0.5
        boss_pepperman_freefallprep()
        break
    case (125 << 0):
        grav = 0.5
        boss_pepperman_shoulderbash()
        break
    case (129 << 0):
        grav = 0.5
        boss_pepperman_supershoulderbash()
        break
    case (130 << 0):
        grav = 0.5
        boss_pepperman_superattackstart()
        break
    case (131 << 0):
        grav = 0.5
        boss_pepperman_superattackcharge()
        break
    case (53 << 0):
        grav = 0.5
        boss_pepperman_superslam()
        break
    case (134 << 0):
        grav = 0.5
        boss_pepperman_fistmatch()
        break
    case (135 << 0):
        grav = 0.5
        boss_pepperman_fistmatchend()
        break
    case (60 << 0):
        grav = 0.5
        boss_pepperman_shoulder()
        break
    case (133 << 0):
        grav = 0.5
        boss_pepperman_shoulderturn()
        break
    case (107 << 0):
        grav = 0.5
        state_boss_walk(boss_pepperman_decide_attack)
        invincible = 1
        inv_timer = 2
        break
    case (101 << 0):
        grav = 0.5
        boss_pepperman_charge()
        invincible = 1
        inv_timer = 2
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

xscale = image_xscale
colliding = (!((state == (53 << 0) || state == (134 << 0) || state == (130 << 0) || state == (131 << 0))))
attacking = (state == (125 << 0) || state == (84 << 0) || state == (95 << 0) || state == (129 << 0) || state == (60 << 0) || state == (53 << 0) || state == (134 << 0) || state == (130 << 0) || state == (131 << 0) || state == (107 << 0))
