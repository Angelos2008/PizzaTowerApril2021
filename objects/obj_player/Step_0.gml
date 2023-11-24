switch state
{
    case (0 << 0):
        scr_player_normal()
        break
    case (1 << 0):
        scr_player_revolver()
        break
    case (2 << 0):
        scr_player_dynamite()
        break
    case (3 << 0):
        scr_player_boots()
        break
    case (4 << 0):
        scr_player_grabbed()
        break
    case (6 << 0):
        scr_player_finishingblow()
        break
    case (5 << 0):
        scr_player_tumble()
        break
    case (14 << 0):
        scr_player_titlescreen()
        break
    case (7 << 0):
        scr_player_ejected()
        break
    case (10 << 0):
        scr_player_firemouth()
        break
    case (9 << 0):
        scr_player_fireass()
        break
    case (8 << 0):
        scr_player_transitioncutscene()
        break
    case (15 << 0):
        scr_playerN_hookshot()
        break
    case (18 << 0):
        scr_player_slap()
        break
    case (16 << 0):
        scr_player_tacklecharge()
        break
    case (19 << 0):
        scr_player_cheesepep()
        break
    case (17 << 0):
        scr_player_cheeseball()
        break
    case (21 << 0):
        scr_player_cheesepepstickside()
        break
    case (22 << 0):
        scr_player_cheesepepstickup()
        break
    case (24 << 0):
        scr_player_boxxedpep()
        break
    case (25 << 0):
        scr_player_pistolaim()
        break
    case (26 << 0):
        scr_player_climbwall()
        break
    case (27 << 0):
        scr_player_knightpepslopes()
        break
    case (28 << 0):
        scr_player_portal()
        break
    case (29 << 0):
        scr_player_secondjump()
        break
    case (30 << 0):
        scr_player_chainsawbump()
        break
    case (31 << 0):
        scr_player_handstandjump()
        break
    case (125 << 0):
        scr_player_shoulderbash()
        break
    case (32 << 0):
        scr_player_gottreasure()
        break
    case (33 << 0):
        scr_player_knightpep()
        break
    case (34 << 0):
        scr_player_knightpepattack()
        break
    case (35 << 0):
        scr_player_meteorpep()
        break
    case (36 << 0):
        scr_player_bombpep()
        break
    case (37 << 0):
        scr_player_grabbing()
        break
    case (38 << 0):
        scr_player_chainsawpogo()
        break
    case (39 << 0):
        scr_player_shotgunjump()
        break
    case (41 << 0):
        scr_player_stunned()
        break
    case (42 << 0):
        scr_player_highjump()
        break
    case (43 << 0):
        scr_player_chainsaw()
        break
    case (110 << 0):
        scr_player_hit()
        break
    case (128 << 0):
        scr_player_thrown()
        break
    case (44 << 0):
        scr_player_facestomp()
        break
    case (46 << 0):
        scr_player_timesup()
        break
    case (47 << 0):
        scr_player_machroll()
        break
    case (49 << 0):
        scr_player_pistol()
        break
    case (48 << 0):
        scr_player_shotgun()
        break
    case (50 << 0):
        scr_player_machfreefall()
        break
    case (51 << 0):
        scr_player_throwing()
        break
    case (53 << 0):
        scr_player_superslam()
        break
    case (52 << 0):
        scr_player_slam()
        break
    case (54 << 0):
        scr_player_skateboard()
        break
    case (55 << 0):
        scr_player_grind()
        break
    case (56 << 0):
        scr_player_grab()
        break
    case (57 << 0):
        scr_player_punch()
        break
    case (58 << 0):
        scr_player_backkick()
        break
    case (59 << 0):
        scr_player_uppunch()
        break
    case (60 << 0):
        scr_player_shoulder()
        break
    case (61 << 0):
        scr_player_backbreaker()
        break
    case (62 << 0):
        scr_player_bossdefeat()
        break
    case (64 << 0):
        scr_player_bossintro()
        break
    case (72 << 0):
        scr_player_smirk()
        break
    case (63 << 0):
        scr_player_pizzathrow()
        break
    case (65 << 0):
        scr_player_gameover()
        break
    case (96 << 0):
        scr_player_Sjumpland()
        break
    case (95 << 0):
        scr_player_freefallprep()
        break
    case (93 << 0):
        scr_player_runonball()
        break
    case (91 << 0):
        scr_player_boulder()
        break
    case (66 << 0):
        scr_player_keyget()
        break
    case (67 << 0):
        scr_player_tackle()
        break
    case (70 << 0):
        scr_player_slipnslide()
        break
    case (69 << 0):
        scr_player_ladder()
        break
    case (68 << 0):
        scr_player_jump()
        break
    case (74 << 0):
        scr_player_victory()
        break
    case (71 << 0):
        scr_player_comingoutdoor()
        break
    case (73 << 0):
        scr_player_Sjump()
        break
    case (75 << 0):
        scr_player_Sjumpprep()
        break
    case (76 << 0):
        scr_player_crouch()
        break
    case (77 << 0):
        scr_player_crouchjump()
        break
    case (78 << 0):
        scr_player_crouchslide()
        break
    case (79 << 0):
        scr_player_mach1()
        break
    case (80 << 0):
        scr_player_mach2()
        break
    case (94 << 0):
        scr_player_mach3()
        break
    case (81 << 0):
        scr_player_machslide()
        break
    case (82 << 0):
        scr_player_bump()
        break
    case (83 << 0):
        scr_player_hurt()
        break
    case (84 << 0):
        scr_player_freefall()
        break
    case (87 << 0):
        scr_player_freefallland()
        break
    case (85 << 0):
        scr_player_hang()
        break
    case (88 << 0):
        scr_player_door()
        break
    case (89 << 0):
        scr_player_barrel()
        break
    case (90 << 0):
        scr_player_current()
        break
    case (92 << 0):
        scr_player_taxi()
        break
    case (124 << 0):
        scr_player_taxi()
        break
    case (40 << 0):
        scr_player_pogo()
        break
    case (23 << 0):
        scr_player_rideweenie()
        break
    case (97 << 0):
        scr_player_faceplant()
        break
    case (13 << 0):
        scr_player_ghost()
        break
    case (11 << 0):
        scr_player_mort()
        break
    case (12 << 0):
        scr_player_hook()
        break
    case (117 << 0):
        scr_player_arenaintro()
        break
    case (119 << 0):
        scr_player_actor()
        break
    case (120 << 0):
        scr_player_parry()
        break
    case (121 << 0):
        scr_player_golf()
        break
    case (123 << 0):
        scr_player_tube()
        break
    case (126 << 0):
        scr_player_pummel()
        break
    case (137 << 0):
        scr_player_slipbanan()
        break
    case (155 << 0):
        scr_player_bombdelete()
        break
    case (156 << 0):
        scr_player_rocket()
        break
    case (157 << 0):
        scr_player_gotoplayer()
        break
    case (158 << 0):
        scr_player_trickjump()
        break
}

