
chance chn3= new chance();
skatt skatt3= new skatt();
class Player3 {
  // p,s är vart spelaren är positionerad
  int p=0;
  int s=0;
  // timer för jail
  int t=0;
  //extra distans på sista steget  
  float ff=82;
  Spela spel = new Spela();
  void play() {
    fill(0, 0, 255);
    //kolla om spelaren har ett gå ut ur fängelse kort 
    if (jail3==true && freejail3==true) {
      freejail3=false;
      jail3=false;
    }
    // om spelaren inte är i fängelse
    if (jail3==false) {
      //print("p:", p, "       ", "s:", s, "       ");
      p+=spel.roll(3);
      boolean repeat=true;
      while (repeat==true) {
        if (s==0) {
          if (p>=10) {
            s=1;
            p-=10;
          }
        }
        if (s==1) {
          if (p>=10) {
            s=2;
            p-=10;
          }
        }
        if (s==2) {

          if (p>=10) {
            s=3;
            p-=10;
          }
        }
        if (s==3) {
          if (p==0) {
            jail3=true;
          }
          if (p>=10) {
            // går igenom gå
            addmny(3, 4000);
            ;
            s=0;
            p-=10;
          }
        }
        // print(s,p);
        if (p<10) {
          repeat=false;
        }
      }
      if (s==0) {
        circle(932-ff*p, 965, 30);
      }
      if (s==1) {
        circle(932-ff*10, 932-ff*p, 30);
      }
      if (s==2) {
        circle(932-ff*(10-p), 932-ff*10, 30);
      }
      if (s==3) {
        circle(932, 932-ff*(10-p), 30);
      }
    }
    //om dem är i fängelse
    if (jail3==true) {
      circle(932-ff*10, 932, 30);
      int c1 = int(random(1, 7));
      int c2 = int(random(1, 7));
      t+=1;
      if (t>=3) {
        jail3=false;
        t=0;
        s=2;
        p=0;
      }
      if (c2==c1) {
        jail3=false;
        t=0;
        s=1;
        p=0;
        p+=c1+c2;
      }
    }
    // kollar om de står på specifika brickor
    chn3.draw(s, p, 3);
    skatt3.draw(s, p, 3);
    hyra.check(3, s, p);
    rutor.buy(3, s, p);
    if (MoneyP3<0) {
      flip.flipcheck(3);
    }
    if (MoneyP3<0) {
           bringoutyourdead(3,false,false);
      alive3=false;
      MoneyP3=0;
      for ( int s=0; s<4; s++) { 
        for ( int p=0; p<10; p++) { 
          if (rutor.ownd[s][p]==3) {
            rutor.ownd[s][p]=5;
            rutor.bygg[s][p]=0;
          }
        }
      }
    }
   wincon.check();
  }
}
