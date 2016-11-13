var t = async_load[? "type"];
var sock = async_load[? "socket"];
var ip = async_load[? "ip"];
var cId = async_load[? "id"];

if (t == network_type_connect) // Someone connected
{
    switch (room)
    {
    case rLobby:
        // Someone joined while in the lobby
        if (ip != "127.0.0.1" && opIP == 0)
        {
            opSocket = sock;
            opIP = ip;
        }
        else
        {
            opSocket = -1;
            opIP = 0;
        }
        break;
    default:
        // NO WAY
        // DO NOT DO SHIT
        break;
    }
}
else if (t == network_type_disconnect) // Someone went away
{
    switch (room)
    {
    case rLobby: // just discard him
        var n = global.opName;
        with (oClient)
        {
            addChatFrase(getFraseLang("disc"), n);
        }
        ds_list_clear(opDeck);
        global.opName = "Player";
        opIP = 0;
        opSocket = -1;
        global.client = -1;
        break;
    case rGame:  // we won
        ds_list_clear(opDeck);
        global.opName = "Player";
        opIP = 0;
        opSocket = -1;
        global.client = -1;
        break;  
    default:
        break;      
    }
}
