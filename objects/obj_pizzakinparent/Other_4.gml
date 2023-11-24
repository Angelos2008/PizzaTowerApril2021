event_inherited()
switch object_index
{
    case obj_pizzakincheese:
        if (!global.cheesefollow)
            instance_destroy()
        break
    case 315:
        if (!global.tomatofollow)
            instance_destroy()
        break
    case 317:
        if (!global.pineapplefollow)
            instance_destroy()
        break
    case 313:
        if (!global.shroomfollow)
            instance_destroy()
        break
    case 316:
        if (!global.sausagefollow)
            instance_destroy()
        break
}

