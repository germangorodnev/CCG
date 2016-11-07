/// Need to clear events and flags
with (oAttack)
    instance_destroy();
var a = instance_create(global.guiW / 2, global.guiH / 2, oNewTurn);
if (global.language == "Russian")
    a.image_index = 1;
    
with (oCardBase)
{
    cardBeginStep();
}
global.AP = global.beginAP;
clientSetState(CLIENT_STATES.CHOOSING_CARD);

