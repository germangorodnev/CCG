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
}   

// Now parameters
hp = ourParams[? "hp"];
dmg = ourParams[? "dmg"];
armor = ourParams[? "armor"];
usesMana = ourParams[? "usesMana"];
mana = ourParams[? "mana"];

rarity = ourParams[? "rarity"];
borderIndex = rarity;

desc = ds_map_find_value(ourParams[? "description"], global.language);
AP = ourParams[? "AP"];
/* resists
var c = ds_list_find_value(ourParams[? "resists"], 0);
if (c > 0)
{
    for (var i = 1; i < c + 1; i++)
    {
        ds_list_add(resists, ds_list_find_value(ourParams[? "resists"], i));
    }
}*/

/*ds_list_destroy(actionsIndexes);
ds_list_destroy(actionsList);
ds_list_destroy(allActions);
ds_list_destroy(objects);
ds_map_destroy(json);*/

