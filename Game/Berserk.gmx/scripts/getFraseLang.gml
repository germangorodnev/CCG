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
}
