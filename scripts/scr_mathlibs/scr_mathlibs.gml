function Vector2(argument0, argument1) constructor //Vector2
{
    x = argument0
    y = argument1
    function distance_between_points(argument0, argument1) //anon_Vector2_gml_GlobalScript_scr_mathlibs_202_Vector2_gml_GlobalScript_scr_mathlibs
    {
        x = argument0
        y = argument1
    }

    function distance_between_points(argument0) //anon_Vector2_gml_GlobalScript_scr_mathlibs_267_Vector2_gml_GlobalScript_scr_mathlibs
    {
        x = argument0.x
        y = argument0.y
    }

    function distance_between_points(argument0, argument1) //anon_Vector2_gml_GlobalScript_scr_mathlibs_338_Vector2_gml_GlobalScript_scr_mathlibs
    {
        x += argument0
        y += argument1
    }

    function distance_between_points(argument0) //anon_Vector2_gml_GlobalScript_scr_mathlibs_402_Vector2_gml_GlobalScript_scr_mathlibs
    {
        x += argument0.x
        y += argument0.y
    }

    function distance_between_points(argument0, argument1) //anon_Vector2_gml_GlobalScript_scr_mathlibs_480_Vector2_gml_GlobalScript_scr_mathlibs
    {
        x *= argument0
        y *= argument1
    }

    function distance_between_points(argument0, argument1) //anon_Vector2_gml_GlobalScript_scr_mathlibs_541_Vector2_gml_GlobalScript_scr_mathlibs
    {
        x /= argument0
        y /= argument1
    }

    function distance_between_points(argument0) //anon_Vector2_gml_GlobalScript_scr_mathlibs_610_Vector2_gml_GlobalScript_scr_mathlibs
    {
        x *= argument0.x
        y *= argument0.y
    }

    function distance_between_points(argument0) //anon_Vector2_gml_GlobalScript_scr_mathlibs_692_Vector2_gml_GlobalScript_scr_mathlibs
    {
        x /= argument0.x
        y /= argument0.y
    }

}

function cycle(argument0, argument1, argument2) //cycle
{
    var delta = (argument2 - argument1)
    var result = ((argument0 - argument1) % delta)
    if (result < 0)
        result += delta
    return (result + argument1);
}

function angle_rotate(argument0, argument1, argument2) //angle_rotate
{
    var diff = cycle((argument1 - argument0), -180, 180)
    if (diff < (-argument2))
        return (argument0 - argument2);
    if (diff > argument2)
        return (argument0 + argument2);
    return argument1;
}

function get_velocity(argument0, argument1) //get_velocity
{
    return (argument0 / argument1);
}

function Wave(argument0, argument1, argument2, argument3) //Wave
{
    var a4 = ((argument1 - argument0) * 0.5)
    return ((argument0 + a4) + (sin(((((current_time * 0.001) + (argument2 * argument3)) / argument2) * (2 * pi))) * a4));
}

function distance_to_pos(argument0, argument1, argument2, argument3, argument4, argument5) //distance_to_pos
{
    return (abs((argument0 - argument2)) <= argument4 && abs((argument1 - argument3)) <= argument5);
}

function distance_between_points(argument0, argument1, argument2, argument3) //distance_between_points
{
    return sqrt((sqr((argument2 - argument0)) + sqr((argument3 - argument1))));
}

