global.turnDone = false;
global.opTurnDone = false;
global.playerDone = false;
global.opDone = false;
global.gameState = GAME_STATES.CHOOSE_ACTIONS;
with (oClient)
{
    clientBeginTurn();
}
// Send to the other client
buffer_seek(playerBuffer, buffer_seek_start, 0);
buffer_write(playerBuffer, buffer_u16, SR_NEXT_TURN);
network_send_packet(opSocket, playerBuffer, buffer_tell(playerBuffer));
