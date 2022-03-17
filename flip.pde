class flip {
  void flipa(int playerNumber) {
    for ( int s=0; s<4; s++) {
      for (int p=0; p < 10; p++) {
        //biligaste först
        if (rutor.whoowns(s, p, playerNumber)==playerNumber) {
          addmny(playerNumber, info.kostnad[s][p][2]);
          rutor.flipped[s][p]=1;
        }
      }
    }
  }
  void flipcheck(int playerNumber) {
    if (playerNumber==1 && MoneyP1<0) {
      flipa(playerNumber);
    }
    if (playerNumber==2 && MoneyP2<0) {
      flipa(playerNumber);
    }
    if (playerNumber==3 && MoneyP3<0) {
      flipa(playerNumber);
    }
    if (playerNumber==4 && MoneyP4<0) {
      flipa(playerNumber);
    }
  }
}
