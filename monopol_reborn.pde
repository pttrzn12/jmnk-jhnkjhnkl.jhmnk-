PrintWriter output;
DataHantering datahantering;
//Player1 p1=new Player1();= Spelare 1
Player1 p1=new Player1();
Player2 p2=new Player2();
Player3 p3=new Player3();
Player4 p4=new Player4();
hyra hyra=new hyra();
Stats sts= new Stats();
Rutor rutor=new Rutor();
info info= new info();
flip flip= new flip();
Strat str=new Strat();
wincon wincon= new wincon();
PImage img;
// Money= Pengarna spelarna har
// TotMoney= Den totala mängden pengar spelaren har tjänat
int MoneyP1=30000;
int TotMoneyP1=30000;
int MoneyP2=30000;
int TotMoneyP2=30000;
int MoneyP3=30000;
int TotMoneyP3=30000;
int MoneyP4=30000;
int TotMoneyP4=30000;
// jail= om de är i fängelse
Boolean jail1=false;
Boolean jail2=false;
Boolean jail3=false;
Boolean jail4=false;
Boolean freejail1=false;
Boolean freejail2=false;
Boolean freejail3=false;
Boolean freejail4=false;
Boolean alive1=true;
Boolean alive2=true;
Boolean alive3=true;
Boolean alive4=true;
Boolean end=false;
Boolean same=false;
int antalmatcher=0;
int done=0;
int sameTimer=0;
int lim=20;
int x1=0;
int x2=0;
int x3=0;
int x4=0;
int turnTimer=0;
int matchTimer=800;
int har;
int[] pengar={0, 0, 0, 0};
int[] pro={1, 1, 1, 1};
int[] haft={};
void setup() {
  size(1500, 1000);
  output = createWriter("2Stats.txt");
  img = loadImage("Monopol.jpg");
  datahantering = new DataHantering();
}
void draw() {
  while (true) {
    if (matchTimer>=750) {
      matchTimer=0;
      stratselector();
      end=false;
    }
    simloop(x1, x2, x3, x4);
  }
}

void simloop(int pl1, int pl2, int pl3, int pl4) {
  if (end==false) {
    simulator(pl1, pl2, pl3, pl4);
  }
  if (end==true && matchTimer<750) {
    matchTimer+=1;
    end=false;
    println(antalmatcher);
    println("P1;", pl1, "P2;", pl2, "P3;", pl3, "P4;", pl4);
  }
}
void stratselector() {
  same=true;
  while (same==true) {
    for ( int  str1=0; str1<11; str1++) {
      for ( int str2=0; str2<10; str2++) {
        for ( int str3=0; str3<10; str3++) {
          for ( int str4=0; str4<10; str4++) {
            if (areNotEqual(str1, str2, str3, str4)) {
              if (str1==10) {
                datahantering.saveData();
                print("klar");
                exit();
                break; 
              }
              
              pro[0]=str1;
              pro[1]=str2;
              pro[2]=str3;
              pro[3]=str4;
              // println(pro[0], pro[1], pro[2], pro[3]);
              pro= sort(pro);
              har=pro[0]*1000 + pro[1]*100 + pro[2]*10 + pro[3]*1;
              sameTimer=0;
              for (int n=0; n<haft.length; n++) {
                if (haft[n]==har) {
                  sameTimer+=1;
                }
              }
              if (haft.length==0||sameTimer==0) {
                haft=append(haft, har);
                x1=str1;
                x2=str2;
                x3=str3;
                x4=str4;
                done=0;
                same=false;
              }
            }
            if (same==false) {
              break;
            }
          }
          if (same==false) {
            break;
          }
        }
        if (same==false) {
          break;
        }
      }
      if (same==false) {
        break;
      }
    }
  }
}
void simulator(int pl1, int pl2, int pl3, int pl4) {
  str.P1[0]=pl1;
  str.P2[0]=pl2;
  str.P3[0]=pl3;
  str.P4[0]=pl4;
  background(210, 229, 210);
  image(img, 0, 0);
  turnTimer+=1;
  if (alive1==true) {
    p1.play();
  }
  if (alive2==true) {
    p2.play();
  }
  if (alive3==true) {
    p3.play();
  }
  if (alive4==true) {
    p4.play();
  }
  if (turnTimer>300) {
    tiebraker();
  }
  checktile();
  sts.draw();
}




























