///cardActionChooserInit(oCardBase id)
cardType = argument0.type;
cardId = argument0;

description = argument0.desc;

actionsCount = 4;
for (var i = 0; i < actionsCount; i++)
{
    actions[i] = argument0.actionsNames[i];
    actionIndex[i] = argument0.actionsIndex[i];
    actionMana[i] = argument0.actionsMana[i];
}


