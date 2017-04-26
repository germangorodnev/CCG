/// We've ended all our decisions, now have to wait\begin the performing
// send to the other player
with (oClient)
{
    buffer_seek(buff, buffer_seek_start, 0);
    buffer_write(buff, buffer_u16, CL_ENDED_TURN);
    var b = buff;
    buffer_write(buff, buffer_u8, ds_list_size(global.cards));
    for (var i = 0, c = ds_list_size(global.cards); i < c; i++)
    {
        var card = global.cards[| i];
        // pack and send
        with (card)
        {
            cardActionConfirm();
            cardWriteAction(b);
        }
    }
    network_send_packet(client, buff, buffer_tell(buff));
    clientSetState(CLIENT_STATES.WAIT);
}
