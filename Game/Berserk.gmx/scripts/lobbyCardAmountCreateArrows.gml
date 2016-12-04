with (oCardAmountChange)
    instance_destroy();
if (global.cardsOnBoard > 4)
{
    // bottom
    var a = instance_create(976, 424, oCardAmountChange);
    a.dir = "-";
    a.image_angle = 270;
}
if (global.cardsOnBoard < 20)
{
    //top
    instance_create(976, 310, oCardAmountChange);
}
