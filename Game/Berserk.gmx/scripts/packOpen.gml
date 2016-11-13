var xb = global.guiW / 2,
    yb = global.guiH / 2,
    l = 200;
switch (type)
{
case 3: //  three cards
    var angle = 50;
    repeat (3)
    {
        var c = instance_create(xb + lengthdir_x(l, angle), yb + lengthdir_y(l, angle), oCardDeck);
        c.type = packGetRandomCardType(3);
        c.mode = 1;
        with (c)
            dmCardInit();
        angle += 120;   
    }
    global.packs3--;
    count--;
    cnt = string(count);
    break;
case 5:
    var angle = 50;
    repeat (5)
    {
        var c = instance_create(xb + lengthdir_x(l, angle), yb + lengthdir_y(l, angle), oCardDeck);
        c.type = packGetRandomCardType(5);
        c.mode = 1;
        with (c)
            dmCardInit();
        angle += 72;   
    }
    global.packs5--;
    count--;
    cnt = string(count);
    break;
}
