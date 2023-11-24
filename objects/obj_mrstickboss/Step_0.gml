targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : 102)
if (hp <= 0 && state != (118 << 0))
{
    if ((!destroyed) && (!thrown) && (!destroyable))
        self.boss_destroy(lastplayerid)
}
switch state
{
    case (118 << 0):
        grav = 0.5
        state_boss_arenaround()
        break
    case (0 << 0):
        grav = 0.5
        boss_mrstick_normal()
        break
    case (146 << 0):
        grav = 0.5
        boss_mrstick_shield()
        break
    case (147 << 0):
        grav = 0.5
        boss_mrstick_helicopterhat()
        break
    case (148 << 0):
        grav = 0.5
        boss_mrstick_panicjump()
        break
    case (68 << 0):
        grav = 0.5
        boss_mrstick_jump()
        break
    case (149 << 0):
        grav = 0.5
        boss_mrstick_smokebombstart()
        break
    case (150 << 0):
        grav = 0.5
        boss_mrstick_smokebombcrawl()
        break
    case (151 << 0):
        grav = 0.5
        boss_mrstick_springshoes()
        break
    case (152 << 0):
        grav = 0.5
        boss_mrstick_cardboard()
        break
    case (153 << 0):
        grav = 0.5
        boss_mrstick_cardboardend()
        break
    case (154 << 0):
        grav = 0.5
        boss_mrstick_mockery()
        break
    case (107 << 0):
        grav = 0.5
        state_boss_walk(boss_mrstick_decide_attack)
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

colliding = (!((state == (68 << 0) || state == (152 << 0) || state == (153 << 0))))
attacking = (state == (146 << 0) || state == (68 << 0) || state == (152 << 0) || state == (153 << 0) || state == (149 << 0))
