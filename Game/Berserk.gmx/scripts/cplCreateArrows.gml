with (oCardPlaceUI)
{
with (oArrowScroll)
    instance_destroy();
var hf = ds_list_size(localDeck) / 2;

if (dMax < ds_list_size(localDeck) / 2)
{
    a = instance_create(btrx, bty, oArrowScroll);
    a.type = "cp";
}
if (dMin != 0)
{
    a = instance_create(btlx, bty, oArrowScroll);
    a.type = "cp";
    a.dir = 1;
    a.image_xscale = -1;
}
}
/*
if (iMin == 0) // just one site
{
    if (iMax < hf)
    {
        // to the right
        instance_create(btrx, bty, oArrowScroll);
    }
}
else if (iMax - iMin < crow * 2)
{
    var a = instance_create(btlx, bty, oArrowScroll);
    a.dir = 0;
    a.image_xscale = -1;
}
