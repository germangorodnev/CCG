///sendFrase(string frase)
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_u16, CL_CHAT_FRASE);
buffer_write(buff, buffer_string, global.serverName); // our name
buffer_write(buff, buffer_string, argument0);
network_send_packet(client, buff, buffer_tell(buff));
