if (other.cutscene == 0 && other.state != (119 << 0) && state != (119 << 0) && other.state != (157 << 0) && state != (157 << 0))
{
    if (hurted == 0 && other.hurted == 0 && fightballadvantage == 1 && (state == (31 << 0) || state == (57 << 0)) && (other.state == (31 << 0) || other.state == (57 << 0)))
    {
        if (object_index == obj_player1)
        {
            obj_player1.state = (94 << 0)
            obj_player2.state = (4 << 0)
            obj_player2.xscale = xscale
            obj_player1.depth = -7
            obj_player2.depth = -6
        }
        if (object_index == obj_player2)
        {
            obj_player2.state = (94 << 0)
            obj_player1.state = (4 << 0)
            obj_player1.xscale = xscale
            obj_player1.depth = -6
            obj_player2.depth = -7
        }
        obj_player1.image_index = 0
        obj_player2.image_index = 0
        obj_player1.sprite_index = obj_player1.spr_fightball
        obj_player2.sprite_index = obj_player2.spr_fightball
        obj_player1.fightball = 1
        obj_player2.fightball = 1
    }
    with (obj_player1)
    {
        if (state == (31 << 0) && other.hurted == 0 && other.state != (83 << 0) && other.state != (27 << 0) && other.state != (33 << 0) && other.state != (5 << 0) && other.state != (9 << 0) && other.state != (36 << 0) && other.cutscene == 0 && other.hurted == 0 && hurted == 0 && (!((other.state == (31 << 0) || other.state == (57 << 0)))))
        {
            movespeed = 0
            image_index = 0
            sprite_index = spr_haulingstart
            baddiegrabbedID = other.id
            state = (56 << 0)
            other.state = (4 << 0)
            obj_player1.depth = -7
            obj_player2.depth = -6
        }
        if (state == (84 << 0) && other.hurted == 0 && other.state != (41 << 0) && other.state != (83 << 0) && hurted == 0)
        {
            obj_player1.depth = -7
            obj_player2.depth = -6
            obj_player2.state = (41 << 0)
            obj_player2.sprite_index = obj_player2.spr_squished
            obj_player2.image_index = 0
        }
        if (other.state == (57 << 0) && hurted == 0 && other.hurted == 0 && (!((state == (31 << 0) || state == (57 << 0)))))
        {
            with (other)
                scr_pummel()
            xscale = (-other.xscale)
            obj_player1.depth = -6
            obj_player2.depth = -7
            thrown = 1
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            instance_create(x, y, obj_baddiegibs)
            instance_create(x, y, obj_baddiegibs)
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = (3 / room_speed)
            }
            state = (83 << 0)
            x = obj_player2.x
            y = obj_player2.y
            alarm[8] = 60
            alarm[7] = 120
            movespeed = 15
            vsp = -6
            xscale = (-other.xscale)
            sprite_index = spr_hurt
        }
    }
}
