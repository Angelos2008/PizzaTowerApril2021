with (other)
{
    if (key_up && ladderbuffer == 0 && (state == (9 << 0) || state == (0 << 0) || state == (40 << 0) || state == (80 << 0) || state == (94 << 0) || state == (79 << 0) || state == (39 << 0) || state == (68 << 0) || state == (42 << 0)) && state != (83 << 0) && state != (81 << 0) && state != (84 << 0) && state != (87 << 0))
    {
        other.hooked = 1
        mach2 = 0
        state = (69 << 0)
        x = (other.x + 16)
        y = floor(y)
        if ((y % 2) == 1)
            y--
        if (y > (other.y + 90))
            y -= 5
    }
}
