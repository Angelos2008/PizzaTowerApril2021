ini_open(concat("saveData", global.currentsavefile, ".ini"))
rank = ini_read_string("Ranks", string(levelsign), "none")
ini_close()
