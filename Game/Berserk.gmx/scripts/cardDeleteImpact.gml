///cardDeleteImpact(obj* id)
var ind = argument0,
    p = -1;
for (var i = 0, c = ds_list_size(impacts) / THINGS_IN.IMPACT; i < c; i++)
{
    p = i * 2;
    if (impacts[| p + 1] == ind)
    {
        break;
    }   
}   
// delete
if (p == -1)
    // he died : - (
    exit;
// now clear the action of impact
var imp = impacts[| p];
switch (imp)
{
case CARDS.GOLEM_MENTOR:
    cardChangeDmg(-2);
    break;
}

repeat (THINGS_IN.IMPACT)
{
    ds_list_delete(impacts, p);
}
