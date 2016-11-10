// woo ho
with (oPlaceNotFree)   
    instance_destroy();
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_u16, CL_ENDED_ACTION_PERFORM);
network_send_packet(client, buff, buffer_tell(buff));