//kollar om spelaren går genom gå 1 om ja 0 om nej
int checkgo( int players, int playerp, int objs, int objp ) {
  int result=0;
  if (players>objs) {
    result=1;
  }
  if (players==objs) {
    if (playerp>objp) {
      result=1;
    }
  } 
  return result;
}

void move(int q, int s, int p) {
  if (q==1) {
    p1.s=s;
    p1.p=p;
  }
  if (q==2) {
    p2.s=s;
    p2.p=p;
  }
  if (q==3) {
    p3.s=s;
    p3.p=p;
  }
  if (q==4) {
    p4.s=s;
    p4.p=p;
  }
}
void addmny(int q, int a) {
  if (MoneyP1+MoneyP2+MoneyP3+MoneyP4<=53500) {
    if (q==1 && alive1==true) {
      MoneyP1+=a;
      if (a>0) {
        TotMoneyP1+=a;
      }
    }
    if (q==2 && alive2==true) {
      MoneyP2+=a;
      if (a>0) {
        TotMoneyP2+=a;
      }
    }
    if (q==3 && alive3==true) {
      MoneyP3+=a;
      if (a>0) {
        TotMoneyP3+=a;
      }
    }
    if (q==4 && alive4==true) {
      MoneyP4+=a;
      if (a>0) {
        TotMoneyP4+=a;
      }
    }
  }
}
int checkstrat(int playerNumber, int pos) {
  int value=0;
  if (playerNumber==1) {
    value=str.P1[pos];
  }
  if (playerNumber==2) {
    value=str.P2[pos];
  }
  if (playerNumber==3) {
    value=str.P3[pos];
  }
  if (playerNumber==4) {
    value=str.P4[pos];
  }
  return value;
}
int checkmny(int playerNumber) {
  int r=0;
  if (playerNumber==1) {
    r=MoneyP1;
  }
  if (playerNumber==2) {
    r=MoneyP2;
  }
  if (playerNumber==3) {
    r=MoneyP3;
  }
  if (playerNumber==4) {
    r=MoneyP4;
  }
  return r;
}
int checktotmny(int playerNumber) {
  int r=0;
  if (playerNumber==1) {
    r=TotMoneyP1;
  }
  if (playerNumber==2) {
    r=TotMoneyP2;
  }
  if (playerNumber==3) {
    r=TotMoneyP3;
  }
  if (playerNumber==4) {
    r=TotMoneyP4;
  }
  return r;
}
void checktile() {
  float ff=82;
  for ( int s=0; s<4; s++) {
    for ( int p=0; p<10; p++) {
      if (rutor.whoowns(s, p, 0)!=5 && rutor.whoowns(s, p, 0)!=0) {
        //  print("    s:", s, "    p", p);
        if (rutor.whoowns(s, p, 0)==1) {
          fill(0, 255, 0);
        }
        if (rutor.whoowns(s, p, 0)==2) {
          fill(255, 0, 0);
        }
        if (rutor.whoowns(s, p, 0)==3) {
          fill(0, 0, 255);
        }
        if (rutor.whoowns(s, p, 0)==4) {
          fill(200, 200, 40);
        }
        if (s==0) {
          circle(942-ff*p, 975, 30);
        }
        if (s==1) {
          circle(932-ff*10+10, 932-ff*p, 30);
        }
        if (s==2) {
          circle(932-ff*(10-p), 932-ff*10-10, 30);
        }
        if (s==3) {
          circle(942, 932-ff*(10-p), 30);
        }
      }
      if (rutor.bygg[s][p]>0) {
        stroke(1);
        if (rutor.bygg[s][p]>5) {
          rutor.bygg[s][p]=5;
        }
        if (rutor.whoowns(s, p, 0)==1) {
          fill(0, 255, 0);
        }
        if (rutor.whoowns(s, p, 0)==2) {
          fill(255, 0, 0);
        }
        if (rutor.whoowns(s, p, 0)==3) {
          fill(0, 0, 255);
        }
        if (rutor.whoowns(s, p, 0)==4) {
          fill(200, 200, 40);
        }
        if (s==0) {
          text(rutor.bygg[s][p], 942-ff*p, 975);
        }
        if (s==1) {
          text(rutor.bygg[s][p], 932-ff*10+10, 932-ff*p);
        }
        if (s==2) {
          text(rutor.bygg[s][p], 932-ff*(10-p), 932-ff*10-10);
        }
        if (s==3) {
          text(rutor.bygg[s][p], 942, 932-ff*(10-p));
        }
      }
    }
  }
}

