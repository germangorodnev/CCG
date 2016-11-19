with (oArrowScroll)
    instance_destroy();
instance_create(btrx, bty, oArrowScroll);
var a = instance_create(btlx, bty, oArrowScroll);
a.dir = 1;
a.image_xscale = -1;
/*var hf = ds_list_size(localCol) / 2;
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
