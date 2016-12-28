///cardParamToStr(CLASSES ...)
switch (argument0)
{
case CLASSES.CREATURE:
    if (global.language == "English")
        return "Creature";
    else if (global.language == "Russian")
        return "Существо";
    break;
case CLASSES.HUMAN:
    if (global.language == "English")
        return "Human";
    else if (global.language == "Russian")
        return "Человек";
    break;
case CLASSES.GOLEM:
    if (global.language == "English")
        return "Golem";
    else if (global.language == "Russian")
        return "Голем";
    break;
case CLASSES.MECH:
    if (global.language == "English")
        return "Mech";
    else if (global.language == "Russian")
        return "Механизм";
    break;
case CLASSES.RIDER:
    if (global.language == "English")
        return "Rider";
    else if (global.language == "Russian")
        return "Наездник";
    break;
case CLASSES.PET:
    if (global.language == "English")
        return "Pet";
    else if (global.language == "Russian")
        return "Питомец";
    break;
}

