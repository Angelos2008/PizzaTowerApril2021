var lay_id = layer_get_id("Background")
var back_id = layer_background_get_id(lay_id)
switch image_index
{
    case 0:
        name = "bg_tower"
        layer_background_sprite(back_id, 1731)
        break
    case 1:
        name = "bg_entrance3"
        layer_background_sprite(back_id, 1735)
        break
    case 2:
        name = "bg_medieval2"
        layer_background_sprite(back_id, 1684)
        break
    case 3:
        name = "bg_medievalinterior"
        layer_background_sprite(back_id, 1686)
        break
    case 4:
        name = "bg_medievallibrairy1"
        layer_background_sprite(back_id, 1688)
        break
    case 5:
        name = "bg_medievaltreasure1"
        layer_background_sprite(back_id, 1690)
        break
    case 6:
        name = "bg_medievaltreasure2"
        layer_background_sprite(back_id, 1691)
        break
    case 7:
        name = "bg_secret"
        layer_background_sprite(back_id, 1706)
        break
}

