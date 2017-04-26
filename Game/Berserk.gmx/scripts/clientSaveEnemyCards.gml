///clientSaveEnemyCards(buffer*)
for (var i = 0; i < global.cardsOnBoard; i++)
{
    var type = buffer_read(argument0, buffer_u16);
    ds_list_add(global.opCards, type); // from the bottom left to the top right
}
