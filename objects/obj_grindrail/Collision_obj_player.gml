if (place_meeting(x, y, other) && other.state != (61 << 0) && other.state != (82 << 0) && other.y > other.yprevious && other.y < y)
{
    with (other)
    {
        if (!scr_transformationcheck())
            return;
    }
    other.y = (y - 49)
    if (other.movespeed < 10)
        other.movespeed = 10
    other.state = (55 << 0)
}
