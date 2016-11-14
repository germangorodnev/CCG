var xb = oPackOpener.xc,
    yb = oPackOpener.yc - 75,
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
        c.image_xscale = 0.05;
        c.image_yscale = 0.05;
        c.xscN = 1;
        c.yscN = 1;
        // MLG
        part_emitter_region(global.packOpenPs, em, c.x, c.x, c.y, c.y, ps_shape_ellipse, ps_distr_invgaussian);
        part_emitter_burst(global.packOpenPs, em, global.randomMLG, 20 * c.type);
        with (c)
            dmCardInit();
        angle += 120;   
        if (c.type >= 1)
            audio_play_sound(sndHorn, 100, false);
    }
    global.packs3--;
    count--;
    cnt = string(count);
    audio_play_sound(sndTRIPLE, 100, false);
    break;
case 5:
    var angle = 90;
    repeat (5)
    {
        var c = instance_create(xb + lengthdir_x(l, angle), yb + lengthdir_y(l, angle), oCardDeck);
        c.type = packGetRandomCardType(5);
        c.mode = 1;
        c.image_xscale = 0.05;
        c.image_yscale = 0.05;
        c.xscN = 1;
        c.yscN = 1;
        // MLG
        part_emitter_region(global.packOpenPs, em, c.x, c.x, c.y, c.y, ps_shape_ellipse, ps_distr_invgaussian);
        part_emitter_burst(global.packOpenPs, em, global.randomMLG, 10 * c.type);
        with (c)
            dmCardInit();
        angle += 72;   
    }
    global.packs5--;
    count--;
    cnt = string(count);
    break;
}
// OK BT
instance_create(xb, yb + 320, oOk);
audio_play_sound(sndBOOM, 100, 0);