if (state != (56 << 0))
    grabbingenemy = 0
if (state != (80 << 0) && state != (94 << 0) && state != (158 << 0))
{
    ramp = 0
    ramp_points = 0
}
if (state != (88 << 0) && place_meeting(x, y, obj_boxofpizza))
    state = (76 << 0)
if (shoot_buffer > 0)
    shoot_buffer--
if (cheesepep_buffer > 0)
    cheesepep_buffer--
if (state != (21 << 0))
    yscale = 1
if (invhurt_buffer > 0)
    invhurt_buffer--
if (state == (83 << 0))
{
    if (hurt_buffer > 0)
        hurt_buffer--
    else
    {
        invhurt_buffer = invhurt_max
        hurt_buffer = -1
    }
}
else
{
    if (hurt_buffer > 0)
        invhurt_buffer = invhurt_max
    hurt_buffer = -1
}
if (room == Realtitlescreen && instance_exists(obj_mainmenuselect))
    state = (14 << 0)
if (wallclingcooldown < 10)
    wallclingcooldown++
if ((!instance_exists(superchargedeffectid)) && supercharged)
{
    with (instance_create(x, y, obj_superchargeeffect))
    {
        playerid = other.id
        other.superchargedeffectid = id
    }
}
if (state != (73 << 0))
    sjumpvsp = -12
if (state != (84 << 0))
    freefallvsp = 15
if (supercharge == 4 && state != (61 << 0))
    supercharged = 1
