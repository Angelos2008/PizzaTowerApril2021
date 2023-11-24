if (other.object_index == obj_player1)
{
    if (obj_player1.shotgunAnim == 0 && obj_player1.backupweapon == 0 && obj_player1.state == (31 << 0))
    {
        obj_player1.shotgunAnim = 1
        obj_player1.state = (48 << 0)
        obj_player1.image_index = 0
        obj_player1.sprite_index = obj_player1.spr_shotgunpullout
        global.gotshotgun = 1
        scr_soundeffect(sfx_shotgungot)
        instance_destroy()
        tv_push_prompt_once(tv_create_prompt("This is the shotgun powerup text", (2 << 0), 353, 3), "shotgun")
        global.heattime = 60
    }
}
if (other.object_index == obj_player2)
{
    if (obj_player2.shotgunAnim == 0 && obj_player2.backupweapon == 0 && obj_player2.state == (31 << 0))
    {
        obj_player2.shotgunAnim = 1
        obj_player2.state = (48 << 0)
        obj_player2.image_index = 0
        obj_player2.sprite_index = obj_player2.spr_shotgunpullout
        global.gotshotgun = 1
        scr_soundeffect(sfx_shotgungot)
        instance_destroy()
    }
}
