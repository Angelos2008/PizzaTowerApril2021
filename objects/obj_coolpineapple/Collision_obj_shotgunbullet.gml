if (state != (120 << 0) && state != (61 << 0))
    return;
with (other)
{
    var _maxhsp = abs(spd)
    var _dir = sign(spd)
    if (x != other.x)
        _dir = sign((x - other.x))
    spd = (_maxhsp * _dir)
}
if (state != (120 << 0))
{
    sprite_index = parryspr
    movespeed = 8
    state = (120 << 0)
    image_index = 0
}
