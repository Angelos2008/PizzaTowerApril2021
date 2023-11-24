switch image_index
{
    case 0:
        contentEditor = 219
        break
    case 1:
        contentEditor = 98
        break
    case 2:
        contentEditor = 228
        break
    case 3:
        contentEditor = 224
        break
    case 4:
        contentEditor = 227
        break
    case 5:
        contentEditor = 248
        break
    case 6:
        contentEditor = 249
        break
}

with (instance_create_layer(x, y, "Level_structure", obj_baddiespawner))
    content = other.contentEditor
