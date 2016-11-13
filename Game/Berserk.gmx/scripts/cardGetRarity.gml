switch (argument0)
{
case CARDS.MIMIC_WILD:
case CARDS.MIMIC_TOWN:
case CARDS.MUSHROOMS:
case CARDS.ARMOR_HAMMER:
case CARDS.PUS:
case CARDS.COOKIE:
case CARDS.CORRUPTED_MUSHROOMS:
    return 0;
    break;
case CARDS.KONCHA:
case CARDS.LISA:
case CARDS.GARGULIA:
case CARDS.PORCHANKA:
    return 1;
    break;
case CARDS.JOJN:
case CARDS.ARTONIX:
case CARDS.RITTER:
    return 2;
    break;
}
