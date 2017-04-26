with (oServer)
{
    buffer_seek(playerBuffer, buffer_seek_start, 0);
    buffer_write(playerBuffer, buffer_u16, SR_TO_NEXT_ROOM);
    buffer_write(playerBuffer, buffer_u8, global.cardsOnBoard);
    buffer_write(playerBuffer, buffer_string, global.cardPlaceType);
    network_send_packet(opSocket, playerBuffer, buffer_tell(playerBuffer));
}
