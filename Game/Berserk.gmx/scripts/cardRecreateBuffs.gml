///cardRecreateBuffs(DEBUFFS endedBebuff)
var db = argument0;
switch (db)
{
case DEBUFFS.VISIBILITY:
    switch (type)
    {
    case CARDS.GOLEM_AIR:
        cardSetBuff(BUFFS.INVISIBILITY, 10000);
        break;
    }
    break;
}

