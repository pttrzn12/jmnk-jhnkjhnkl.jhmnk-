class Rutor {
  int[][]flipped={
    //s0
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    //s1  
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    //s2  
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    //s3
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
  };
  int[][]bygg={
    //s0
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    //s1  
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    //s2  
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    //s3
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
  };
  int[][]colour={
    //s0
    {0, 1, 0, 1, 0, 0, 2, 0, 2, 2}, 
    //s1  
    {0, 3, 0, 3, 3, 0, 4, 0, 4, 4}, 
    //s2  
    {0, 5, 0, 5, 5, 0, 6, 6, 0, 6}, 
    //s3
    {0, 7, 7, 0, 7, 0, 0, 8, 0, 8}
  };
  int[][]ownd={
    //0=N/A
    //1=player 1 äger denna tomt
    //2=player 2 äger denna tomt
    //3=player 3 äger denna tomt
    //4=player 4 äger denna tomt
    //5=Ej ägd
    //s0 
    {0, 5, 0, 5, 0, 5, 5, 0, 5, 5}, 
    //s1  
    {0, 5, 5, 5, 5, 5, 5, 0, 5, 5}, 
    //s2  
    {0, 5, 0, 5, 5, 5, 5, 5, 5, 5}, 
    //s3
    {0, 5, 5, 0, 5, 5, 0, 5, 0, 5}
  };
  int[][]newownd={
    {0, 5, 0, 5, 0, 5, 5, 0, 5, 5}, 
    //s1  
    {0, 5, 5, 5, 5, 5, 5, 0, 5, 5}, 
    //s2  
    {0, 5, 0, 5, 5, 5, 5, 5, 5, 5}, 
    //s3
    {0, 5, 5, 0, 5, 5, 0, 5, 0, 5}
  };
  int countverk( int playerNumber) {
    int r=0;
    if (ownd[1][2]==playerNumber) {
      r+=1;
    }
    if (ownd[2][8]==playerNumber) {
      r+=1;
    }
    return r;
  }
  int countstations(int playerNumber) {
    int r=0;
    if (ownd[0][5]== playerNumber && rutor.flipped[0][5]==0) {
      r+=1;
    }
    if (ownd[1][5]== playerNumber && rutor.flipped[1][5]==0) {
      r+=1;
    }
    if (ownd[2][5]== playerNumber && rutor.flipped[2][5]==0) {
      r+=1;
    }
    if (ownd[3][5]== playerNumber && rutor.flipped[3][5]==0) {
      r+=1;
    }
    return r;
  }
  int whoowns(int s, int p, int playerNumber) {
    if (p>=10) {
      p-=10;
      s+=1;
      if (s==4) {
        s=0;
        addmny(4000, playerNumber);
      }
      //print(p);
    }
    int r=ownd[s][p];
    return r;
  }
  //Postion 0 (köp)
  //John D Rockefeller =0
  //Aron =1
  //Fokusera brunt =2
  //Fokusera vit =3
  //Fokusera rosa =4
  //Fokusera orange =5
  //Fokusera rött =6
  //Fokusera gult =7
  //Fokusera grönt =8
  //Fokusera blått =9
  //Ronald McDonald =10
  //Love =11
  //Kurt Bertillsson IV =12
  //Tomasa Edison =13
  //Elon Musk =14


  void buy(int playerNumber, int s, int p) {
    //kollar om dem kan bygga
    if (p!=5) {
      int k=0;
      if ((s==1&& p==2)||(s==2&&p==8)) {
        k+=1;
      }
      if (k==0) {
        if (rutor.whoowns(s, p, playerNumber)==playerNumber) {
          if (bygg[s][p]<5) {
            //   print(bygg[s][p]);
            // print("       ");
            if (checkmny(playerNumber)>=info.kostnad[s][p][2]) {
              addmny(playerNumber, -1*info.kostnad[s][p][2]); 
              bygg[s][p]+=bygg[s][p]+1;
            }
          }
        }
      }
    }
    //kollar om dem kan köpa
    if (rutor.whoowns(s, p, playerNumber)==5) {
      if (info.kostnad[s][p][0]!=0) {
        if (checkmny(playerNumber)>=info.kostnad[s][p][0]) {
          lim=20;
          if (checkstrat(playerNumber, 0)==0) {
            addmny(playerNumber, -1*info.kostnad[s][p][0]);
            rutor.ownd[s][p]=playerNumber;
          }
          if (checkstrat(playerNumber, 0)==1) {
            //q=färgen spelaren står på
            int q=colour[s][p];
            for ( int y=0; y<4; y++) {
              for ( int x=0; x<10; x++) { 
                if (rutor.whoowns(y, x, playerNumber)!=5 && rutor.whoowns(y, x, playerNumber)!=playerNumber) {
                  if (colour[y][x]==q) {
                    if (info.kostnad[s][p][0]!=0) {
                      if (checkmny(playerNumber)>=info.kostnad[s][p][0]) {
                        addmny(playerNumber, -1*info.kostnad[s][p][0]);
                        rutor.ownd[s][p]=playerNumber;
                      }
                    }
                  }
                }
              }
            }
          }
          if (checkstrat(playerNumber, 0)==2) {
            int q=colour[s][p];
            if (q==1 || q==2 ) {
              addmny(playerNumber, -1*info.kostnad[s][p][0]);
              rutor.ownd[s][p]=playerNumber;
            }
            if (checkxtile(1)+checkxtile(2)==0) {
              actlikeoilman(playerNumber, s, p);
            }
          }
          /*if (checkstrat(playerNumber, 0)==3) {
           int q=colour[s][p];
           if (q==2) {
           addmny(playerNumber, -1*info.kostnad[s][p][0]);
           rutor.ownd[s][p]=playerNumber;
           }
           }*/
          if (checkstrat(playerNumber, 0)==3) {
            int q=colour[s][p];
            if (q==3||q==4||q==5) {
              addmny(playerNumber, -1*info.kostnad[s][p][0]);
              rutor.ownd[s][p]=playerNumber;
            }
            if (checkxtile(3)+checkxtile(4)+checkxtile(5)==0) {
              actlikeoilman(playerNumber, s, p);
            }
          }
          /* if (checkstrat(playerNumber, 0)==5) {
           int q=colour[s][p];
           if (q==4) {
           addmny(playerNumber, -1*info.kostnad[s][p][0]);
           rutor.ownd[s][p]=playerNumber;
           }
           }
           if (checkstrat(playerNumber, 0)==6) {
           int q=colour[s][p];
           if (q==5) {
           addmny(playerNumber, -1*info.kostnad[s][p][0]);
           rutor.ownd[s][p]=playerNumber;
           }
           }*/
          if (checkstrat(playerNumber, 0)==4) {
            int q=colour[s][p];
            if (q==6||q==7||q==8) {
              addmny(playerNumber, -1*info.kostnad[s][p][0]);
              rutor.ownd[s][p]=playerNumber;
            }
             if (checkxtile(6)+checkxtile(7)+checkxtile(8)==0) {
              actlikeoilman(playerNumber, s, p);
            }
          }
          /*  if (checkstrat(playerNumber, 0)==8) {
           int q=colour[s][p];
           if (q==7) {
           addmny(playerNumber, -1*info.kostnad[s][p][0]);
           rutor.ownd[s][p]=playerNumber;
           }
           }
           if (checkstrat(playerNumber, 0)==9) {
           int q=colour[s][p];
           if (q==8) {
           addmny(playerNumber, -1*info.kostnad[s][p][0]);
           rutor.ownd[s][p]=playerNumber;
           }
           }*/
          if (checkstrat(playerNumber, 0)==5) {
            int q=colour[s][p];
            for ( int y=0; y<4; y++) {
              for ( int x=0; x<10; x++) { 
                if (q==colour[y][x]) {
                  if (q==1||q==8) {
                    if (x!=s) {
                      if (whoowns(s, p, playerNumber)!=playerNumber) {
                        addmny(playerNumber, -1*info.kostnad[s][p][0]);
                        rutor.ownd[s][p]=playerNumber;
                      }
                    }
                  }
                }
              }
            }
          }
          if (checkstrat(playerNumber, 0)==6) {
            if (((checktotmny(playerNumber)/10)+info.kostnad[s][p][0])<=checkmny(playerNumber)) {
              addmny(playerNumber, -1*info.kostnad[s][p][0]);
              rutor.ownd[s][p]=playerNumber;
            }
          }
          if (checkstrat(playerNumber, 0)==7) {
            if (p==5) {
              addmny(playerNumber, -1*info.kostnad[s][p][0]);
              rutor.ownd[s][p]=playerNumber;
            }
            if(countverk(5)==0){
             actlikeoilman(playerNumber,s,p); 
            }
          }
          if (checkstrat(playerNumber, 0)==8) {
            if ((s==2&&p==7)||(s==1&&p==2)) {
              addmny(playerNumber, -1*info.kostnad[s][p][0]);
              rutor.ownd[s][p]=playerNumber;
            }
            if(countstations(5)==0){
             actlikeoilman(playerNumber,s,p); 
            }
          }
          if (checkstrat(playerNumber, 0)==9) {
            if ((s==2&&p==7)||(s==1&&p==2)||p==5) {
              addmny(playerNumber, -1*info.kostnad[s][p][0]);
              rutor.ownd[s][p]=playerNumber;
            }
            if(countverk(5)+countstations(5)==0){
             actlikeoilman(playerNumber,s,p); 
            }
          }
        }
      }
    }
  }
}
