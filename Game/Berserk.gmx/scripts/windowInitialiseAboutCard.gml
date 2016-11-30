///windowInitialiseAboutCard(id)
with (oWindow)
    instance_destroy();
with (argument0)
{
    var str = "";
    str += '(' + classStr + ')#' + desc + '#';
    var numb = 1;
    for (var i = 0; i < actionsCount - 1; i++)
    {
        if (actionsNames[i] == '') 
            continue;
        str += string(numb) + ') ' + actionsNames[i] + '#';
        numb++;
    }
    windowInitialise(global.guiW / 2, global.guiH / 2, str, 24, 1000, 1, true);
}
