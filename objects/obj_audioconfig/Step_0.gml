if (updown_buffer > 0)
{
    updown_buffer--
    if ((!obj_player1.key_up2) && (!obj_player1.key_down2) && (!keyboard_check_pressed(vk_up)) && (!keyboard_check_pressed(vk_down)))
        updown_buffer = 0
}
else
{
    if ((obj_player1.key_up2 || keyboard_check_pressed(vk_up)) && audio_select > -1)
    {
        updown_buffer = updown_max
        audio_select -= 1
        scr_soundeffect(sfx_step)
    }
    if ((obj_player1.key_down2 || keyboard_check_pressed(vk_down)) && audio_select < 2)
    {
        updown_buffer = updown_max
        audio_select += 1
        scr_soundeffect(sfx_step)
    }
}
if (obj_player1.key_jump || keyboard_check_pressed(vk_return))
{
    switch audio_select
    {
        case -1:
            self.set_audio_config()
            with (obj_option)
                visible = true
            instance_destroy()
            break
        default:
            self.set_audio_config()
            break
    }

}
if (key_buffer > 0)
    key_buffer--
else
{
    if ((-obj_player1.key_left) || keyboard_check(vk_left))
    {
        switch audio_select
        {
            case 0:
                audiosaved_master--
                break
            case 1:
                audiosaved_music--
                break
            case 2:
                audiosaved_sfx--
                break
        }

        key_buffer = key_max
    }
    if (obj_player1.key_right || keyboard_check(vk_right))
    {
        switch audio_select
        {
            case 0:
                audiosaved_master++
                break
            case 1:
                audiosaved_music++
                break
            case 2:
                audiosaved_sfx++
                break
        }

        key_buffer = key_max
    }
}
audiosaved_master = clamp(audiosaved_master, 0, 100)
audiosaved_music = clamp(audiosaved_music, 0, 100)
audiosaved_sfx = clamp(audiosaved_sfx, 0, 100)