if ((!instance_exists(pizzashieldid)) && pizzashield == 1)
{
    with (instance_create(x, y, obj_pizzashield))
    {
        playerid = other.object_index
        other.pizzashieldid = id
    }
}
if (visible == false && state == (71 << 0))
{
    coopdelay++
    image_index = 0
    if (coopdelay == 50)
    {
        visible = true
        coopdelay = 0
    }
}
if (global.coop == 1)
{
    if ((state == (57 << 0) || state == (31 << 0)) && (!((obj_player2.state == (57 << 0) || obj_player2.state == (31 << 0)))))
        fightballadvantage = 1
    else if (!((obj_player2.state == (57 << 0) || obj_player2.state == (31 << 0))))
        fightballadvantage = 0
}
if (state != (40 << 0) && state != (61 << 0))
{
    pogospeed = 6
    pogospeedprev = 0
}
scr_playersounds()
if grounded
    doublejump = 0
if (pogochargeactive == 1)
{
    if (flashflicker == 0)
    {
        if (pogochargeactive == 1 && sprite_index == spr_playerN_pogofall)
            sprite_index = spr_playerN_pogofallmach
        if (pogochargeactive == 1 && sprite_index == spr_playerN_pogobounce)
            sprite_index = spr_playerN_pogobouncemach
    }
    flashflicker = 1
    pogocharge--
}
else
    flashflicker = 0
if (state != (51 << 0))
    kickbomb = 0
if (pogocharge == 0)
{
    pogochargeactive = 0
    pogocharge = 100
}
if (flashflicker == 1)
{
    flashflickertime++
    if (flashflickertime == 20)
    {
        flash = 1
        flashflickertime = 0
    }
}
if (state != (94 << 0) && state != (4 << 0))
    fightball = 0
if (state != (4 << 0) && state != (83 << 0))
    thrown = 0
if (grounded && state != (37 << 0))
    suplexmove = 0
if (state != (84 << 0) && (state != (43 << 0) || tauntstoredstate != (84 << 0)))
    freefallsmash = 0
if (global.playerhealth <= 0 && state != (65 << 0))
{
    image_index = 0
    sprite_index = spr_playerV_dead
    state = (65 << 0)
}
if (state == (65 << 0) && y > (room_height * 2))
{
    room = rm_levelselect
    scr_playerreset()
    if (global.coop == 1)
    {
        with (obj_player2)
        {
            scr_playerreset()
            targetDoor = "A"
        }
    }
}
if (state != (49 << 0) && state != (0 << 0))
    shoot = 0
if (mort == 1)
{
    if (state != (0 << 0) && state != (68 << 0) && state != (31 << 0) && state != (49 << 0))
        mort = 0
}
if (baddiegrabbedID == 298 && (state == (56 << 0) || state == (53 << 0) || state == (16 << 0)))
    state = (0 << 0)
if (!((state == (56 << 0) || state == (53 << 0) || state == (80 << 0))))
{
    baddiegrabbedID = 298
    heavy = 0
}
if (cutscene == 1 && state != (157 << 0))
    global.heattime = 60
if (anger == 0)
    angry = 0
if (anger > 0)
{
    angry = 1
    anger -= 1
}
if (sprite_index == spr_winding && state != (0 << 0))
    windingAnim = 0
if (state != (56 << 0))
    swingdingbuffer = 0
if (state != (37 << 0) && state != (89 << 0) && state != (5 << 0) && state != (13 << 0) && sprite_index != spr_player_mortjump)
    grav = 0.5
else if (state == (89 << 0) || state == (5 << 0))
    grav = 0.6
if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
    instance_create((x + random_range(-5, obj_tubeleft)), (y + 46), obj_vomit)
if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
    with (instance_create((x + random_range(-5, obj_tubeleft)), (y + 46), obj_vomit))
        sprite_index = spr_vomit2
}
if (global.stylethreshold >= 2 && (!instance_exists(angryeffectid)) && state == (0 << 0) && character != "V")
{
    with (instance_create(x, y, obj_angrycloud))
    {
        playerid = other.object_index
        other.angryeffectid = id
    }
}
if (object_index == obj_player1)
{
    if (global.combotime > 0)
        global.combotime -= 0.5
    if (global.heattime > 0)
        global.heattime -= 0.25
    if (global.combotime <= 0 && global.combo != 0)
    {
        global.combotime = 0
        global.combo = 0
        supercharge = 0
    }
    if (global.heattime <= 0 && global.style > -1 && global.stylelock == 0)
        global.style -= 0.05
}
if (input_buffer_jump < 8)
    input_buffer_jump++
if (input_buffer_secondjump < 8)
    input_buffer_secondjump++
if (input_buffer_highjump < 8)
    input_buffer_highjump++
if (key_particles == 1)
    create_particle((x + random_range(-25, 25)), (y + random_range(-35, 25)), (10 << 0), 0)