boolean areNotEqual(int a, int b, int c, int d) {
  if (a!=b && a!=c && a!=d) {
    if (b!=c && b!=d) {
      if (c!=d) {
        return true;
      }
    }
  }
  return false;
}

void bringoutyourdead(int playerNumber, boolean winner, boolean limt) {
  //print(turnTimer,"     ");
  int spelare=0;
  int Money=0;
  int ow=0;
  int ow1=0;
  int ow2=0;
  int ow3=0;
  int ow4=0;
  for ( int s=0; s<4; s++) { 
    for ( int p=0; p<10; p++) {
      if (rutor.ownd[s][p]==1) {
        ow1+=1;
      }
      if (rutor.ownd[s][p]==2) {
        ow2+=1;
      }
      if (rutor.ownd[s][p]==3) {
        ow3+=1;
      }
      if (rutor.ownd[s][p]==4) {
        ow4+=1;
      }
    }
  }
  if (playerNumber==1) {
    spelare=str.P1[0];
    Money=TotMoneyP1;
    ow=ow1;
  }
  if (playerNumber==2) {
    spelare=str.P2[0];
    Money=TotMoneyP2;
    ow=ow2;
  }
  if (playerNumber==3) {
    spelare=str.P3[0];
    Money=TotMoneyP3;
    ow=ow3;
  }
  if (playerNumber==4) {
    spelare=str.P4[0];
    Money=TotMoneyP4;
    ow=ow4;
  }

  //int elementNumber, int matchMoney, int matchStreetsOwned, int matchRounds, Boolean isWinner 
  datahantering.updateElementData(spelare, Money, ow, turnTimer, winner,limt);
}
void tiebraker() {
  pengar[0]=MoneyP1;
  pengar[1]=MoneyP2;
  pengar[2]=MoneyP3;
  pengar[3]=MoneyP4;
  pengar=sort(pengar);
  if (pengar[0]==MoneyP1) {
    bringoutyourdead(1, true,true);
    if (alive2==true) {
      bringoutyourdead(2, false,true);
    }
    if (alive3==true) {
      bringoutyourdead(3, false,true);
    }
    if (alive4==true) {
      bringoutyourdead(4, false,true);
    }
  }
  if (pengar[0]==MoneyP2) {
    bringoutyourdead(2, true,true);
    if (alive1==true) {
      bringoutyourdead(1, false,true);
    }
    if (alive3==true) {
      bringoutyourdead(3, false,true);
    }
    if (alive4==true) {
      bringoutyourdead(4, false,true);
    }
  }
  if (pengar[0]==MoneyP3) {
    bringoutyourdead(3, true,true);
    if (alive2==true) {
      bringoutyourdead(2, false,true);
    }
    if (alive1==true) {
      bringoutyourdead(1, false,true);
    }
    if (alive4==true) {
      bringoutyourdead(4, false,true);
    }
  }
  if (pengar[0]==MoneyP4) {
    bringoutyourdead(4, true,true);
    if (alive2==true) {
      bringoutyourdead(2, false,true);
    }
    if (alive3==true) {
      bringoutyourdead(3, false,true);
    }
    if (alive1==true) {
      bringoutyourdead(1, false,true);
    }
  }
  wincon.restart(); 
  end=true;
}
void actlikeoilman(int playerNumber, int s, int p) {
  addmny(playerNumber, -1*info.kostnad[s][p][0]);
  rutor.ownd[s][p]=playerNumber;
}
int checkxtile( int x) {
  int con=0;
  for ( int s=0; s<4; s++) {
    for ( int p=0; p<10; p++) {
      if (rutor.colour[s][p]==x && rutor.ownd[s][p]==5) {
        con+=1;
      }
    }
  }
  return con;
}
