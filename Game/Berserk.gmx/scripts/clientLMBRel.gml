///clientLMBRel(buffer*)
var val = buffer_read(argument0, buffer_bool);
// client's current state
var clState = buffer_read(argument0, buffer_u16);
// need x and y
var xclick = buffer_read(argument0, buffer_s16),
    yclick = buffer_read(argument0, buffer_s16);
if (!val)
    exit; // he didn't clicked, exit
    
switch (clState)
{
case CLIENT_STATES.CHOOSING_CARD: 
    // 1st part - he chooses card
    // it means that he clicked (probably) on his own card
    // reverse y
    yclick = room_height - yclick;
    var card = instance_position(xclick, yclick, oCardBase);
    if (card != noone) // he ACTUALLY clicked on a card there
    {
        if (card.action == -1) // if we haven't choosen an action yet
        {
            if (card.player == 1) // it's HIS card
            {
                // need to tell him the card he clicked on
                buffer_seek(playerBuffer, buffer_seek_start, 0);
                buffer_write(playerBuffer, buffer_u16, SR_CARD_RESPONSE);
                buffer_write(playerBuffer, buffer_u16, card.type); // sending the type of the card to craeate an event GUI there
                network_send_packet(opSocket, playerBuffer, buffer_tell(playerBuffer));
            }
        }
    }
    break;
case CLIENT_STATES.CHOOSING_TARGET:

    break;
case CLIENT_STATES.CHOOSING_TARGET: // he decided to click on our card, maybe?

    break;
}

