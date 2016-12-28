///gamePlaySound(snd, prior, loop, checkforsingle)
if (!global.sound)
    exit;
if (!argument3)
    audio_play_sound(argument0, argument1, argument2);
else
{
    if (!audio_is_playing(argument0))
        audio_play_sound(argument0, argument1, argument2);
}

