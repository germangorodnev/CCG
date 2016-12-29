///getFraseLang("disc"/"conn"/"dbf"/"bf", optional int index)
switch (argument0)
{
case "bless":
    switch (global.language)
    {
    case "Russian":
        return "Благословление от рыцаря: атака и броня увеличены";
        break;
    case "English":
        return "Knight's blessing: attack and armor increased";
        break;
    }    
    break;
case "matya":
    switch (global.language)
    {
    case "Russian":
        return "Поцелуй матери: здоровье и атака увеличены";
        break;
    case "English":
        return "Mom's kiss: hp and attack increased";
        break;
    }    
    break;
case "gengap":
    switch (global.language)
    {
    case "Russian":
        return "Конфликт поколений: атака увеличена";
        break;
    case "English":
        return "Generation gap: attack increased";
        break;
    }    
    break;
case "devour":
    switch (global.language)
    {
    case "Russian":
        return "Пожирание: получены хар-ки соседних карт";
        break;
    case "English":
        return "Devour: adjacent cards' stats gained";
        break;
    }    
    break;

case "armbr":
    switch (global.language)
    {
    case "Russian":
        return "разрушение брони";
        break;
    case "English":
        return "armor break";
        break;
    }
    break;
case "integer":
    switch (argument1)
    {
    case -4: 
        return "";
        break;
    default:
        return string(argument1);
        break;
    }
    break;
case "turns":
    switch (global.language)
    {
    case "Russian":
        return "ходов";
        break;
    case "English":
        return "turns";
        break;
    }
    break;
case "dmg":
    switch (global.language)
    {
    case "Russian":
        return "ед. урона";
        break;
    case "English":
        return "dmg.";
        break;
    }
    break;
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
    
case "dbf":
    switch (argument1)
    {
    case DEBUFFS.POISON:
        switch (global.language)
        {
        case "Russian":
            return "Отравление";
            break;
        case "English":
            return "Poison";
            break;
        }
        break;
    case DEBUFFS.STUN:
        switch (global.language)
        {
        case "Russian":
            return "Паралич";
            break;
        case "English":
            return "Stun";
            break;
        }
        break;
    case DEBUFFS.CAVALRY:
        switch (global.language)
        {
        case "Russian":
            return "-3 зд.";
            break;
        case "English":
            return "-3 hp";
            break;
        }
        break;
    case DEBUFFS.MECHANIC_ATTACK:
        switch (global.language)
        {
        case "Russian":
            return "Рассечение кожи";
            break;
        case "English":
            return "Skin incision";
            break;
        }
        break;
    }
    break;
    
case "bf":
    switch (argument1)
    {
    case BUFFS.BLOCK:
        switch (global.language)
        {
        case "Russian":
            return "Блокирование атак";
            break;
        case "English":
            return "Attacks block";
            break;
        }
        break;
    case BUFFS.INVISIBILITY:
        switch (global.language)
        {
        case "Russian":
            return "Невидимость. Нельзя выбрать как цель";
            break;
        case "English":
            return "Invisibility";
            break;
        }
        break;
    case BUFFS.FIRE_ARROWS:
        switch (global.language)
        {
        case "Russian":
            return "Огненные стрелы";
            break;
        case "English":
            return "Fire arrows";
            break;
        }
        break;
    case BUFFS.GREAT_HEAL:
        switch (global.language)
        {
        case "Russian":
            return "Подготовка великого исцеления";
            break;
        case "English":
            return "Great healing preparation";
            break;
        }
        break;
    }
    break;
}

/*
enum DEBUFFS
{
    POISON = 0,
    STUN,
    CAVALRY,
    MECHANIC_ATTACK
}

enum BUFFS
{
    BLOCK,
    INVISIBILITY,
    FIRE_ARROWS,
    GREAT_HEAL
}



