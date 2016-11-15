var f = file_text_open_write("save.sav");

// Language
file_text_write_string(f, global.language); file_text_writeln(f);

// Name
file_text_write_string(f, global.name); file_text_writeln(f);

file_text_write_real(f, global.decksCount); file_text_writeln(f);
for (var i = 0; i < global.decksCount; i++)
{
    file_text_write_string(f, ds_list_write(global.decks[| i])); file_text_writeln(f);
}

// Writing winns and loses
file_text_write_real(f, global.wins); file_text_writeln(f);
file_text_write_real(f, global.loses); file_text_writeln(f);

// card collection
file_text_write_string(f, ds_list_write(global.collection)); file_text_writeln(f);

// boosters
file_text_write_real(f, global.packs3); file_text_writeln(f);
file_text_write_real(f, global.packs5); file_text_writeln(f);

// money
file_text_write_real(f, global.money); file_text_writeln(f);

file_text_close(f);
