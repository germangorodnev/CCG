///cardSummon(player 0\1, CARDS type)
/// Summon a new card
var lspos = cardGetFreePlace(argument0);
if (lspos == -1)
    exit;
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
