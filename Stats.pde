class Stats {
  void draw() {
    textSize(30);
fill(0,255,0);
    text("Player 1:  Totalt:", 1000, 50 );
    text("På hand:", 1142, 80);
    text(TotMoneyP1, 1270, 50);
    text(MoneyP1, 1270, 80);

fill(255,0,0);
    text("Player 2:  Totalt:", 1000, 150 );
    text("På hand:", 1142, 180);
    text(TotMoneyP2, 1270, 150);
    text(MoneyP2, 1270, 180);

fill(0,0,255);
    text("Player 3:  Totalt:", 1000, 250 );
    text("På hand:", 1142, 280);
    text(TotMoneyP3, 1270, 250);
    text(MoneyP3, 1270, 280);

fill(200, 200, 40);
    text("Player 4:  Totalt:", 1000, 350 );
    text("På hand:", 1142, 380);
    text(TotMoneyP4, 1270, 350);
    text(MoneyP4, 1270, 380);
  }
}
