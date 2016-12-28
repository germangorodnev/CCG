///empowerAttack(card* id)
var card = argument1;
if (ds_list_find_index(empowers, card) != -1)
    exit;
switch (card.type)
{
case CARDS.AMP_MIRROR:  
case CARDS.DISCO_DISCOMET:
    ds_list_add(empowers, card);
    dmg++;
    image_xscale += 0.2;
    image_yscale += 0.2;    
    break;
case CARDS.AMP_UNKNOWN:
    ds_list_add(empowers, card);
    dmg += 2;
    image_xscale += 0.2;
    image_yscale += 0.2;    
    break;
default:
    ds_list_add(empowers, card);
    exit;
    break;
}
