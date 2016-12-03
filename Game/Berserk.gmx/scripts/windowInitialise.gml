///windowInitialise(x0, y0, string, sep, maxw in pix, alpha, centered)
var t = argument2, 
    sep = argument3,
    maxw = argument4,
    center = argument6,
    x0 = argument0,
    y0 = argument1;
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fGame);
var textw = ceil(string_width_ext(t, sep, maxw) + 50),
    texth = ceil(string_height_ext(t, sep, maxw));    
if (center)
{
    x0 = ceil(x0 - (textw + 20) / 2);
    y0 = ceil(y0 - (texth + 20) / 2);
}
var w = instance_create(x0, y0, oWindow);
w.text = t;
w.sep = sep;
w.maxw = maxw;
w.tW = textw;
w.tH = texth + 22;
w.a = argument5;

with (w)
{
    // top border
    topW = ceil(tW / sprite_get_width(sWindT) - 1);
    leftH = ceil(tH / sprite_get_height(sWindL) - 1);
    centerW = ceil(tW / sprite_get_width(sWindInn) - 1.7);
    centerH = ceil(tH / sprite_get_height(sWindInn) - 1.5);
}
return w;
