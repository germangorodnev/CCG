switch (argument0)
{
case CARDS.MIMIC_WILD:
case CARDS.MIMIC_TOWN:
case CARDS.MUSHROOMS:
case CARDS.ARMOR_HAMMER:
case CARDS.PUS:
case CARDS.COOKIE:
case CARDS.CORRUPTED_MUSHROOMS:
case CARDS.GOLEM_SLIME:
case CARDS.GOLEM_STONE:
case CARDS.GOLEM_MENTOR:
case CARDS.GOLEM_AIR:
case CARDS.MINI_BOT:
case CARDS.ARCHER:
case CARDS.CAVALERY:
case CARDS.VAPE:
case CARDS.WALL:
case CARDS.LOST_MAN:
case CARDS.AMP_MIRROR:
case CARDS.AMP_UNKNOWN:
case CARDS.STEALTH_KILLER:
case CARDS.BUTCHER:
case CARDS.DISCOMET:
case CARDS.FIELD_MEDIC:
    return 0;
    break;
case CARDS.KONCHA:
case CARDS.LISA:
case CARDS.GARGULIA:
case CARDS.PORCHANKA:
case CARDS.GOLEM_MATYA:
case CARDS.SCOUT:
case CARDS.CHEMIS_INVENTOR:
case CARDS.PET_BEAR:
case CARDS.HELI:
case CARDS.GRAVER:
case CARDS.DISCO_DISCOMET:
case CARDS.MECHANIC:
    return 1;
    break;
case CARDS.JOJN:
case CARDS.ARTONIX:
case CARDS.RITTER:
case CARDS.GOLEM_BATYA:
case CARDS.GOLEM_SON:
case CARDS.GOLEM_SMASHER:
case CARDS.UNDER_DEVOURER:
case CARDS.OFFICER:
case CARDS.NINJA:
case CARDS.BATTLE_MEDIC:
    return 2;
    break;
}
