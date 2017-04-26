var BUFFER = buff;
buffer_seek(BUFFER, buffer_seek_start, 0);
buffer_write(BUFFER, buffer_u16, CL_CMPINF);

var w = global.cardsOnBoard / 2;
var xB = CARD_X - (w - 5) * 64;
var yB = room_height - CARD_Y;

// first - enemy cards 
var cnt = 0;
for (var i = 0; i < global.cardsOnBoard; i++)
{
    var a = instance_position(xB + (i % w) * 128, yB - (i div w) * 128, oCardBase);
    if (a == noone)
        continue;
    cnt++;
}
buffer_write(BUFFER, buffer_u8, cnt);

for (var i = 0; i < cnt; i++)
{
    var a = instance_position(xB + (i % w) * 128, yB - (i div w) * 128, oCardBase);
    if (a == noone)
    {
        buffer_write(BUFFER, buffer_bool, false);
    }
    else
    {
        buffer_write(BUFFER, buffer_bool, true);
        with (a)
        {
            buffer_write(BUFFER, buffer_u16, type);
            buffer_write(BUFFER, buffer_u8, hp);
            buffer_write(BUFFER, buffer_u8, armor);
            buffer_write(BUFFER, buffer_u8, dmg);
            buffer_write(BUFFER, buffer_u8, mana);
        }
    }
}

// Our own cards
cnt = 0;
for (var i = 0; i < global.cardsOnBoard; i++)
{
    var a = instance_position(xB + (i % w) * 128, CARD_Y + (i div w) * 128, oCard);
    if (a == noone)
        continue;
    cnt++;
}
buffer_write(BUFFER, buffer_u8, cnt);

// now our cards
for (var i = 0; i < global.cardsOnBoard; i++)
{
    var a = instance_position(xB + (i % w) * 128, CARD_Y + (i div w) * 128, oCard);
    if (a == noone)
    {
        buffer_write(BUFFER, buffer_bool, false);
    }
    else
    {
        buffer_write(BUFFER, buffer_bool, true);
        with (a)
        {
            buffer_write(BUFFER, buffer_u16, type);
            buffer_write(BUFFER, buffer_u8, hp);
            buffer_write(BUFFER, buffer_u8, armor);
            buffer_write(BUFFER, buffer_u8, dmg);
            buffer_write(BUFFER, buffer_u8, mana);
        }
    }
}

network_send_packet(client, BUFFER, buffer_tell(BUFFER));


