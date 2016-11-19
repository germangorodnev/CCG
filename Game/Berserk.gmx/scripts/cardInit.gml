
image_index = type;

var objects = oGameDatabase.database;
var ourParams = objects[| type];
var allActions = ds_map_find_value(ourParams, "actionNames");
var actionsList = ds_map_find_value(allActions, global.language);
var actionsIndexes = ourParams[? "actionIndex"];
for (var i = 0; i < 4; i++)
{
    actionsNames[i] = actionsList[| i];
    var currMap = actionsIndexes[| i];
    actionsIndex[i] = ds_map_find_value(currMap, "ENUM");
    actionsMana[i] = ds_map_find_value(currMap, "mana");
    actionsNeedTarget[i] = ds_map_find_value(currMap, "needT");
    actionsTargetType[i] = ds_map_find_value(currMap, "targetType");
    actionsInstant[i] = ds_map_find_value(currMap, "instant");
}   

// Now parameters
hp = ourParams[? "hp"];
_hp = hp;
__hp = _hp;
dmg = ourParams[? "dmg"];
_dmg = dmg;
armor = ourParams[? "armor"];
_armor = armor;
usesMana = ourParams[? "usesMana"];
mana = ourParams[? "mana"];
_mana = mana;

rarity = ourParams[? "rarity"];
borderIndex = rarity;

desc = ds_map_find_value(ourParams[? "description"], global.language);
AP = ourParams[? "AP"];
// resists
var c = ds_list_find_value(ourParams[? "resists"], 0);
if (c > 0)
{
    for (var i = 1; i < c + 1; i++)
    {
        ds_list_add(resists, ds_list_find_value(ourParams[? "resists"], i));
    }
}

if (global.gameState == GAME_STATES.PERFORM_ACTIONS)
    cardPerformBattlecry(true);
    
ds_list_clear(deathrattles);

switch (type)
{
case CARDS.KONCHA:
    cardAddDeathrattle(DEATHRATTLES.KONCHA_MUSHROOMS);
    break;
case CARDS.GOLEM_BATYA:
    cardAddDeathrattle(DEATHRATTLES.GOLEM_B_TO_M);
    break;
case CARDS.GOLEM_MATYA:
    cardAddDeathrattle(DEATHRATTLES.GOLEM_M_TO_S);
    break;
case CARDS.GOLEM_MENTOR:   
    hasImpact = true; 
    ls1 = ds_list_create();
    break;
case CARDS.GOLEM_AIR:
    cardSetBuff(BUFFS.INVISIBILITY, 8000);
    break;
}

