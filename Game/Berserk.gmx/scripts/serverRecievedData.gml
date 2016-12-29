var buff = async_load[? "buffer"];
var sock = async_load[? "id"];

var cmd = buffer_read(buff, buffer_u16);

switch (cmd)
{
case CL_CMPINF:
    if (serverCardCompare(buff)) // SO GOOD
    {
        endTurn();
        beginTurn();
    }
    else
    {
        // SEND INF TO THE ENEMY CLIENT
        show_message("wrong");
        beginTurn();
    }
    break;

case CL_CONNECT_INF:
    if (opIP == 0)
        exit;
    // Getting initial information about the player (name, deck)
    global.opName = buffer_read(buff, buffer_string);
    ds_list_clear(opDeck);
    ds_list_read(opDeck, buffer_read(buff, buffer_string));
    global.opWins = buffer_read(buff, buffer_u16);
    global.opLoses = buffer_read(buff, buffer_u16);
    var n = global.opName;
    with (oClient)
    {
        addChatFrase(getFraseLang("conn", -1), n);
    }
    // send our nickname
    buffer_seek(playerBuffer, buffer_seek_start, 0);
    buffer_write(playerBuffer, buffer_u16, SR_NICKNAME);
    buffer_write(playerBuffer, buffer_string, global.name);
    network_send_packet(opSocket, playerBuffer, buffer_tell(playerBuffer));    
    break;
    
case CL_PING: // just make sure it's alive
    break;
    
case CL_CHAT_FRASE: // recieved a frase 
    // write in our local chat
    // we need to send to our enemy
    var n = buffer_read(buff, buffer_string);
    var s = buffer_read(buff, buffer_string);
    with (oClient)
    {
        addChatFrase(n, s);
    }
    if (opSocket != -1)
    {
        buffer_seek(playerBuffer, buffer_seek_start, 0);
        buffer_write(playerBuffer, buffer_u16, SR_CHAT_FRASE);
        buffer_write(playerBuffer, buffer_string, n); // name itself
        buffer_write(playerBuffer, buffer_string, s); // frase itself
        network_send_packet(opSocket, playerBuffer, buffer_tell(playerBuffer));
    }
    break;

    
     
case CL_RESPOND: // just a signal that client made something we told him to do
    switch (buffer_read(buff, buffer_u16)) // SR_...
    {
    case SR_TO_NEXT_ROOM:
        if (global.gameState == GAME_STATES.CARD_PREPARE)
        {
            buffer_seek(playerBuffer, buffer_seek_start, 0);
            buffer_write(playerBuffer, buffer_u16, SR_GAME_INIT);
            for (var i = 0; i < global.cardsOnBoard * 2; i++)
            {
                var c = instance_find(oCard, i);
                buffer_write(playerBuffer, buffer_u16, c.type);
            }
            network_send_packet(opSocket, playerBuffer, buffer_tell(playerBuffer));
        }
        break;
    case SR_GAME_INIT: // he initialised the game, now prep zero turns and play
        changeGameState(GAME_STATES.ZERO_TURN);
        global.AP = 0;
        break;
    case SR_CHANGE_GAME_STATE:
        var st = buffer_read(buff, buffer_u16); // GAME_STATES
        if (st == GAME_STATES.ZERO_TURN)
            changeGameState(GAME_STATES.PERFORM_ACTIONS);
        break;
    case SR_NEXT_TURN:
    
        break;
    }
    break;    
    
        
case CL_ENDED_TURN: // client ended turn, so we have to read player card's decisions
    if (sock != opSocket) 
    {
        // it's from our client, need to send
        global.turnDone = true;
        buffer_seek(playerBuffer, buffer_seek_start, 0);
        buffer_write(playerBuffer, buffer_u16, SR_OTHER_PLAYER_ACTIONS);
        buffer_write(playerBuffer, buffer_u8, ds_list_size(global.cards));
        var b = playerBuffer;
        for (var i = 0, c = ds_list_size(global.cards); i < c; i++)
        {
            var card = global.cards[| i];
            // pack and send
            with (card)
            {
                cardWriteAction(b);
            }
        }
        network_send_packet(opSocket, playerBuffer, buffer_tell(playerBuffer));        
    }
    else
    {
        // that is from other player
        global.opTurnDone = true;  
        var c = buffer_read(buff, buffer_u8);      
        for (var i = 0; i < c; i++)
        {
            /*var card = global.opCards[| i];
            ds_list_clear(card.actions);
            ds_list_read(card.actions, buffer_read(buff, buffer_string));*/
            var _x, _y, _type, _actions;
            _x = buffer_read(buff, buffer_s16);
            _y = room_height - buffer_read(buff, buffer_s16);
            _type = buffer_read(buff, buffer_u16);
            var card = instance_position(_x, _y, oCardBase);
            if (card != noone)
            {
                if (card.type == _type)
                {
                    ds_list_clear(card.actions);
                    ds_list_read(card.actions, buffer_read(buff, buffer_string));
                }
            }
        }
    }
    // check if both players have send the actions
    if (global.turnDone && global.opTurnDone)
    {
        // WOO HO NEXT STATE
        changeGameState(GAME_STATES.PERFORM_ACTIONS);
    }
    break;
    
case CL_ENDED_ACTION_PERFORM: // he is done
    if (sock == opSocket)
    {
        // other player is done
        global.opDone = true;
    }
    else
    {
        // our player is done
        global.playerDone = true;
    }
    if (global.playerDone && global.opDone)
    {
        if (global.gameState != GAME_STATES.CHOOSE_ACTIONS)
        {
            changeGameState(GAME_STATES.COMPARING_CARDS);
            // move to the next turn
            //endTurn();
            //beginTurn();
        }
    }
    break;
}

