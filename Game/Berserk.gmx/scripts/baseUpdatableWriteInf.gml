///baseUpdatableWriteInf(buffer*)
var spr = sprite_index,
    ypos = y;
if (object_index == oAttack)
{
    spr = sCursor; // DEBUG
    ypos = room_height - y;
}
buffer_write(argument0, buffer_s16, spr);
buffer_write(argument0, buffer_s16, image_index);
buffer_write(argument0, buffer_s16, x);
buffer_write(argument0, buffer_s16, ypos);
buffer_write(argument0, buffer_s16, image_angle);
