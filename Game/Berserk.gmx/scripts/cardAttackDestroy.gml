if (parent != noone)
{
    if (instance_exists(parent))
    {
        with (parent)
            cardDone();
    }
}           
instance_destroy();

