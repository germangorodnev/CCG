var f = file_text_open_read("cards.json");
// now create stringJson
var stringJson = "";
while(!file_text_eof(f))
{
    stringJson += file_text_read_string(f);
    file_text_readln(f);
}
file_text_close(f);

image_index = type;

var json = json_decode(stringJson);
var objects = json[? "default"];
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
    ds_map_destroy(currMap);
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
}
/*ds_map_destroy(objects);
ds_map_destroy(ourParams);
ds_map_destroy(allActions);
ds_list_destroy(actionsList);
ds_list_destroy(actionsIndexes);



