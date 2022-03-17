class wincon {
  void check() {
    int con=0;
    if (alive1==true) {
      con+=1;
    }
    if (alive2==true) {
      con+=1;
    }
    if (alive3==true) {
      con+=1;
    }
    if (alive4==true) {
      con+=1;
    }
    if (con==1) {
      end=true;
    }
    if (end == true) {
      if (con==1) {
        for (int p=1; p<5; p++) {
          if (checkmny(p)>0) {
            if (p==1) {
              bringoutyourdead(1, true,false);
             // print("p=", p, "    ");
            }
            if (p==2) {
              bringoutyourdead(2, true,false);
              //print("p=", p, "    ");
            }
            if (p==3) {
              bringoutyourdead(3, true,false);

          //    print("p=", p, "    ");
            }
            if (p==4) {
              bringoutyourdead(4, true,false);
        //      print("p=", p, "    ");
            }
          }
        }
        restart();
      }
    }
  }
  void restart() {
    //samla data 
antalmatcher+=1;
//print(antalmatcher,"      ");
    // reset vissa stat 

    //restart
    turnTimer=0;
    MoneyP1=30000;
    TotMoneyP1=30000;
    MoneyP2=30000;
    TotMoneyP2=30000;
    MoneyP3=30000;
    TotMoneyP3=30000;
    MoneyP4=30000;
    TotMoneyP4=30000;
    p1.s=0;
    p1.p=0;
    p2.s=0;
    p2.p=0;
    p3.s=0;
    p3.p=0;
    p4.s=0;
    p4.p=0;
    jail1=false;
    jail2=false;
    jail3=false;
    jail4=false;
    freejail1=false;
    freejail2=false;
    freejail3=false;
    freejail4=false;
    alive1=true;
    alive2=true;
    alive3=true;
    alive4=true;
    for ( int s=0; s<4; s++) { 
      for ( int p=0; p<10; p++) { 
        rutor.bygg[s][p]=0;
        rutor.flipped[s][p]=0;
        rutor.ownd[s][p]=rutor.newownd[s][p];
      }
    }
  }
}
