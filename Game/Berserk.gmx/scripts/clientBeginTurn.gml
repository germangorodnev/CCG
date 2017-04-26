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
global.beginAP = min(global.beginAP + 1, 14);
global.AP = global.beginAP;
clientSetState(CLIENT_STATES.CHOOSING_CARD);
instance_activate_object(oEndTurn);
// DEBUG
//surface_save(application_surface, string(current_hour) + "." + string(current_minute) + "." + string(current_second) + ".png");
