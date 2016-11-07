///drawTextOutline(x, y, str, strCol, outcol, xsc, ysc, angle, alpha)
//Created by Andrew McCluskey http://nalgames.com/
//x,y: Coordinates to draw
//str: String to draw
//outwidth: Width of outline in pixels
//outcol: Colour of outline (main text draws with regular set colour)
//outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)

var strCol = argument3,
    outCol = argument4,
    xsc = argument5,
    ysc = argument6,
    angle = argument7,
    alpha = argument8;

// first - the outline
draw_text_transformed_colour(argument0 - 1, argument1, argument2, xsc, ysc, angle, outCol, outCol, outCol, outCol, alpha);
draw_text_transformed_colour(argument0 + 1, argument1, argument2, xsc, ysc, angle, outCol, outCol, outCol, outCol, alpha);
draw_text_transformed_colour(argument0, argument1 - 1, argument2, xsc, ysc, angle, outCol, outCol, outCol, outCol, alpha);
draw_text_transformed_colour(argument0, argument1 + 1, argument2, xsc, ysc, angle, outCol, outCol, outCol, outCol, alpha);

// the text
draw_text_transformed_colour(argument0, argument1, argument2, xsc, ysc, angle, strCol, strCol, strCol, strCol, alpha);

