with (other)
{
    if scr_transformationcheck()
    {
        if ((!grounded) && state != (41 << 0))
        {
            scr_losepoints()
            state = (82 << 0)
            hsp = 0
            vsp = 10
        }
    }
}
