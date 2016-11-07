///changeGameState(GAME_STATES new)
if (global.gameState == argument0) // LUL
    exit;
global.gameState = argument0;
with (oClient)
    setGameState(argument0); // set our local state
// send to our enemy
buffer_seek(playerBuffer, buffer_seek_start, 0);
buffer_write(playerBuffer, buffer_u16, SR_CHANGE_GAME_STATE);
buffer_write(playerBuffer, buffer_u8, argument0);
network_send_packet(opSocket, playerBuffer, buffer_tell(playerBuffer));


