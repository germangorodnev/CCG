///winLoseInit(bool win)
if (argument0)
{
    var a = instance_create(0, 0, oWinLose);
    a.win = true;
    a.spr = sWin;
    with (a)
    {
        part_emitter_burst(global.packOpenPs, em, global.coin, irandom_range(100, 150));
    }
}
else
{
    var a = instance_create(0, 0, oWinLose);
    a.win = true;
    a.spr = sLose;
}
instance_create(global.guiW / 2, global.guiH / 2 + 100, oOk);
