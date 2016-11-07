/// write information in global.playerBuffer
if (player == 0)
{
    // i'm on the bottom on server
    buffer_write(argument0, buffer_s16, sprite_index);
    buffer_write(argument0, buffer_s16, image_index);
    buffer_write(argument0, buffer_s16, x);
    buffer_write(argument0, buffer_s16, room_height - y);
    buffer_write(argument0, buffer_s16, image_angle);
}
else
{
    // i'm on the bottom on server
    buffer_write(argument0, buffer_s16, sprite_index);
    buffer_write(argument0, buffer_s16, image_index);
    buffer_write(argument0, buffer_s16, x);
    buffer_write(argument0, buffer_s16, room_height - y);
    buffer_write(argument0, buffer_s16, image_angle);
}
