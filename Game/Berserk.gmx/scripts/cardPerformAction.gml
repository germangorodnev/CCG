if (ds_list_empty(actions) || !canTurn || !actions[| 1])
{
    state = CARD_STATES.DONE_ACTION;
    exit; //WARNING
}

var target = actions[| 2];

var act = actions[| 0];

// decrease the mana 
if (player == 1)
{
    var pos = cardGetArrIndexByEnum(act);
    if (pos != -1)
        cardChangeMana(-actionsMana[pos]);
}

switch (act)
{
    case ACTIONS.ATTACK: // just an attack
        state = CARD_STATES.PERFORM_ACTION;
        cardAttack(target, gameGetListByTargetGroup(actions[| 3], target), dmg, atkSpd, -1);
        break;
    case ACTIONS.PASS_THE_TURN:
        cardDone();
        // LUL
        break;
                            /* BATTLECRIES */
    // MIMICS
    case ACTIONS.MIMIC_WILD_BATTLECRY:
    case ACTIONS.MIMIC_TOWN_BATTLECRY:
        state = CARD_STATES.PERFORM_ACTION;
        (cardAttack(target, gameGetListByTargetGroup(actions[| 3], target), dmg, atkSpd, -1)).parent = id;        
        break;
                            /* PASSIVE */
    case ACTIONS.MUSHROOMS_POISON_PASSIVE:
        var dbf = ds_list_create();
        var p = ds_list_create();
        ds_list_add(p, DEBUFFS.POISON, 2, 1);
        ds_list_add(dbf, p); 
        //ds_list_mark_as_list(dbf, 0);
        var a = cardAttack(target, gameGetListByTargetGroup(actions[| 3], target), 0, atkSpd, dbf); 
        a.image_index = 1;
        // - HP
        cardChangeHp(-1);
        break;
                            /* UNIQUE ABILITIES */    
    // KONCHA
    case ACTIONS.KONCHA_HEAL: // healing the card
        state = CARD_STATES.PERFORM_ACTION;
        cardHeal(target, gameGetListByTargetGroup(actions[| 3], target), 2);
        cardDone();
        break;
    case ACTIONS.KONCHA_POISON: // poison the enemy
        state = CARD_STATES.PERFORM_ACTION;
        var dbf = ds_list_create();
        var p = ds_list_create();
        ds_list_add(p, DEBUFFS.POISON, 2, 1);
        ds_list_add(dbf, p); 
        //ds_list_mark_as_list(dbf, 0);
        var s = cardAttack(target, gameGetListByTargetGroup(actions[| 3], target), 0, atkSpd, dbf);
        s.image_index = 3;
        break;
    // LISA
    case ACTIONS.LISA_BACKSTAB:
        state = CARD_STATES.PERFORM_ACTION;
        var a = cardAttack(target, gameGetListByTargetGroup(actions[| 3], target), dmg, atkSpd, -1); 
        a.absolute = true;    
        a.image_index = 4;
        break;
    // MIMIC WILD
    case ACTIONS.MIMIC_WILD_STUN:
        var dbf = ds_list_create();
        var p = ds_list_create();
        ds_list_add(p, DEBUFFS.STUN, 1);
        ds_list_add(dbf, p); 
        //ds_list_mark_as_list(dbf, 0);
        var ls = gameGetListByTargetGroup(actions[| 3], target);
        var realTarget = ds_list_find_value(ls, target);
        instance_create(realTarget.x, realTarget.y, oInstant);
        var s = cardAttack(target, ls, 0, -1, dbf);    
        break;
    // ARMOR HAMMER
    case ACTIONS.ARMOR_HAMMER_USE:
        state = CARD_STATES.PERFORM_ACTION;
        // delete an armor and dead
        var a = cardAttack(target, gameGetListByTargetGroup(actions[| 3], target), 0, atkSpd, -1);
        a.breakArmor = true;
        // and suddenly dead
        cardSetState(CARD_STATES.DESTROY);    
        break;
    // MUSHROOMS
    case ACTIONS.MUSHROOMS_ATTACK_DEATH:
        state = CARD_STATES.PERFORM_ACTION;
        cardAttack(target, gameGetListByTargetGroup(actions[| 3], target), dmg, atkSpd, -1);
        // and suddenly dead
        cardSetState(CARD_STATES.DESTROY);    
        break; 
    //JOJN
    case ACTIONS.JOJN_SWORD_STRIKE: // 50% to break armor, 25% to deal true dmg, 25% to miss
        state = CARD_STATES.PERFORM_ACTION;
        var luck = actions[| 4];
        if (luck == 0) // break arm
        {
            var a = cardAttack(target, gameGetListByTargetGroup(actions[| 3], target), 0, atkSpd, -1); 
            a.breakArmor = true;    
        }
        else if (luck == 1) // true dmg
        {
            var a = cardAttack(target, gameGetListByTargetGroup(actions[| 3], target), dmg, atkSpd, -1); 
            a.absolute = true;            
        }
        else // jsut miss
        {
            state = CARD_STATES.DONE_ACTION;
        }
        break;
    case ACTIONS.JOJN_IMPACT_OF_THE_DIVINE: // steals the card if all its stats are <= 3
        var s = instance_create(x, y, oJojnImpact);
        s.pl = player;
        s.startPl = player;
        s.target = ds_list_find_value(gameGetListByTargetGroup(actions[| 3], target), target);
        s.parent = id;
        s.speed = atkSpd;
        break;
    // GARGULIA
    case ACTIONS.GARGULIA_BLOCK:
        cardSetBuff(BUFFS.BLOCK, 1);
        cardDone();       
        break;
    case ACTIONS.MANA_PLUS_ONE:
        cardChangeMana(1);
        cardDone();
        break;
    // ARTONIX
    case ACTIONS.ARTONIX_AUTOMAT_FIRE:
        state = CARD_STATES.PERFORM_ACTION;
        var group = gameGetListByTargetGroup(actions[| 3], target);
        var bull = cardAttack(target, group, dmg, atkSpd * 2, -1);
        bull.parent = noone;
        bull.image_index = 5;
        var i = 0;
        repeat(2)
        {
            var b = cardAttack(target, group, dmg, atkSpd * 2, -1);
            b.visible = false;
            b.active = false;
            b.alarm[0] = 0.5 * (i + 1) * room_speed;
            b.spd = bull.speed;
            b.speed = 0;
            b.image_index = 5;
            if (i == 0)
                bull.parent = noone;
            i++;
        }
        break;
    // SMEMS
    case ACTIONS.SMEMS_BLESSING:
        var targetId = ds_list_find_value(gameGetListByTargetGroup(actions[| 3], target), target);  
        with (targetId)
        {
            cardIncreaseMaxStat(2, "dmg");
            cardIncreaseMaxStat(1, "armor");            
        }
        cardDone();
        break;
    case ACTIONS.SMEMS_FIREBALL:
        state = CARD_STATES.PERFORM_ACTION;
        var a = cardAttack(target, gameGetListByTargetGroup(actions[| 3], target), dmg, atkSpd, -1);
        with (a) {
            sprite_index = sSmemsFireball;
            image_speed = 1;
        }
        break;
    // PORCHANKA
    case ACTIONS.PORCHANKA_CORRUPTION:
        var targetId = ds_list_find_value(gameGetListByTargetGroup(actions[| 3], target), target);
        with (targetId)
        {
            cardAddDeathrattle(DEATHRATTLES.CORRUPTION);
            cardChangeHp(-1);
        }
        cardDone();
        break;
    // PECHENKA
        case ACTIONS.COOKIE_DEVOUR:
        state = CARD_STATES.PERFORM_ACTION;
        var s = instance_create(x, y, oDevour);
        s.pl = player;
        s.startPl = player;
        s.target = ds_list_find_value(gameGetListByTargetGroup(actions[| 3], target), target);
        s.parent = id;
        s.speed = atkSpd;
        s.dmg = 1;
        s.heal = 2;
        break;  
    // SLIME GOLEM
    case ACTIONS.GOLEM_SLIME_DEVOUR:
        state = CARD_STATES.PERFORM_ACTION;
        var s = instance_create(x, y, oDevour);
        s.pl = player;
        s.startPl = player;
        s.target = ds_list_find_value(gameGetListByTargetGroup(actions[| 3], target), target);
        s.parent = id;
        s.speed = atkSpd;
        s.dmg = 2;
        s.heal = 3;
        break;
    // STONE GOLEM
    case ACTIONS.GOLEM_STONE_PRESSURE:
        state = CARD_STATES.PERFORM_ACTION;
        var s = instance_create(x, y, oPressure);
        s.pl = player;
        s.target = ds_list_find_value(gameGetListByTargetGroup(actions[| 3], target), target);
        s.startPl = player;
        s.parent = id;
        s.speed = atkSpd;
        s.dmg = 4;
        break;
    case ACTIONS.GOLEM_STONE_LIGHTNING:
        var ls = gameGetListByTargetGroup(actions[| 3], target);
        var realTarget = ds_list_find_value(ls, target);
        with (realTarget)
        {
            cardChangeHp(-3);
            cardChangeArmor(-1);
        }  
        instance_create(realTarget.x, realTarget.y, oLightning);   
        break;
    //////////////// FAMILY ////////////////////////
    // GOLEM BATYA
    case ACTIONS.GOLEM_BATYA_BLOCK: // 2 turn block
        cardSetBuff(BUFFS.BLOCK, 2);
        cardDone();       
        break;
    // GOLEM MATYA
    case ACTIONS.GOLEM_MATYA_KISS:
        var ls = gameGetListByTargetGroup(actions[| 3], target);
        var realTarget = ds_list_find_value(ls, target);
        with (realTarget)
        {
            cardIncreaseMaxStat(1, "hp");
            cardIncreaseMaxStat(1, "dmg");
        }  
        cardDone();        
        break;
    // GOLEM SON
    case ACTIONS.GOLEM_SON_RAGE:
        // double dmg - 1 hp
        state = CARD_STATES.PERFORM_ACTION;
        var a = cardAttack(target, gameGetListByTargetGroup(actions[| 3], target), dmg * 2, atkSpd, -1);
        cardChangeHp(-1);
        break;
    case ACTIONS.GOLEM_SON_GENGAP:
        var amountDad = cardGetCountOnBoard(CARDS.GOLEM_BATYA, cardGetGroup()),
            amountMom = cardGetCountOnBoard(CARDS.GOLEM_MATYA, cardGetGroup());
        if (amountDad > 0 || amountMom > 0)
            cardIncreaseMaxStat(2, "dmg");
        else
        {
            // fail
        }
        cardDone();
        break;
    // not implemented
    default:
        cardDone();
        break;        
}

/*
    ATTACK = 0,
    PASS_THE_TURN,
    // KOCNHA
    KONCHA_HEAL,
    KONCHA_POISON,
    // LISA
    LISA_ARMOR,
    // MIMIC WILD
    MIMIC_WILD_BATTLECRY,
    MIMIC_WILD_STUN,
    // MIMIC TOWN
    MIMIC_TOWN_BATTLECRY,
    // MUSHROOMS
    MUSHROOMS_POISON,
    MUSHROOMS_ATTACK_DEATH,
    // ARMOR HAMMER
    ARMOR_HAMMER_USE

