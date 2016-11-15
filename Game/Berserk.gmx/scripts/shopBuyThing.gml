///shopBuyThing(type, buttonId)
var button = argument1;
with (oShopController)
{ 
    switch (argument0)
    {
    case 3: // 3-card booster
        global.money -= button.cost;
        global.packs3++;
        break;
    case 5:
        global.money -= button.cost;
        global.packs5++;
        break;
    case "s": // sellout
        // add the card
        global.money -= button.cost;
        global.selloutStr = global.newSelloutStr;
        global.sellout = false; // we bought it
        sel = false;
        gameAddCardToCollection(sI, 1);
        saveSellout();
        with (button)
            instance_destroy();
        with (oCardDeck)
        {   
            mode = 2;
            xscN = 0.01;
            yscN = 0.01;    
        }
        
        break;
    }
}
