if (instance_number(obj_particlesystem) > 1)
{
    instance_destroy()
    return;
}
depth = -99
global.particle_system = part_system_create()
global.part_map = ds_map_create()
global.part_depth = ds_map_create()
global.part_emitter = part_emitter_create(global.particle_system)
global.debris_list = ds_list_create()
global.collect_list = ds_list_create()
var p = declare_particle((1 << 0), 1113, 0.5, 99)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((2 << 0), 1123, 0.5, -99)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((3 << 0), 1095, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((4 << 0), 1094, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((5 << 0), 1111, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((6 << 0), 1087, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((7 << 0), 1128, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((8 << 0), 1089, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((9 << 0), 1135, 1, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((10 << 0), 1090, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((11 << 0), 1552, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle((12 << 0), 1117, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
