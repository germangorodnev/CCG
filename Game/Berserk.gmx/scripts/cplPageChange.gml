///dmPageChange(0 - right\1 - left)
switch (argument0)
{
case 0: // to the right
    dMin = median(0, dMin + crow * 2, ds_list_size(localDeck) - ((ds_list_size(localDeck) / 2 ) mod crow * 2));
    dMax = min(dMin + crow * 2, ds_list_size(localDeck) / 2);
    break;
case 1: // to the left
    dMin = max(dMin - crow * 2, 0);
    dMax = median(crow * 2, dMin + crow * 2, ds_list_size(localDeck) / 2);
    break;
}

cplCreateDeck()
cplCreateArrows();
