///cardWriteAction(buffer*)
// x
buffer_write(argument0, buffer_s16, x);
// y
buffer_write(argument0, buffer_s16, y);
// type
buffer_write(argument0, buffer_u16, type);
// actions
var encoded = ds_list_write(actions);
buffer_write(argument0, buffer_string, encoded);

