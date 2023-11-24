with (obj_player1)
{
    if (place_meeting(x, y, other) && key_up && grounded && (state == (0 << 0) || state == (79 << 0) || state == (80 << 0) || state == (94 << 0)) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != (74 << 0) && state != (71 << 0) && obj_player1.spotlight == 1)
    {
        audio_stop_all()
        backtohubstartx = x
        backtohubstarty = y
        backtohubroom = room
        mach2 = 0
        obj_camera.chargecamera = 0
        image_index = 0
        state = (74 << 0)
        obj_player2.backtohubstartx = x
        obj_player2.backtohubstarty = y
        obj_player2.backtohubroom = room
        if (global.coop == 1)
        {
            with (obj_player2)
            {
                x = obj_player1.x
                y = obj_player1.y
                mach2 = 0
                obj_camera.chargecamera = 0
                image_index = 0
                state = (74 << 0)
            }
        }
    }
}
with (obj_player2)
{
    if (place_meeting(x, y, other) && key_up && grounded && (state == (0 << 0) || state == (79 << 0) || state == (80 << 0) || state == (94 << 0)) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != (74 << 0) && state != (71 << 0) && obj_player1.spotlight == 0)
    {
        audio_stop_all()
        backtohubstartx = x
        backtohubstarty = y
        backtohubroom = room
        mach2 = 0
        obj_camera.chargecamera = 0
        image_index = 0
        state = (74 << 0)
        obj_player1.backtohubstartx = x
        obj_player1.backtohubstarty = y
        obj_player1.backtohubroom = room
        if (global.coop == 1)
        {
            with (obj_player1)
            {
                x = obj_player2.x
                y = obj_player2.y
                mach2 = 0
                obj_camera.chargecamera = 0
                image_index = 0
                state = (74 << 0)
            }
        }
    }
}
if ((floor(obj_player1.image_index) == (obj_player1.image_number - 1) && obj_player1.state == (74 << 0)) || (floor(obj_player2.image_index) == (obj_player2.image_number - 1) && obj_player2.state == (74 << 0)))
{
    with (obj_player)
    {
        if (other.level == "snickchallenge")
        {
            global.wave = 0
            global.maxwave = (((global.minutes * 60) + global.seconds) * 60)
            if global.panicbg
                scr_panicbg_init()
            global.snickchallenge = 1
            global.collect = 10000
            with (obj_camera)
            {
                alarm[1] = 60
                global.seconds = 59
                global.minutes = 9
            }
        }
        obj_music.fadeoff = 0
        targetDoor = other.targetDoor
        targetRoom = other.targetRoom
        if (!instance_exists(obj_fadeout))
            instance_create(x, y, obj_fadeout)
    }
}
