var xb = oPackOpener.xc,
    yb = oPackOpener.yc - 75,
    l = 200;
var angle = 50, 
    anglePlus = 120;
    
if (type == 5)
{
    angle = 90;
    anglePlus = 72;
}

repeat (type)
{
    var c = instance_create(xb + lengthdir_x(l, angle), yb + lengthdir_y(l, angle), oCardDeck);
    var t = packGetRandomCardType(type);
    c.type = t;
    c.mode = 1;
    c.image_xscale = 0.05;
    c.image_yscale = 0.05;
    c.xscN = 1;
    c.yscN = 1;
    with (c)
        dmCardInit();
    var rarity = c.rarity;
    // MLG
    part_emitter_region(global.packOpenPs, em, c.x, c.x, c.y, c.y, ps_shape_ellipse, ps_distr_invgaussian);
    part_emitter_burst(global.packOpenPs, em, global.randomMLG, 20 * (rarity + 1));
    if (rarity == 1)
    {
        if (!audio_is_playing(sndHorn))
            audio_play_sound(sndHorn, 100, false);
    }
    else if (rarity == 2)
    {
        if (!audio_is_playing(sndDAMN))
            audio_play_sound(sndDAMN, 100, false);        
    }
    else
    {        
        if (!audio_is_playing(sndBOOM))
            audio_play_sound(sndBOOM, 100, 0);
    }
    gameAddCardToCollection(t, 1);
    angle += anglePlus;   
}

switch (type)
{
case 3:
    global.packs3--;
    break;
case 5:
    global.packs5--;
    break;
}

count--;
cnt = string(count);

// OK BT
instance_create(xb, yb + 320, oOk);
saveGame();
