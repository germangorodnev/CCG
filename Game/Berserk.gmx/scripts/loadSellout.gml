var f = file_text_open_read("sellout.col");
if (f == -1)
{
    saveSellout();
    loadSellout();
    exit;
}

// read the sellout we bought
global.selloutStr = file_text_read_string(f); file_text_readln(f);
global.newSelloutStr = file_text_read_string(f); file_text_readln(f);

file_text_close(f);

if (global.selloutStr != global.newSelloutStr)
    global.sellout = false;
