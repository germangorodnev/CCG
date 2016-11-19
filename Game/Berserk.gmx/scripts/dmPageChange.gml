///dmPageChange(0 - right\1 - left)
switch (argument0)
{
case 0: // to the right
    iMin = min(iMin + crow * 2, ds_list_size(localCol) / 2 - crow * 2);
    iMax = min(iMax + crow * 2, ds_list_size(localCol) / 2);
    break;
case 1: // to the left
    iMin = max(iMin - crow * 2, 0);
    iMax = max(iMax - crow * 2, crow * 2);
    break;
}
dmCreateCards();
dmCreateDeck();
dmCreateArrows();
