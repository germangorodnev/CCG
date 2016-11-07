///sendEvent(EVENTS ev, bool value)
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_u16, CL_EVENT);
buffer_write(buff, buffer_u16, argument0);
buffer_write(buff, buffer_bool, argument1);
network_send_packet(client, buff, buffer_tell(buff));
