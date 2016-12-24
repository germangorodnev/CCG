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
// count
global.decksCount = file_text_read_real(f); file_text_readln(f);
for (var i = 0; i < global.decksCount; i++)
{
    var l = file_text_read_string(f); file_text_readln(f);
    var newDeck = ds_list_create();
    ds_list_read(newDeck, l);    
    ds_list_add(global.decks, newDeck);
}
if (global.decksCount > 0)
    global.deck = global.decks[| 0];
else
{
    newD = ds_list_create();
    ds_list_add(global.decks, newD);
    global.decksCount++;
    global.deck = newD;
}
// Reading wins and loses
global.wins = file_text_read_real(f); file_text_readln(f);
global.loses = file_text_read_real(f); file_text_readln(f);

// Card collection
ds_list_clear(global.collection);
var c = file_text_read_string(f); file_text_readln(f);
ds_list_read(global.collection, c);

// boosters
global.packs3 = file_text_read_real(f); file_text_readln(f);
global.packs5 = file_text_read_real(f); file_text_readln(f);

// money
global.money = file_text_read_real(f); file_text_readln(f);

// music
global.sound = file_text_read_real(f); file_text_readln(f);

file_text_close(f);
