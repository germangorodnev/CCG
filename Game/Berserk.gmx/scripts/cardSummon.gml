///cardSummon(player 0\1, CARDS type, lspos -1)
/// Summon a new card
var lspos = 0;
if (argument2 == -1)
{
    lspos = cardGetFreePlace(argument0);
    if (lspos == -1)
        exit;
}
else
    lspos = argument2;
// it's the pos in list, now to coords
var xp = cardListPosToX(argument0, lspos), 
    yp = cardListPosToY(argument0, lspos);

var card = instance_create(xp, yp, oCard);
card.type = argument1;
card.player = argument0;
with (card)
{
    cardInit();
    var ls = cardGetGroup();
    ds_list_insert(ls, lspos, id);
}
