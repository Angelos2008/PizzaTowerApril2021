enum tvprompt
{
	normal,
	trigger,
	transfo
}

image_speed = 0.1
chose = 0
message = ""
showtext = 0
tvprompts_list = ds_list_create()
state = (0 << 0)
promptxstart = 641
promptx = promptxstart
prompt = ""
promptspd = 1
prompt_buffer = 0
prompt_max = 150
promptsurface = surface_create(290, 102)
special_prompts = -4
hud_posx = 0
hud_posY = 0
tvsprite = spr_tv_idle
sprite_index = spr_tv_off
bubbleindex = 0
bubblespr = -4
idleanim = 180
noisesprite = spr_noiseHUD_idle
xi = 500
yi = 600
imageindexstore = 0
once = 0
global.hurtcounter = 0
global.hurtmilestone = 3
alpha = 1
shownranka = 0
shownrankb = 0
shownrankc = 0
collect_shake = 0
global.srank = 0
global.arank = 0
global.brank = 0
global.crank = 0
character = "PEPPINO"
display_set_gui_size(960, 540)
