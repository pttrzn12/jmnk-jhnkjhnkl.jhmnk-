class skatt {
  void draw(int s, int p,int playerNumber) {
    //inkomstskatt
    if (s==0 && p==2) {
      //lägg till inkomstskatt
      int skatt=0;
      for ( int y=0; y<4; y++) {
        for ( int x=0; x<10; x++) {
          if ( rutor.ownd[y][x]==playerNumber) {
            skatt+=info.kostnad[y][x][0];
            if (rutor.bygg[y][x]>0) {
              skatt+=rutor.bygg[y][x]*info.kostnad[s][p][1];
            }
          }
        }
      }
      skatt=skatt/10;
      if (skatt>=4000) {
        addmny(playerNumber, -4000);
      }
      if (skatt<4000) {
        addmny(playerNumber, -1*skatt);
      }
    }
    //lyxskatt
    if (s==3&& p==8) {
      addmny(playerNumber, -2000);
    }
  }
}
