if (ds_list_size(global.cards) == 0)
{
    // we lost
    show_message("You are peedor");
    game_end();
}
if (ds_list_size(global.opCards) == 0)
{
    // we won
    show_message("You are not peedor");
    game_end();

}

