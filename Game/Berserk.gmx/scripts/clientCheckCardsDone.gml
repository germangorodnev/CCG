// all cards should be done
with (oCardBase)
{
    if (state != CARD_STATES.DONE_ACTION)
        return false;
}
if (instance_exists(oCardStuff))
    return false;
return true;
