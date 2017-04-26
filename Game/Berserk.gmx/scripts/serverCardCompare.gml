///serverCardCompare(Buffer* buff)
var w = global.cardsOnBoard / 2;
var xB = CARD_X - (w - 5) * 64;
var yB = room_height - CARD_Y;

// first compare with our own cards in bottom 
var ourCnt = buffer_read(argument0, buffer_u8);
for (var i = 0; i < ourCnt; i++)
{
    var a = instance_position(xB + (i % w) * 128, CARD_Y + (i div w) * 128, oCard);
    var isThere = buffer_read(argument0, buffer_bool);
    if (!isThere)
    {
        if (a == noone)
        {
            continue;
        }
    }
    else
    {
        if (a != noone)
        {
            // read type, hp arm dmg
            var _type, _hp, _armor, _dmg, _mana;
            _type = buffer_read(argument0, buffer_u16);
            _hp = buffer_read(argument0, buffer_u8);
            _armor = buffer_read(argument0, buffer_u8);
            _dmg = buffer_read(argument0, buffer_u8);
            _mana = buffer_read(argument0, buffer_u8);
            if (cardCompareParams(a, _type, _hp, _armor, _dmg, _mana))
                continue;
            else
            {
                show_message("НУ НЕ СОВПАДАЕТ. НУ ЧЕ ТЫ МУДАК ТО ТАКОЙ");
            }
        }
    }
}

// good so far
// now compare enemy cards (on the top)
var otherCnt = buffer_read(argument0, buffer_u8);
for (var i = 0; i < otherCnt; i++)
{
    var a = instance_position(xB + (i % w) * 128, yB - (i div w) * 128, oCardBase);
    var isThere = buffer_read(argument0, buffer_bool);
    if (!isThere)
    {
        if (a == noone)
        {
            continue;
        }
    }
    else
    {
        if (a != noone)
        {
            // read type, hp arm dmg
            var _type, _hp, _armor, _dmg, _mana;
            _type = buffer_read(argument0, buffer_u16);
            _hp = buffer_read(argument0, buffer_u8);
            _armor = buffer_read(argument0, buffer_u8);
            _dmg = buffer_read(argument0, buffer_u8);
            _mana = buffer_read(argument0, buffer_u8);
            if (cardCompareParams(a, _type, _hp, _armor, _dmg, _mana))
                continue;
            else
            {
                show_message("НУ НЕ СОВПАДАЕТ. НУ ЧЕ ТЫ МУДАК ТО ТАКОЙ");
            }
        }
    }
}
return true;

