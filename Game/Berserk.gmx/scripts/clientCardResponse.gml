///clientCardResponse(buffer*)
// frist: which state are we in?
switch (global.clientState)
{  
case CLIENT_STATES.CHOOSING_CARD: // we were choosing a card, now we recived a response
    var cardType = buffer_read(argument0, buffer_u16);
    // we know the card, we know that it doesnt have an action yet
    var a = instance_create(0, 0, oCardActionChoose);
    with (a)
        cardActionChooserInit(cardType);
    break;
}
