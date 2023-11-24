if (other.state == (157 << 0))
    return;
create_particle(x, y, (6 << 0), 0)
other.vsp = -14
other.jumpstop = 1
visible = false
x = -100
y = -100
respawn = 100
if (other.state == (68 << 0))
    other.sprite_index = other.spr_machfreefall
if (other.state == (26 << 0))
{
    other.sprite_index = other.spr_machfreefall
    other.state = (68 << 0)
}
