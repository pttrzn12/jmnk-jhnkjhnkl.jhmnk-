class DataHantering {

  ArrayList<Datapunkt> strategyDataList;
  PrintWriter strategyDataWriter;

  DataHantering() {
    strategyDataList  = new ArrayList<Datapunkt>();
    setupStrategyDataList();
    strategyDataWriter = createWriter("strategyData.txt");
  }

  void setupStrategyDataList() {
    for ( int i=0; i<10; i++) {
      Datapunkt datapunkt = new Datapunkt(i);
      strategyDataList.add(datapunkt);
    }
  }

  void updateElementData(int elementNumber, int matchMoney, int matchStreetsOwned, int matchRounds, Boolean isWinner, boolean islimit /* ev. något mer */ ) {
    Datapunkt datapunkt = strategyDataList.get(elementNumber);
    datapunkt.totMoney += matchMoney;
    datapunkt.streetsOwned += matchStreetsOwned;
    datapunkt.playedRounds += matchRounds;
    datapunkt.playedMatches += 1;
    if (isWinner) {
      datapunkt.wonMatches += 1;
    }
    if (islimit) {
      datapunkt.limitmatches+=1;
    }
    strategyDataList.set(elementNumber, datapunkt);
  }

  void saveData() {
    strategyDataWriter.println("Strateginamn, Andel vinster, Snitt tjänade pengar per match, Snitt tjänade pengar per runda, Snitt antal ägda gator, matcher som gick till limit");
    for (int i=0; i < strategyDataList.size(); i++) {
      Datapunkt datapunkt = strategyDataList.get(i); //Det här skriver vi bara för att kunna referera till den nuvarande datapunkten som "datapunkt" iställer för "strategyDataList.get(i)"

      //Här beräknas vissa stats som kräver andra räkneoperationer än att bara adderas/subtraheras vid olika tidpunkter i simuleringen
      float winRate = datapunkt.wonMatches/datapunkt.playedMatches;
      float limitRate = datapunkt.limitmatches;
      float averageMoneyPerMatch = datapunkt.totMoney/datapunkt.playedMatches;
      float averageMoneyPerRound = datapunkt.totMoney/datapunkt.playedRounds;
      float averageStreetsOwnedPerMatch = datapunkt.streetsOwned/datapunkt.playedMatches; 

      //Här tar vi våra stats och låter vårt PrintWriter-objekt att skriva ut dessa i det kopplade textdokumentet "strategyData.txt" och sedan rensa sig själv
      strategyDataWriter.println(datapunkt.strategyIdentifier + "," + winRate + "," + averageMoneyPerMatch + "," + averageMoneyPerRound + "," + averageStreetsOwnedPerMatch + "," + limitRate);
    }
    strategyDataWriter.flush();
    strategyDataWriter.close();
  }
}

class Datapunkt { //En datapunkt är ett objekt som sparar en kod/ett namn (identifier) för en viss strategi och stats för den specifika strategin
  int strategyIdentifier; //Skrivs ut i datan för att vi sen ska veta vilken strategi som hör till vilken data
  int wonMatches, playedMatches, playedRounds;
  int limitmatches;
  int totMoney;
  int streetsOwned; //Hur många gator strategin totalt har ägt genom alla spelomgångar
  Datapunkt(int strategyIdentifier) {
    this.strategyIdentifier = strategyIdentifier;
    this.wonMatches = 0;
    this.limitmatches = 0;
    this.playedMatches = 0;
    this.playedRounds = 0;
    this.totMoney = 0;
    this.streetsOwned = 0;
  }
}
