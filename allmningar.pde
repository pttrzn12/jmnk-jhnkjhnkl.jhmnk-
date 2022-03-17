class allmningar {

  int [] allmningar={1, 2, 3, 4, 5, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
  int [] nyallmningar={1, 2, 3, 4, 5, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
  int size=allmningar.length;
  void draw(int s, int p, int q) {
    if (s==0 && p==2 || s==1 && p==7 || s==3 && p==3 ) {
      int size=allmningar.length;
      int f=int(random(0, size-1));
      //cardtype
      int ct= allmningar[f];
      int k=0;
      for ( int x=0; x<size; x++) {
        if (allmningar[x]!=0) {
          k+=1;
        }
      }
      if (k==1) {
        //blanda    
        for ( int v=0; v<size; v++) {
          allmningar[v]=nyallmningar[v];
        }
      }
      if (k!=1) {
        //dra ett kort
        // kollar om kortet finns 
        while (ct==0) {
          f=int(random(0, size-1));
          ct= allmningar[f];
        }
        if (ct!=0) {

          allmningar[f]=0;


          if (ct==1) {
            Advancetogo(q);
            ;
          }
          if (ct==2) {
            bankError(q);
          }
          if (ct==3) {
            saleofStocks(q);
          }
          if (ct==4) {
            getoutofJail(q);
          }
          if (ct==5) {
            gotoJail(q);
          }
          if (ct==6) {
            holiday(q);
          }
          if (ct==7) {
            incomeTax(q);
          }
          if (ct==8) {
            itsyourBirtday(q);
          }
          if (ct==9) {
            lifeInsurence(q);
          }
          if (ct==10) {
            hoptialFees(q);
          }
          if (ct==11) {
            schoolFees(q);
          }
          if (ct==12) {
            consualtancyFee(q);
          }
          if (ct==13) {
            streetRepair(q);
          }
          if (ct==14) {
            secondplaceBeauty(q);
          }
          if (ct==15) {
            youInherit(q);
          }
        }
      }
    }
  }
  void Advancetogo(int playerNumber) {
    //gå till gå
    move(playerNumber, 1, 0);
    //inkassera 4000
    addmny(playerNumber, 4000);
  }

  void bankError(int playerNumber) {
    // inkassera 4000
    addmny(playerNumber, 4000);
  }

  void doctorsFee(int playerNumber) {
    // betala 1000
    addmny(playerNumber, -1000);
  }

  void saleofStocks(int playerNumber) {
    // inkassera 1000
    addmny(playerNumber, 1000);
  }

  void getoutofJail(int playerNumber) {
    //get out of jail kort
    if (playerNumber==1) {
      freejail1=true;
    }

    if (playerNumber==2) {
      freejail2=true;
    }

    if (playerNumber==3) {
      freejail3=true;
    }

    if (playerNumber==4) {
      freejail4=true;
    }
  }

  void gotoJail(int playerNumber) {
    //gå till fängelse
    if (playerNumber==1) {
      jail1=true;
    }

    if (playerNumber==2) {
      jail2=true;
    }

    if (playerNumber==3) {
      jail3=true;
    }

    if (playerNumber==4) {
      jail4=true;
    }
  }

  void holiday(int playerNumber) {
    //inkassera 2000
    addmny(playerNumber, 2000);
  }

  void incomeTax(int playerNumber) {
    //betala 400 (ja 400 int 4000)
    addmny(playerNumber, 400);
  }

  void itsyourBirtday(int playerNumber) {
    //få 200 från varje spelare
    addmny(playerNumber, 800);
    addmny(1, -200);
    addmny(2, -200);
    addmny(3, -200);
    addmny(4, -200);
  }

  void lifeInsurence(int playerNumber) {
    // inkassera 2000
    addmny(playerNumber, 2000);
  }

  void hoptialFees(int playerNumber) {
    //betala 2000
    addmny(playerNumber, -2000);
  }

  void schoolFees(int playerNumber) {
    //betala 1000
    addmny(playerNumber, -1000);
  }

  void consualtancyFee(int playerNumber) {
    //betala 500
    addmny(playerNumber, -500);
  }

  void streetRepair(int playerNumber) {
    // betala 800 för varje hus och 2300 för hotel
    int skada=0;
    for ( int s=0; s<4; s++) {
      for (int p=0; p < 10; p++) {
        if (playerNumber==rutor.whoowns(s, p, playerNumber)) {
          if (rutor.bygg[s][p]>0 && rutor.bygg[s][p]<5) {
            skada+=-800*rutor.bygg[s][p];
          }
          if (rutor.bygg[s][p]==5) {
            skada+=-2300;
          }
        }
      }
    }
    addmny(playerNumber, skada);
  }

  void secondplaceBeauty(int playerNumber) {
    // inkassera 200 (ja 200 inte 4000)
    addmny(playerNumber, 200);
  }

  void youInherit(int playerNumber) {
    //inkassera 2000
    addmny(playerNumber, 2000);
  }
}
