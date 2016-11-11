var f = file_text_open_read("save.sav");
if (f == -1)
{
    saveGame();
    loadGame();
    exit;
}

// Lang
global.language = file_text_read_string(f); file_text_readln(f);

// Name
global.name = file_text_read_string(f); file_text_readln(f);

// Reading deck
var l = file_text_read_string(f); file_text_readln(f);
ds_list_read(global.deck, l);

// Reading wins and loses
global.wins = file_text_read_real(f); file_text_readln(f);
global.loses = file_text_read_real(f); file_text_readln(f);

file_text_close(f);
