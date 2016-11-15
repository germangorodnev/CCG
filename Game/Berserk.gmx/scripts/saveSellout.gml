var f = file_text_open_write("sellout.col");

// read the sellout we bought
file_text_write_string(f, global.selloutStr); file_text_writeln(f);
file_text_write_string(f, global.newSelloutStr); file_text_writeln(f);

file_text_close(f);
