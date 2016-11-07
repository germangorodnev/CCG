if (ds_list_empty(actions))
{
    state = CARD_STATES.DONE_ACTION;
    exit; //WARNING
}

if (actions[| 1] == false) // we just failed!
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
        var debuffs = ds_list_create();
        var p = ds_list_create();
        ds_list_add(p, DEBUFFS.POISON, 2, 1);
        ds_list_add(debuffs, p); 
        var a = cardAttack(target, gameGetListByTargetGroup(actions[| 3], target), dmg, atkSpd, debuffs); 
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
        var debuffs = ds_list_create();
        var p = ds_list_create();
        ds_list_add(p, DEBUFFS.POISON, 2, 1);
        ds_list_add(debuffs, p); 
        var s = cardAttack(target, gameGetListByTargetGroup(actions[| 3], target), 0, atkSpd, debuffs);
        s.image_index = 3;
        break;
    // LISA
    case ACTIONS.LISA_BACKSTAB:
        state = CARD_STATES.PERFORM_ACTION;
        var a = cardAttack(target, gameGetListByTargetGroup(actions[| 3], target), dmg, atkSpd, -1); 
        a.absolute = true;    
        break;
    // MIMIC WILD
    case ACTIONS.MIMIC_WILD_STUN:
        var debuffs = ds_list_create();
        var p = ds_list_create();
        ds_list_add(p, DEBUFFS.STUN, 2);
        ds_list_add(debuffs, p); 
        var s = cardAttack(target, gameGetListByTargetGroup(actions[| 3], target), 0, atkSpd, debuffs);    
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
        var i = 0;
        repeat(2)
        {
            var b = cardAttack(target, group, dmg, atkSpd * 2, -1);
            b.visible = false;
            b.active = false;
            b.alarm[0] = 0.5 * (i + 1) * room_speed;
            b.spd = bull.speed;
            b.speed = 0;
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

