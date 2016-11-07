var f = file_text_open_read("save.sav");
if (f == -1)
{
    saveGame();
    loadGame();
    exit;
}

// Name
global.name = file_text_read_string(f); file_text_readln(f);

// Reading deck
var l = file_text_read_string(f); file_text_readln(f);
ds_list_read(global.deck, l);


file_text_close(f);
