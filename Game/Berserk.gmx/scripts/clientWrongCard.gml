///Send signal to give us FULL INF about cards
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_u16, CL_MISSINF);
network_send_packet(client, buff, buffer_tell(buff));
