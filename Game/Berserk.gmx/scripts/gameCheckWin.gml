var ourC = gameGetCardsCount(0);
var otherC = gameGetCardsCount(1);
if (ourC == 0)
{
    with (oCardStuff)
    {
        instance_destroy();
        // WARNING
    }
    // we lost
    gameEnd();
    winLoseInit(false);
    global.money += 300;
    global.loses++;
    saveGame();
    exit; 
}
if (otherC == 0)
{
    with (oCardStuff)
    {
        instance_destroy();
        // WARNING
    }
    // we won
    gameEnd();
    global.wins++;
    winLoseInit(true);
    global.money += 350 + 350 * (ceil(global.opWins / (global.opLoses + 1)));
    saveGame();
    exit;
}

