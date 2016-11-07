///cardTryToSetAction(0..3 index)
// sometimes we cannot set an action
// check for mana
if (usesMana)
{
    if (mana < actionsMana[argument0])
    {
        // oops, not enough mana
        
        return "nomana";
    }
}
return true;

/*
    ATTACK = 0,
    PASS_THE_TURN = 1,
    // KOCNHA
    KONCHA_HEAL = 2,
    KONCHA_POISON = 3,
    // LISA
    LISA_BACKSTAB = 4,
    // MIMIC WILD
    MIMIC_WILD_BATTLECRY = 5,
    MIMIC_WILD_STUN = 6,
    // MIMIC TOWN
    MIMIC_TOWN_BATTLECRY = 7,
    // MUSHROOMS
    MUSHROOMS_POISON_BATTLECRY = 8,
    MUSHROOMS_ATTACK_DEATH = 9,
    // ARMOR HAMMER
    ARMOR_HAMMER_USE = 10,
    // JOJN
    JOJN_SWORD_STRIKE = 11,
    JOJN_IMPACT_OF_THE_DIVINE = 12
*/

