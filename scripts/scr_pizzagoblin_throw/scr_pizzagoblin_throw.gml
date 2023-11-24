function scr_pizzagoblin_throw() //scr_pizzagoblin_throw
{
    if (!variable_global_exists("throw_frame"))
    {
        global.throw_frame = 0
        global.throw_frame[219] = 2
        global.throw_frame[221] = 5
        global.throw_frame[220] = 18
        global.throw_frame[215] = 6
        global.throw_frame[233] = 2
        global.throw_frame[234] = 2
        global.throw_frame[235] = 2
        global.throw_frame[217] = 2
        global.throw_frame[218] = 8
        global.throw_frame[224] = 6
        global.throw_frame[228] = 0
        global.throw_frame[227] = 15
        global.throw_frame[226] = 3
        global.throw_frame[225] = 2
        global.throw_frame[65] = 6
        global.throw_frame[207] = 9
        global.throw_frame[208] = 9
        global.throw_frame[183] = 9
        global.throw_frame[66] = 13
        global.throw_frame[243] = 3
        global.throw_frame[80] = 11
        global.throw_sprite = spr_plug
        global.throw_sprite[219] = spr_pizzagoblin_throwbomb
        global.throw_sprite[221] = spr_canongoblin_throwbomb
        global.throw_sprite[220] = spr_archergoblin_shoot
        global.throw_sprite[215] = spr_cheeserobot_attack
        global.throw_sprite[233] = spr_spitcheese_spit
        global.throw_sprite[234] = spr_trash_throw
        global.throw_sprite[235] = spr_invtrash_throw
        global.throw_sprite[217] = spr_robot_attack
        global.throw_sprite[218] = spr_kentukykenny_throw
        global.throw_sprite[224] = spr_pizzard_shoot
        global.throw_sprite[228] = spr_pepgoblin_kick
        global.throw_sprite[227] = spr_swedishmonkey_eat
        global.throw_sprite[226] = spr_ranch_shoot
        global.throw_sprite[225] = spr_pickle_attack
        global.throw_sprite[65] = spr_tank_shoot
        global.throw_sprite[207] = spr_shrimp_knife
        global.throw_sprite[208] = spr_shrimp_knife
        global.throw_sprite[183] = spr_shrimp_knife
        global.throw_sprite[66] = spr_pizzaslug_cough
        global.throw_sprite[243] = spr_ufolive_shoot
        global.throw_sprite[80] = spr_ufogrounded_shoot
        global.reset_timer = 0
        global.reset_timer[219] = (200 / (global.stylethreshold + 1))
        global.reset_timer[221] = (200 / (global.stylethreshold + 1))
        global.reset_timer[220] = (200 / (global.stylethreshold + 1))
        global.reset_timer[215] = (200 / (global.stylethreshold + 1))
        global.reset_timer[233] = (100 / (global.stylethreshold + 1))
        global.reset_timer[234] = 100
        global.reset_timer[235] = (100 / (global.stylethreshold + 1))
        global.reset_timer[217] = (200 / (global.stylethreshold + 1))
        global.reset_timer[218] = (200 / (global.stylethreshold + 1))
        global.reset_timer[224] = (100 / (global.stylethreshold + 1))
        global.reset_timer[228] = (200 / (global.stylethreshold + 1))
        global.reset_timer[227] = (200 / (global.stylethreshold + 1))
        global.reset_timer[226] = (100 / (global.stylethreshold + 1))
        global.reset_timer[225] = (200 / (global.stylethreshold + 1))
        global.reset_timer[65] = (100 / (global.stylethreshold + 1))
        global.reset_timer[207] = (60 / (global.stylethreshold + 1))
        global.reset_timer[208] = (60 / (global.stylethreshold + 1))
        global.reset_timer[183] = (60 / (global.stylethreshold + 1))
        global.reset_timer[66] = (10 / (global.stylethreshold + 1))
        global.reset_timer[243] = (100 / (global.stylethreshold + 1))
        global.reset_timer[80] = (100 / (global.stylethreshold + 1))
    }
    hsp = 0
    if place_meeting(x, (y + 1), obj_railh)
        hsp = -5
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = 5
    if (floor(image_index) == (image_number - 1))
    {
        state = (107 << 0)
        sprite_index = walkspr
    }
    if (bombreset <= 0 && floor(image_index) == global.throw_frame[object_index])
    {
        bombreset = global.reset_timer[object_index]
        sprite_index = global.throw_sprite[object_index]
        if point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
            scr_soundeffect(sfx_enemyprojectile)
        switch object_index
        {
            case obj_pizzagoblin:
                with (instance_create(x, y, obj_pizzagoblinbomb))
                {
                    hsp = (other.image_xscale * 10)
                    vsp = -8
                }
                break
            case 221:
                with (instance_create(x, y, obj_canongoblinbomb))
                    image_xscale = other.image_xscale
                break
            case 220:
                with (instance_create(x, y, obj_noisegoblin_arrow))
                {
                }
                break
            case 215:
                with (instance_create(x, y, obj_cheeseblob))
                {
                    sprite_index = spr_cheeserobot_goop
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 8)
                    vsp = 0
                    grav = 0
                }
                break
            case 233:
                with (instance_create((x + (image_xscale * 6)), (y - 6), obj_spitcheesespike))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                    vsp = -6
                }
                break
            case 234:
            case 235:
                with (instance_create((x + (image_xscale * 6)), (y - 6), obj_cheeseball))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                    vsp = -4
                }
                break
            case 217:
                with (instance_create(x, y, obj_robotknife))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case 218:
                with (instance_create(x, y, obj_kentukykenny_projectile))
                    image_xscale = other.image_xscale
                break
            case 224:
                with (instance_create(x, y, obj_pizzard_bolt))
                    image_xscale = other.image_xscale
                break
            case 227:
                if (global.stylethreshold >= 3)
                {
                    with (instance_create(x, y, obj_evilbanana))
                    {
                        baddieID = other.id
                        image_xscale = other.image_xscale
                        hsp = ((-other.image_xscale) * 4)
                        vsp = -5
                    }
                }
                else
                {
                    with (instance_create(x, y, obj_slipnslide))
                    {
                        baddieID = other.id
                        image_xscale = other.image_xscale
                        hsp = ((-other.image_xscale) * 4)
                        vsp = -5
                    }
                }
                with (obj_slipnslide)
                {
                    if (baddieID == other.id)
                        banana += 1
                }
                with (obj_evilbanana)
                {
                    if (baddieID == other.id)
                        banana += 1
                }
                break
            case 228:
                with (instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                }
                break
            case 225:
                attacking = 0
                with (instance_create(x, y, obj_forkhitbox))
                {
                    ID = other.id
                    image_xscale = other.image_xscale
                    sprite_index = other.sprite_index
                }
                break
            case 65:
                with (instance_create((x + (image_xscale * 6)), (y - 6), obj_canongoblinbomb))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case 207:
            case 208:
            case 183:
                with (instance_create((x + (8 * image_xscale)), y, obj_robotknife))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case 226:
                with (instance_create((x + (image_xscale * 6)), (y + 26), obj_rancher_bullet))
                    image_xscale = other.image_xscale
                break
            case 66:
                substate = choose((107 << 0), (99 << 0), (99 << 0))
                if (substate == (107 << 0))
                    image_xscale = choose(-1, 1, (-image_xscale))
                substate_buffer = substate_max
                with (instance_create((x + (50 * image_xscale)), (y + 20), obj_smokingprojectile))
                    image_xscale = other.image_xscale
                break
            case 243:
                instance_create(x, y, obj_warplaser)
                break
            case 80:
                with (instance_create((x + (8 * image_xscale)), y, obj_enemybullet))
                {
                    sprite_index = spr_ufogrounded_bullet
                    image_xscale = other.image_xscale
                }
                break
        }

    }
    if ((!grounded) && hsp < 0)
        hsp += 0.1
    else if ((!grounded) && hsp > 0)
        hsp -= 0.1
}

