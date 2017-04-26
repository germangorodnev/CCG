with (oClient)
{
    buffer_seek(buff, buffer_seek_start, 0);
    buffer_write(buff, buffer_u16, CL_HAND_DONE);
    // write card inf
    var w = global.cardsOnBoard / 2;
    var xB = CARD_X - (w - 5) * 64;
    for (var i = 0; i < global.cardsOnBoard; i++)
    {
        var a = instance_position(xB + (i % w) * 128, CARD_Y + (i div w) * 128, oCard);
        buffer_write(buff, buffer_u16, a.type);
    }
    
    network_send_packet(client, buff, buffer_tell(buff));
}
