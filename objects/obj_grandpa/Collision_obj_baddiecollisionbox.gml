with (other)
{
    if (instance_exists(baddieID) && baddieID != other.id)
    {
        if ((baddieID.state == (111 << 0) && baddieID.thrown == 1) || obj_player.state == (53 << 0))
        {
            instance_destroy()
            instance_destroy(baddieID)
            instance_destroy(other)
        }
    }
}
