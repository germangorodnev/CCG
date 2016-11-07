state = CARD_STATES.DONE_ACTION;
with (oClient)
{
    if (clientCheckCardsDone())
    {
        clientEndPerforming();
    }
}
