var f = file_text_open_write("save.sav");

// Language
file_text_write_string(f, global.language); file_text_writeln(f);

// Name
file_text_write_string(f, global.name); file_text_writeln(f);

// Writing deck
file_text_write_string(f, ds_list_write(global.deck)); file_text_writeln(f);

// Writing winns and loses
file_text_write_real(f, global.wins); file_text_writeln(f);
file_text_write_real(f, global.loses); file_text_writeln(f);

file_text_close(f);
