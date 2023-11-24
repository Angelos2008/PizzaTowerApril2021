with (obj_baddie)
    draw_self()
with (obj_monster)
    draw_self()
shader_set(global.Pal_Shader)
with (obj_heatafterimage)
{
    if visible
    {
        pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0)
        draw_sprite_ext(obj_player1.sprite_index, obj_player1.image_index, x, y, obj_player1.xscale, obj_player1.yscale, 1, c_white, alpha)
    }
}
with (obj_player2)
{
    if visible
    {
        pal_swap_set(spr_palette, paletteselect, 0)
        draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)
    }
}
with (obj_player1)
{
    if visible
    {
        pal_swap_set(spr_palette, paletteselect, 0)
        draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)
    }
}
shader_set(shd_hit)
with (obj_baddie)
{
    if (visible && flash)
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
}
with (obj_player)
{
    if (visible && flash)
        draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)
}
with (obj_smallnumber)
{
    if (visible && flash)
        draw_text(x, y, number)
}
shader_reset()
