if (global.decksCount == 0)
    room_goto(rMainMenu);
with (oArrowDeck)
    instance_destroy();
if (i < global.decksCount - 1)
    // to the right
{
    instance_create(rx, ry, oArrowDeck);
}
if (i > 0)
{
    var a = instance_create(lx, ry, oArrowDeck);
    a.dir = 1; // left
    a.image_xscale = -1;
}