if (inv_frames == 0 && hurted == 0 && state != (13 << 0))
    image_alpha = 1
if (state == (78 << 0) || state == (57 << 0) || state == (80 << 0) || (state == (68 << 0) && sprite_index == spr_playerN_noisebombspinjump) || state == (16 << 0) || state == (54 << 0) || state == (33 << 0) || state == (24 << 0) || state == (19 << 0) || state == (27 << 0) || state == (34 << 0) || state == (36 << 0) || state == (44 << 0) || state == (50 << 0) || state == (44 << 0) || state == (47 << 0) || state == (94 << 0) || state == (84 << 0) || state == (73 << 0))
    attacking = 1
else
    attacking = 0
if (state == (51 << 0) || state == (58 << 0) || state == (60 << 0) || state == (59 << 0))
    grabbing = 1
else
    grabbing = 0
if ((state == (56 << 0) && sprite_index == spr_swingding) || state == (73 << 0) || state == (89 << 0) || state == (156 << 0) || state == (30 << 0) || state == (57 << 0) || state == (78 << 0) || state == (97 << 0) || state == (23 << 0) || state == (94 << 0) || (state == (68 << 0) && sprite_index == spr_playerN_noisebombspinjump) || state == (70 << 0) || (state == (83 << 0) && thrown == 1) || state == (80 << 0) || state == (26 << 0) || state == (84 << 0) || state == (5 << 0) || state == (9 << 0) || state == (10 << 0) || state == (15 << 0) || state == (54 << 0) || state == (45 << 0) || state == (73 << 0) || state == (47 << 0) || state == (50 << 0) || state == (16 << 0) || (state == (53 << 0) && sprite_index == spr_piledriver) || state == (33 << 0) || state == (34 << 0) || state == (27 << 0) || state == (24 << 0) || state == (19 << 0) || state == (17 << 0) || state == (137 << 0) || state == (125 << 0))
    instakillmove = 1
else
    instakillmove = 0
if (flash == 1 && alarm[0] <= 0)
    alarm[0] = (0.15 * room_speed)
if (state != (94 << 0) && state != (81 << 0))
    autodash = 0
if ((state != (68 << 0) && state != (77 << 0) && state != (18 << 0)) || vsp < 0)
    fallinganimation = 0
if (state != (87 << 0) && state != (0 << 0) && state != (81 << 0) && state != (68 << 0))
    facehurt = 0
if (state != (0 << 0) && state != (81 << 0))
    machslideAnim = 0
if (state != (0 << 0))
{
    idle = 0
    dashdust = 0
}
if (state != (79 << 0) && state != (68 << 0) && state != (15 << 0) && state != (31 << 0) && state != (0 << 0) && state != (80 << 0) && state != (94 << 0) && state != (95 << 0) && state != (33 << 0) && state != (48 << 0) && state != (27 << 0))
    momemtum = 0
if (state != (73 << 0) && state != (75 << 0))
    a = 0
if (state != (44 << 0))
    facestompAnim = 0
if (state != (84 << 0) && state != (44 << 0) && state != (53 << 0) && state != (87 << 0))
    superslam = 0
if (state != (80 << 0))
    machpunchAnim = 0
if (state != (68 << 0))
    ladderbuffer = 0
if (state != (68 << 0))
    stompAnim = 0
if ((state == (94 << 0) || (state == (4 << 0) && instance_exists(obj_player2) && obj_player2.state == (94 << 0)) || pizzapepper > 0 || sprite_index == spr_freefall || sprite_index == spr_superjump || state == (37 << 0) || state == (30 << 0) || state == (80 << 0) || (state == (68 << 0) && sprite_index == spr_playerN_noisebombspinjump) || pogochargeactive == 1 || state == (26 << 0) || state == (15 << 0) || state == (47 << 0) || state == (81 << 0)) && macheffect == 0)
{
    macheffect = 1
    toomuchalarm1 = 6
    with (create_mach3effect(x, y, sprite_index, (image_index - 1)))
    {
        playerid = other.object_index
        image_xscale = other.xscale
    }
}
if (!((state == (94 << 0) || (state == (4 << 0) && instance_exists(obj_player2) && obj_player2.state == (94 << 0)) || pizzapepper > 0 || sprite_index == spr_freefall || sprite_index == spr_superjump || state == (37 << 0) || state == (30 << 0) || state == (80 << 0) || (state == (68 << 0) && sprite_index == spr_playerN_noisebombspinjump) || pogochargeactive == 1 || state == (26 << 0) || state == (15 << 0) || state == (47 << 0) || state == (81 << 0))))
    macheffect = 0
