switch targetRoom
{
    case 197:
    case 215:
    case 233:
    case 252:
        world = 1
        break
    case 293:
    case 314:
    case 330:
    case 354:
        world = 2
        break
    case 377:
    case 397:
    case 423:
    case 443:
        world = 3
        break
    case 455:
    case 55:
    case 0:
    case 57:
        world = 4
        break
    case 280:
    case 38:
    case 477:
    case 53:
        world = 5
        break
}

ini_open(concat("saveData", global.currentsavefile, ".ini"))
global.pigtotal += ini_read_real("Highscore", string(level), 0)
highscore = ini_read_real("Highscore", string(level), 0)
secret_count = ini_read_string("Secret", string(level), 0)
toppin[0] = ini_read_real("Toppin", (string(level) + "1"), 0)
toppin[1] = ini_read_real("Toppin", (string(level) + "2"), 0)
toppin[2] = ini_read_real("Toppin", (string(level) + "3"), 0)
toppin[3] = ini_read_real("Toppin", (string(level) + "4"), 0)
toppin[4] = ini_read_real("Toppin", (string(level) + "5"), 0)
ini_close()
switch level
{
    case "entrance":
        msg = "ENTRANCE"
        break
    case "medieval":
        msg = "PIZZASCAPE"
        break
    case "chateau":
        msg = "PIZZASCARE"
        break
    case "ruin":
        msg = "TEH ANCIENT CHEESE"
        break
    case "dungeon":
        msg = "BLOODSAUCE DUNGEON"
        break
    case "floorroom":
        msg = "OREGANO DESERT"
        break
    case "graveyard":
        msg = "THE WASTEYARD"
        break
    case "farm":
        msg = "FUN FARM"
        break
    case "ufo":
        msg = "SPACE PINBALL"
        break
    case "strongcold":
        msg = "STRONGCOLD"
        break
    case "forest":
        msg = "GNOME FOREST"
        break
    case "beach":
        msg = "PINEAPPLE BEACH"
        break
    case "dragonlair":
        msg = "DRAGON LAIR"
        break
    case "snickchallenge":
        msg = "SNICK CHALLENGE"
        break
}

