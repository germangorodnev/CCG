switch (argument0)
{
case "disc":
    switch (global.language)
    {
    case "Russian":
        return "Игрок вышел";
        break;
    case "English":
        return "Player disconnected";
        break;
    }
    break;
case "conn":
    switch (global.language)
    {
    case "Russian":
        return "Игрок присоеднился";
        break;
    case "English":
        return "Player connected";
        break;
    }
    break;
}
