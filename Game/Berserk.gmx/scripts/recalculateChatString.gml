///recalculateChatStr(int beginIndex)
chatStr = "";
var p = 0;
for (var i = 0, c = ds_list_size(chat) / 2; i < c; i++)
{
    chatStr += chat[| p++] + ": " + chat[| p++];
    // calculate height
    var h = string_height_ext(chatStr, chatSep, chatMaxW);
    if (h > chatMaxH)
    {
        // we just erase frase on pos 0
        ds_list_delete(chat, 0);
        ds_list_delete(chat, 0);        
        recalculateChatString(0);
        exit;
    }
    chatStr += "#";
}

