///windowInitialiseAboutCard(id, bool inGameIncludeDbBff)
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
    if (argument1)
    {
        // Debuffs
        if (ds_list_size(debuffs) > 0)
        {
        str += "----------------------------------------------------#";
        for (var i = 0, c = ds_list_size(debuffs); i < c; i++)
        {
            var db = debuffs[| i];
            switch (db[| 0])
            {
            case DEBUFFS.POISON:
                str += getFraseLang("dbf", DEBUFFS.POISON) + ": " + string(db[| 1]) + getFraseLang("turns", -1) + " " + string(db[| 2]) + getFraseLang("dmg", -1) + "#";
                break;
            case DEBUFFS.STUN: // oops, you just pass the turn, dude!
                str += getFraseLang("dbf", DEBUFFS.STUN) + ": " + string(db[| 1]) + getFraseLang("turns", -1) + "#";
                break;
            case DEBUFFS.CAVALRY:
                str += getFraseLang("dbf", DEBUFFS.CAVALRY) + ": " + string(db[| 1]) + getFraseLang("turns", -1) + "#";
                break;
            case DEBUFFS.MECHANIC_ATTACK:
                str += getFraseLang("dbf", DEBUFFS.MECHANIC_ATTACK) + ": " + string(db[| 1]) + getFraseLang("turns", -1) + " 1 " + getFraseLang("dmg", -1) + "#";
                break;
            }
        }
        }
        // Buffs
        if (ds_list_size(buffs) > 0)
        {
        str += "----------------------------------------------------#";
        for (var i = 0, c = ds_list_size(buffs); i < c; i++)
        {
            var bf = buffs[| i];            
            var turnsRem = getFraseLang("integer", bf[| 1]);
            if (turnsRem != "")
                turnsRem = ": " + turnsRem + getFraseLang("turns", -1);
            str += getFraseLang("bf", bf[| 0]) + turnsRem + "#";
        }
        }
        // Constant buffs
        if (ds_list_size(cbuffs) > 0)
        {
        str += "----------------------------------------------------#";
        for (var i = 0, c = ds_list_size(cbuffs); i < c; i++)
        {
            var bf = cbuffs[| i];            
            str += bf + "#";
        }
        }                        
    }
    windowInitialise(global.guiW / 2, global.guiH / 2, str, 24, 1000, 1, true);
}
