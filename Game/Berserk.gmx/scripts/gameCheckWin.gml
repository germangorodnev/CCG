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
    show_message("You are peedor");
    gameEnd();
    global.loses++;
    saveGame();
    room_goto(rMainMenu);  
    exit; 
}
if (otherC == 0)
{
    // we won
    show_message("You are not peedor");
    gameEnd();
    global.wins++;
    saveGame();
    room_goto(rMainMenu);   
    exit;
}

