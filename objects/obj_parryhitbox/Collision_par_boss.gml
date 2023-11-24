var _boss = other.id
var hb = id
with (_boss)
{
    var upb = ds_map_find_value(boss_unparryablestates, state)
    var sb = ds_map_find_value(boss_hurtstates, state)
    if ((!is_undefined(sb)) && is_undefined(upb))
    {
        var p = (hb.player_id == 1 ? obj_player1.id : obj_player2.id)
        var pstate = p.tauntstoredstate
        var pmovespeed = p.tauntstoredmovespeed
        var psprite = p.tauntstoredsprite
        self.boss_hurt(30, p)
        with (hb)
        {
            if (!collisioned)
                event_user(0)
        }
        with (p)
        {
            tauntstoredstate = pstate
            tauntstoredmovespeed = pmovespeed
            tauntstoredsprite = psprite
        }
    }
}
