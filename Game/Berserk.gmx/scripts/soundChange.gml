switch (global.sound)
{
case false:
    global.sound = true;
    with (oMusicController)
        event_perform(ev_other, ev_room_start);
    on = 25;
    noton = 24;
    break;
case true:
    global.sound = false;
    audio_stop_all();
    with (oMusicController)
        currM = -1;
    on = 27;
    noton = 26;
    break;
}
