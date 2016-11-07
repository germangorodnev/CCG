var f = file_text_open_write("save.sav");

// Name
file_text_write_string(f, global.name); file_text_writeln(f);

// Writing deck
file_text_write_string(f, ds_list_write(global.deck)); file_text_writeln(f);

file_text_close(f);
