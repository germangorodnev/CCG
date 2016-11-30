var ourC = 0;
var otherC = 0;
with (oCardBase)
{
    if (player == 0)
        ourC++;
    else
        otherC++;
}
if (ourC == 0)
{
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
    // we won
    gameEnd();
    global.wins++;
    winLoseInit(true);
    global.money += 350 + 350 * (ceil(global.opWins / (global.opLoses + 1)));
    saveGame();
    exit;
}

