if (other.y > other.yprevious && other.state != (61 << 0) && other.state != (55 << 0) && other.state != (82 << 0) && other.y < y)
{
    with (other)
    {
        if (!scr_transformationcheck())
            return;
        while place_meeting(x, y, obj_grindrailslope)
            y--
    }
    if (other.movespeed < 10)
        other.movespeed = 10
    other.state = (55 << 0)
}
