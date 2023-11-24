global.coop = 0
global.currentsavefile = 1
global.mach_color1 = make_colour_rgb(96, 208, 72)
global.mach_color2 = make_colour_rgb(248, 0, 0)
global.afterimage_color1 = make_colour_rgb(255, 0, 0)
global.afterimage_color2 = make_colour_rgb(0, 255, 0)
global.smallnumber_color1 = make_colour_rgb(255, 255, 255)
global.smallnumber_color2 = make_colour_rgb(248, 0, 0)
global.optimize = 0
global.autotile = 1
global.font_small = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!._1234567890:?", 1, -2)
global.smallnumber_fnt = font_add_sprite_ext(spr_smallnumber, "1234567890-", 1, 0)
pal_swap_init_system(1)
with (obj_player1)
    state = (0 << 0)
global.loadeditor = 0
