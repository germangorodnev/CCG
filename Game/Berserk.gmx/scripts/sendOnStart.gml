// go to buffer start
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_u16, CL_CONNECT_INF);
buffer_write(buff, buffer_string, global.name);
buffer_write(buff, buffer_string, ds_list_write(global.deck));

// Send the packet
network_send_packet(client, buff, buffer_tell(buff));