if (toomuchalarm1 > 0)
{
    toomuchalarm1 -= 1
    if (toomuchalarm1 <= 0 && (state == (94 << 0) || (state == (4 << 0) && instance_exists(obj_player2) && obj_player2.state == (94 << 0)) || pizzapepper > 0 || sprite_index == spr_freefall || sprite_index == spr_superjump || state == (37 << 0) || state == (30 << 0) || state == (26 << 0) || (state == (68 << 0) && sprite_index == spr_playerN_noisebombspinjump) || pogochargeactive == 1 || state == (15 << 0) || state == (80 << 0) || state == (81 << 0) || state == (47 << 0) || (state == (43 << 0) && mach2 >= 100)))
    {
        with (create_mach3effect(x, y, sprite_index, (image_index - 1)))
        {
            playerid = other.object_index
            image_xscale = other.xscale
        }
        toomuchalarm1 = 6
    }
}
if (y > (room_height + 200) && room != custom_lvl_room && state != (65 << 0) && state != (157 << 0))
{
    x = roomstartx
    y = roomstarty
    if (skateboarding == 0)
        state = (84 << 0)
    vsp = 10
}
if (character == "S")
{
    if (state == (77 << 0) || state == (76 << 0))
        state = (0 << 0)
}
if (character != "M")
{
    if (!(place_meeting(x, y, obj_solid)))
    {
        if (state != (13 << 0) && (!((state == (82 << 0) && sprite_index == spr_tumbleend))) && state != (89 << 0) && sprite_index != spr_player_breakdancesuper && sprite_index != spr_player_barrelslipnslide && sprite_index != spr_player_barrelroll && sprite_index != spr_bombpepintro && sprite_index != spr_knightpepthunder && state != (5 << 0) && state != (41 << 0) && state != (76 << 0) && state != (24 << 0) && state != (49 << 0) && sprite_index != spr_player_crouchshoot && state != (75 << 0) && state != (78 << 0) && state != (43 << 0) && state != (47 << 0) && state != (83 << 0) && state != (77 << 0) && state != (22 << 0) && state != (21 << 0))
            mask_index = spr_player_mask
        else
            mask_index = spr_crouchmask
    }
    else if place_meeting(x, y, obj_solid)
        mask_index = spr_crouchmask
}
else
    mask_index = spr_pepperman_mask
if (character == "S" && state == (36 << 0))
    mask_index = spr_player_mask
else if (character == "S")
    mask_index = spr_crouchmask
if (state == (32 << 0) || sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder || state == (66 << 0) || state == (43 << 0) || state == (88 << 0) || state == (7 << 0) || state == (74 << 0) || state == (71 << 0) || state == (65 << 0) || state == (157 << 0) || state == (124 << 0) || state == (119 << 0))
    cutscene = 1
else
    cutscene = 0
if (((place_meeting(x, y, obj_door) && (!(place_meeting(x, y, obj_doorblocked)))) || place_meeting(x, y, obj_taxi) || place_meeting(x, y, obj_dresser) || place_meeting(x, y, obj_snick) || place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_filedoor) || place_meeting(x, y, obj_optiondoor) || (place_meeting(x, y, obj_exitgate) && global.panic == 1)) && (!instance_exists(obj_uparrow)) && scr_solid(x, (y + 1)) && state == (0 << 0) && obj_player1.spotlight == 1)
{
    with (instance_create(x, y, obj_uparrow))
        playerid = other.object_index
}
if (state == (80 << 0) && (!instance_exists(speedlineseffectid)))
{
    with (instance_create(x, y, obj_speedlines))
    {
        playerid = other.object_index
        other.speedlineseffectid = id
    }
}
scr_collide_destructibles()
if (state != (157 << 0) && state != (14 << 0) && state != (123 << 0) && state != (4 << 0) && state != (88 << 0) && state != (73 << 0) && state != (7 << 0) && state != (71 << 0) && state != (91 << 0) && state != (66 << 0) && state != (74 << 0) && state != (28 << 0) && state != (46 << 0) && state != (32 << 0) && state != (65 << 0))
    scr_collide_player()
if (state == (123 << 0) || state == (157 << 0))
{
    x += hsp
    y += vsp
}
if (state == (91 << 0))
    scr_collide_player()
