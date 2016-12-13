buffer_seek(playerBuffer, buffer_seek_start, 0);
buffer_write(playerBuffer, buffer_u16, SR_TRUE_INF);
buffer_write(playerBuffer, buffer_u8, ds_list_size(global.cards));
var b = playerBuffer;
for (var i = 0, c = ds_list_size(global.cards); i < c; i++)
{
    var card = global.cards[| i];
    // pack and send
    with (card)
    {
        cardWriteActualInf(b);
    }
}
network_send_packet(opSocket, playerBuffer, buffer_tell(playerBuffer));        

