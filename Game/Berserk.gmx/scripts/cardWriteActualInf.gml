///cardWriteActualInf(buffer*)
buffer_write(argument0, buffer_s16, x);
buffer_write(argument0, buffer_s16, y);
buffer_write(argument0, buffer_u16, type);
buffer_write(argument0, buffer_u8, hp);
buffer_write(argument0, buffer_u8, armor);
buffer_write(argument0, buffer_u8, dmg);
buffer_write(argument0, buffer_string, ds_list_write(actions));
buffer_write(argument0, buffer_string, ds_list_write(resists));
buffer_write(argument0, buffer_string, ds_list_write(debuffs));
buffer_write(argument0, buffer_string, ds_list_write(buffs));
buffer_write(argument0, buffer_string, ds_list_write(impacts));


