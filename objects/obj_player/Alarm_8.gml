if (state == (83 << 0))
{
    state = (0 << 0)
    movespeed = 0
    if scr_solid(x, y)
    {
        var ty = try_solid(0, 1, 92, 32)
        if (ty != -1)
            y += ty
    }
}
