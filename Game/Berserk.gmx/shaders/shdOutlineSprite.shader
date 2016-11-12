//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D u_texture;
uniform vec4 v_needOutlineCol;
uniform vec2 size;

void main()
{    
    vec4 total = vec4(0.0);
    vec4 grabPixel;

    total +=        texture2D(gm_BaseTexture, v_vTexcoord + vec2(-1.0 / size.x, -1.0 / size.y));
    total +=        texture2D(gm_BaseTexture, v_vTexcoord + vec2(1.0 / size.x, -1.0 / size.y));
    total +=        texture2D(gm_BaseTexture, v_vTexcoord + vec2(1.0 / size.x, 1.0 / size.y));
    total +=        texture2D(gm_BaseTexture, v_vTexcoord + vec2(-1.0 / size.x, 1.0 / size.y));

    grabPixel =     texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.0, -1.0 / size.y));
    total += grabPixel * 2.0;

    grabPixel =     texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.0, 1.0 / size.y));
    total += grabPixel * 2.0;

    grabPixel =     texture2D(gm_BaseTexture, v_vTexcoord + vec2(-1.0 / size.x, 0.0));
    total += grabPixel * 2.0;

    grabPixel =     texture2D(gm_BaseTexture, v_vTexcoord + vec2(1.0 / size.x, 0.0));
    total += grabPixel * 2.0;

    grabPixel = texture2D(gm_BaseTexture, v_vTexcoord);
    total += grabPixel * 4.0;

    total *= 1.0 / 16.0;

    gl_FragColor = vec4(v_needOutlineCol.r, v_needOutlineCol.g, v_needOutlineCol.b, 1.0) * texture2D( gm_BaseTexture, v_vTexcoord );
}


