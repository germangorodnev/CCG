/// performing debuffs
actionPos = -1;
canTurn = true;
for (var i = 0, c = ds_list_size(debuffs); i < c; i++)
{
    var db = ds_list_find_value(debuffs, i);
    if (is_undefined(db))
    {
        c = ds_list_size(debuffs);
        continue;
    }
    switch (db[| 0])
    {
    case DEBUFFS.POISON:
        if (ds_list_find_index(resists, DEBUFFS.POISON) == -1)
        {
            if (db[| 1] == 0)
            {
                ds_list_delete(debuffs, ds_list_find_index(debuffs, db));
                continue;
            }
            cardChangeHp(-db[| 2]);
            --db[| 1];
        }
        else
        {
            ds_list_delete(debuffs, ds_list_find_index(debuffs, db));        
        }   
        break;
    case DEBUFFS.STUN: // oops, you just pass the turn, dude!
        if (ds_list_find_index(resists, DEBUFFS.STUN) == -1)
        {
            if (db[| 1] == 0)
            {
                ds_list_delete(debuffs, ds_list_find_index(debuffs, db));
                canTurn = true;
                continue;
            }
            cardSetState(CARD_STATES.ACTION_CHOOSEN);
            canTurn = false;
            --db[| 1];
        }
        else
        {
            ds_list_delete(debuffs, ds_list_find_index(debuffs, db));        
            canTurn = true;
        }   
        break;
    case DEBUFFS.CAVALRY:
        if (ds_list_find_index(resists, DEBUFFS.CAVALRY) == -1)
        {
            if (db[| 1] == 0)
            {
                ds_list_delete(debuffs, ds_list_find_index(debuffs, db));
                cardChangeHp(3);
                continue;
            }
            --db[| 1];
        }
        else
        {
            ds_list_delete(debuffs, ds_list_find_index(debuffs, db));        
        }       
        break;
    }
    c = ds_list_size(debuffs);
}

// performing buffs
for (var i = 0, c = ds_list_size(buffs); i < c; i++)
{
    var l = buffs[| i];
    if (l[| 1] == 0) 
    {
        cardDeleteBuff(l[| 0]);
        var p = ds_list_find_index(buffs, l);
        ds_list_destroy(l);
        ds_list_delete(buffs, p);
        continue;
    }
    var l = buffs[| i];
    --l[| 1]
}

if (canTurn)
    state = CARD_STATES.WAIT_FOR_ACTION;
    
ds_list_clear(actions);
choosen = false;

