with (obj_player1)
{
    var _state = state
    if (state == (61 << 0) || state == (110 << 0) || state == (43 << 0))
        _state = tauntstoredstate
    switch _state
    {
        case (33 << 0):
            audio_sound_pitch(global.mu, 0.9)
            break
        case (27 << 0):
            audio_sound_pitch(global.mu, 1.2)
            break
        case (5 << 0):
            audio_sound_pitch(global.mu, 1.2)
            break
        default:
            audio_sound_pitch(global.mu, 1)
    }

}
if ((!audio_is_playing(mu_pizzatime)) && (!audio_is_playing(mu_chase)) && (!audio_is_playing(mu_noiseescape)) && string_letters(roomname) != "dragonlair" && global.panic == 1 && obj_pause.pause == 0 && obj_camera.ded == 0)
{
    audio_stop_all()
    if (obj_player1.character == "P")
    {
        scr_sound(mu_pizzatime)
        pausedmusic = 92
    }
    else
    {
        scr_sound(mu_noiseescape)
        pausedmusic = 117
    }
}
if (arena == 1 && (!audio_is_playing(mu_miniboss)) && obj_pause.pause == 0)
{
    audio_stop_all()
    scr_sound(mu_miniboss)
    pausedmusic = 90
}
if (instance_exists(obj_hungrypillar) && (!audio_is_playing(mu_dungeondepth)) && obj_pause.pause == 0 && (!audio_is_playing(mu_chase)))
{
    audio_stop_all()
    scr_sound(mu_dungeondepth)
    pausedmusic = 116
}
if (global.combo < 50 && audio_is_playing(mu_chase))
    audio_stop_sound(mu_chase)
if (global.miniboss == 0 && arena == 0 && audio_is_playing(mu_miniboss))
    audio_stop_sound(mu_miniboss)
if ((!audio_is_playing(mu_snickchallenge)) && global.snickchallenge == 1 && obj_pause.pause == 0 && global.minutes >= 2 && obj_camera.ded == 0)
{
    audio_stop_all()
    scr_sound(mu_snickchallenge)
    pausedmusic = 114
}
else if ((!audio_is_playing(mu_snickchallengeend)) && global.snickchallenge == 1 && obj_pause.pause == 0 && global.minutes < 2 && obj_camera.ded == 0)
{
    audio_stop_all()
    scr_sound(mu_snickchallengeend)
    pausedmusic = 114
}
if (room != hub_room1)
    fadeoff = audio_sound_get_track_position(global.music)
else
    fadeoff = 0
if (room == strongcold_miniboss && global.miniboss == 1)
{
    if (!audio_is_playing(mu_miniboss))
    {
        audio_stop_all()
        scr_sound(mu_miniboss)
        scr_soundeffect(sfx_scream5)
        pausedmusic = 90
    }
}
else if (room == strongcold_endscreen)
{
    if (!audio_is_playing(mu_entrance))
    {
        audio_stop_all()
        scr_sound(mu_entrance)
        pausedmusic = mu_entrance
    }
}
