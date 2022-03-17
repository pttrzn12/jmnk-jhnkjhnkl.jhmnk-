class chance {
  Rutor rutor=new Rutor();
  int [] chans={1, 2, 3, 4, 5, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
  int [] nychans={1, 2, 3, 4, 5, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
  int size=chans.length;
  void draw(int s, int p, int q) {
    if (s==0 && p==7 || s==2 && p==2 || s==3 && p==6 ) {
      int size=chans.length;
      int f=int(random(0, size-1));
      //cardtype
      int ct= chans[f];
      int k=0;
      for ( int x=0; x<size; x++) {
        if (chans[x]!=0) {
          k+=1;
        }
      }
      if (k==1) {
        //blanda    
        for ( int v=0; v<size; v++) {
          chans[v]=nychans[v];
        }
      }
      if (k!=1) {
        //dra ett kort
        // kollar om kortet finns 
        while (ct==0) {
          f=int(random(0, size-1));
          ct= chans[f];
        }
        if (ct!=0) {

          chans[f]=0;


          if (ct==1) {
            advanceToBoardwalk(q);
          }
          if (ct==2) {
            advanceToGo(q);
          }
          if (ct==3) {
            advanceToIllinoisAvenue(q, s, p);
          }
          if (ct==4) {
            advanceToStCharlesPlace(q, s, p);
          }
          if (ct==5) {
            advanceToNearestRailroad(q, s, p);
          }
          if (ct==6) {
            advanceTheTokenToNearestUtility(q, s, p);
          }
          if (ct==7) {
            bankPaysYouDividend(q);
          }
          if (ct==8) {
            getOutOfJailFree(q);
          }
          if (ct==9) {
            goBack3Spaces(q, s, p);
          }
          if (ct==10) {
            goToJail(q);
          }
          if (ct==11) {
            makeGeneralRepairsOnAllYourProperty(q);
          }
          if (ct==12) {
            speedingFine(q);
          }
          if (ct==13) {
            takeATripToReadingRailroad(q, s, p);
          }
          if (ct==14) {
            youHaveBeenElectedChairmanOfTheBoard(q);
          }
          if (ct==15) {
            youHaveBeenElectedChairmanOfTheBoard(q);
          }
          if (ct==16) {
            yourBuildingLoanMatures(q);
          }
        }
      }
    }
  }

  void advanceToBoardwalk(int playerNumber) {
    //Ändra spelarens ct till normanstorg
    move(playerNumber, 3, 9);
  }

  void advanceToGo(int playerNumber) {
    //Ändra spelarens ct till Gå
    addmny(playerNumber, 4000);
    move(playerNumber, 0, 0);
  }

  void advanceToIllinoisAvenue(int playerNumber, int s, int p) {
    if (checkgo(s, p, 2, 4)==1) {
      addmny(playerNumber, 4000);
    }
    move(playerNumber, 2, 4);
    //Ändra spelarens ct till hamngatan
    //Om spelaren passerar gå (ev. göra en allmän funktion för att checka detta...) addmny(playerNumber, 200);
  }

  void advanceToStCharlesPlace(int playerNumber, int s, int p) {
    if (checkgo(s, p, 1, 1)==1) {
      addmny(playerNumber, 4000);
    }
    move(playerNumber, 1, 1);
    //Ändra spelarens ct till "St. Eriksgata
    //Om spelaren passerar gå... addmny(playerNumber, 200);
  }

  void advanceToNearestRailroad(int playerNumber, int s, int p) {
    if (s==0 && p==7) {
      move(playerNumber, 1, 5);
      //om den inte är oägd eller din
      if (rutor.ownd[1][5]!=5 && rutor.ownd[1][5]!=playerNumber && rutor.flipped[1][5]==0) {
        int owner=rutor.whoowns(1, 5,playerNumber);
        int antal=rutor.countstations(owner);
        int hyra=0;
        if (antal==1) {
          hyra=2*-500;
        }
        if (antal==2) {
          hyra=2*-1000;
        }
        if (antal==3) {
          hyra=2*-2000;
        }
        if (antal==4) {
          hyra=2*-4000;
        }
        addmny(playerNumber, hyra);
        int profit=hyra*-1;
        addmny(owner, profit);
      }
      if (rutor.ownd[1][5]==5 && checkmny(playerNumber) >=4000) {
        rutor.ownd[1][5]=playerNumber;
        addmny(playerNumber, -4000);
      }
    }

    if (s==2 && p==2) {
      move(playerNumber, 2, 5);
      //om den inte är oägd eller din
      if (rutor.ownd[2][5]!=5 && rutor.ownd[2][5]!=playerNumber && rutor.flipped[2][5]==0) {
        int owner=rutor.whoowns(2, 5,playerNumber);
        int antal=rutor.countstations(owner);
        int hyra=0;
        if (antal==1) {
          hyra=2*-500;
        }
        if (antal==2) {
          hyra=2*-1000;
        }
        if (antal==3) {
          hyra=2*-2000;
        }
        if (antal==4) {
          hyra=2*-4000;
        }
        addmny(playerNumber, hyra);
        int profit=hyra*-1;
        addmny(owner, profit);
      }
      if (rutor.ownd[2][5]==5 && checkmny(playerNumber) >=4000 && rutor.flipped[2][5]==0) {
        rutor.ownd[2][5]=playerNumber;
        addmny(playerNumber, -4000);
      }
    }


    if (s==3 && p==6) {
      move(playerNumber, 0, 5);
      //om den inte är oägd eller din
      if (rutor.ownd[0][5]!=5 && rutor.ownd[0][5]!=playerNumber) {
        int owner=rutor.whoowns(0, 5,playerNumber);
        int antal=rutor.countstations(owner);
        int hyra=0;
        if (antal==1) {
          hyra=2*-500;
        }
        if (antal==2) {
          hyra=2*-1000;
        }
        if (antal==3) {
          hyra=2*-2000;
        }
        if (antal==4) {
          hyra=2*-4000;
        }
        addmny(playerNumber, hyra);
        int profit=hyra*-1;
        addmny(owner, profit);
      }
      if (rutor.ownd[0][5]==5 && checkmny(playerNumber) >=4000) {
        rutor.ownd[0][5]=playerNumber;
        addmny(playerNumber, -4000);
      }
    }
    //Ändra spelarens ct till närmaste järnväg
    //Om järnvägen är oägd, ge spelaren valet att köpa den från banken
    //Om järnvägen är ägd av någon ska spelaren betala dubbel hyra till ägaren

    //Detta kort förekommer två gånger
  }

  void advanceTheTokenToNearestUtility(int playerNumber, int s, int p) {
    //elverket  
    if ((s==0 && p==7) || (s==3 && p==6 )) {
      move(playerNumber, 1, 2);
      if (rutor.ownd[1][2]!=5 && rutor.ownd[1][2]!=playerNumber) {
        int owner=rutor.whoowns(1, 2,playerNumber);
        int hyra=-10*(int(random(1, 7))+int(random(1, 7)));
        addmny(playerNumber, hyra);
        int profit=-1*hyra;
        addmny(owner, profit);
      }
      if (rutor.ownd[1][2]==5&& checkmny(playerNumber)>=4000) {
        rutor.ownd[1][2]=playerNumber;
        addmny(playerNumber, -4000);
      }
    }




    //vattenverk
    if (s==2 && p==2) {
      move(playerNumber, 2, 8);
      if (rutor.ownd[2][8]!=5 && rutor.ownd[2][8]!=playerNumber && rutor.flipped[2][8]==0) {
        int owner=rutor.whoowns(2, 8,playerNumber);
        int hyra=-10*(int(random(1, 7))+int(random(1, 7)));
        addmny(playerNumber, hyra);
        int profit=-1*hyra;
        addmny(owner, profit);
      }
      if (rutor.ownd[2][8]==5&& checkmny(playerNumber)>=4000) {
        rutor.ownd[2][8]=playerNumber;
        addmny(playerNumber, -4000);
      }
    }
    //Ändra spelarens ct till närmaste "utility"
    //Om rutan är oägd, ge spelaren valet att köpa den från banken
    //Om rutan är ägd, slå tärningarna och betala ägaren 10 gånger värdet av tärningskastet
  }

  void bankPaysYouDividend(int playerNumber) {
    addmny(playerNumber, 1000);
  }

  void getOutOfJailFree(int playerNumber) {
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
    //Detta kort ska på något sätt sparas så att spelaren kan använda det när så väljs, ev. genom spelarspecifika listor om flera kort ska med
  }

  void goBack3Spaces(int playerNumber, int s, int p) {
    if (p>=3) {
      move(playerNumber, s, p-3);
    }
    if (p<3 && s>1) {
      move(playerNumber, s-1, 7+p);
    }
    if (p<3 && s==0) {
      move(playerNumber, 4, 7+p);
    }
    //Ändra spelarens ct till 3 rutor bakåt
  }

  void goToJail(int playerNumber) {
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
    //Ändra spelarens ct till fängelset
    //Se till att reglerna för att vara i fängelset gäller
  }

  void makeGeneralRepairsOnAllYourProperty(int playerNumber) {
    //Spelaren ska betala 25 "pengar" för varje hus, 100 "pengar" för varje hotell
    int skada=0;
    for ( int s=0; s<4; s++) {
      for (int p=0; p < 10; p++) {
        if (playerNumber==rutor.whoowns(s, p,playerNumber)) {
          if (rutor.bygg[s][p]>0 && rutor.bygg[s][p]<5) {
            skada+=-25*rutor.bygg[s][p];
          }
          if (rutor.bygg[s][p]==5) {
            skada+=100;
          }
        }
      }
    }
    addmny(playerNumber, skada);
  }

  void speedingFine(int playerNumber) {
    addmny(playerNumber, -300);
  }

  void takeATripToReadingRailroad(int playerNumber, int s, int p) {
    //Ändra spelarens ct till "Södra Railroad"
    //Om spelaren passerar Gå, addmny(playerNumber, 200);
    move(playerNumber, 0, 5);
    if (checkgo(s, p, 0, 5)==1) {
      addmny(playerNumber, 4000);
    }
    if (rutor.ownd[0][5]!=5 && rutor.ownd[0][5]!=playerNumber) {
      int owner=rutor.whoowns(0, 5,playerNumber);
      int antal=rutor.countstations(owner);
      int hyra=0;
      if (antal==1) {
        hyra=2*-500;
      }
      if (antal==2) {
        hyra=2*-1000;
      }
      if (antal==3) {
        hyra=2*-2000;
      }
      if (antal==4) {
        hyra=2*-4000;
      }
      addmny(playerNumber, hyra);
      int profit=hyra*-1;
      addmny(owner, profit);
    }
  }

  void youHaveBeenElectedChairmanOfTheBoard(int playerNumber) {
    //Betala varje annan spelare 50 "pengar, d.v.s. -50*spelarantal för spelaren, +50 för resterande
    if (playerNumber!=1) {
      addmny(1, 1000);
      addmny(playerNumber, -1000);
    }
    if (playerNumber!=2) {
      addmny(2, 1000);
      addmny(playerNumber, -1000);
    }
    if (playerNumber!=3) {
      addmny(3, 1000);
      addmny(playerNumber, -1000);
    }
    if (playerNumber!=4) {
      addmny(4, 1000);
      addmny(playerNumber, -1000);
    }
  }

  void yourBuildingLoanMatures(int playerNumber) {
    addmny(playerNumber, 3000);
  }
}
