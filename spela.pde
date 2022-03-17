class Spela {
  boolean dub=true;
  int mov,k;
  int roll(int pl) {
    mov=0;
    k=0;
    dub=true;
    while (dub==true) {
      int r1 = int(random(1, 7));
      int r2 = int(random(1, 7));
      mov=r1+r2-2;    
      if (r1!=r2) {
        dub=false;
      }
      k+=1;
      if(k>=3){
        if(pl==1){
          jail1=true;
        }
        if(pl==2){
          jail2=true;
        }
        if(pl==3){
          jail3=true;
        }
        if(pl==4){
          jail4=true;
        }
      }
    }
    return mov;
  }
}
