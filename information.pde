class info {
  int[][][]hyra={{
      //{0 hus,1 hus, 2 hus, 3 hus, 4 hus, hotell},
      {0, 0, 0, 0, 0, 0 }, //Gååååååååååååååååååååååååååååååååååååååååå
      {40, 200, 600, 1800, 3200, 5000}, // Väster långgatan
      {0, 0, 0, 0, 0, 0}, //allmäning
      {80, 400, 1200, 3600, 6400, 9000}, //Horngatan
      {0, 0, 0, 0, 0, 0}, //skatt
      {0, 0, 0, 0, 0, 0}, //station
      {120, 600, 1800, 5400, 8000, 11000}, //Folkungagatan
      {0, 0, 0, 0, 0, 0}, // Chans
      {120, 600, 1800, 5400, 8000, 11000 }, //Götagatan
    {180, 800, 2000, 6000, 9000, 12000 }}, //Ringvägen
    {{0, 0, 0, 0, 0, 0 }, //På besök/Fängelse fast inte?
      {200, 1000, 3000, 9000, 12500, 15000 }, //S.t Eriksgatan
      {0, 0, 0, 0, 0, 0 }, //Elverket
      {200, 1000, 3000, 9000, 12500, 15000 }, //Odengatan
      {240, 1200, 3600, 10000, 14000, 18000 }, //Valhallavägen
      {0, 0, 0, 0, 0, 0 }, //Östra Station
      {280, 1400, 4000, 11000, 15000, 19000 }, //Sturegatan
      {0, 0, 0, 0, 0, 0}, //allmäning
      {280, 1400, 4000, 11000, 15000, 19000 }, //Karlavägen
    {320, 1600, 4400, 12000, 16000, 20000 }}, //Narvavägern
    {{ 0, 0, 0, 0, 0, 0}, //Fri Parkering
      {360, 1800, 5000, 14000, 17500, 21000 }, //Strandvägen
      {0, 0, 0, 0, 0, 0 }, //Chans
      {360, 1800, 5000, 14000, 17500, 21000 }, //Kungsträdgårdsgatan
      {400, 2000, 6000, 15000, 18500, 22000 }, //Hamngatan
      {0, 0, 0, 0, 0, 0 }, //Central Station
      {440, 2200, 6600, 16000, 19500, 2300 }, //Vasagatan
      {440, 2200, 6600, 16000, 19500, 2300 }, //Kungsgatan
      {0, 0, 0, 0, 0, 0 }, //Vattenledningsverket
    {480, 2400, 7200, 17000, 20500, 24000 }}, //Stureplan
    {{0, 0, 0, 0, 0, 0 }, //Gå i Fängelse!
      { 520, 2600, 7600, 18000, 22000, 25500  }, //Gustav Adlofs Torg
      { 520, 2600, 7600, 18000, 22000, 25500 }, //Drottninggatan
      {0, 0, 0, 0, 0, 0 }, //Allmäning
      { 560, 3000, 9000, 20000, 24000, 28000  }, //Diplomatstaden
      {0, 0, 0, 0, 0, 0 }, //Norra station
      { 0, 0, 0, 0, 0, 0}, //Chans
      {700, 3500, 10000, 22000, 26000, 30000  }, //Centrum
      {0, 0, 0, 0, 0, 0 }, //Lyxskatt
    {1000, 4000, 12000, 28000, 34000, 40000  }}//Norrmalmstorg
    //fortsätt så här men när s ändras så skriver du }{ för ändra talet if den första []
  };

  int [][][] kostnad={
    //{kostnaden för att köpa,kostnad för bebyggning,inteknings värde},
    {{0, 0, 0 }, //Gååååååååååååååååååååååååååååååååååååååååå
      {1200, 1000, 600}, // Väster långgatan
      {0, 0, 0}, // allmäning
      {1200, 1000, 600}, //Horngatan
      {0, 0, 0}, // skatt
      {4000, 0, 0}, // station
      {2000, 1000, 1000}, //Folkungagatan
      {0, 0, 0}, // Chans
      {2000, 1000, 1000 }, //Götagatan
    {2400, 1000, 1200  }}, //Ringvägen
    {{0, 0, 0 }, //På besök/Fängelse fast inte?
      {2800, 2000, 1400 }, //S.t Eriksgatan
      {4000, 0, 0 }, //Elverket
      {2800, 2000, 1400 }, //Odengatan
      {3300, 2000, 1600 }, //Valhallavägen
      {4000, 0, 0 }, //Östra Station
      {3600, 2000, 1800 }, //Sturegatan
      {0, 0, 0}, //allmäning
      {3600, 2000, 1800 }, //Karlavägen
    {4000, 2000, 2000 }}, //Narvavägern
    {{0, 0, 0 }, //Fri Parkering
      {4400, 3000, 2200 }, //Strandvägen
      {0, 0, 0 }, //Chans
      {4400, 3000, 2200 }, //Kungsträdgårdsgatan
      {4800, 3000, 2400 }, //Hamngatan
      {4000, 0, 0 }, //Central Station
      {5200, 3000, 2600 }, //Vasagatan
      {5200, 3000, 2600 }, //Kungsgatan
      {4000, 0, 0 }, //Vattenledningsverket
    {5600, 3000, 2800 }}, //Stureplan
    {{0, 0, 0 }, //Gå i Fängelse!
      {6000, 4000, 3000 }, //Gustav Adlofs Torg
      {6000, 4000, 3000 }, //Drottninggatan
      {0, 0, 0 }, //Allmäning
      {6400, 4000, 3200 }, //Diplomatstaden
      {4000, 0, 0 }, //Norra station
      {0, 0, 0 }, //Chans
      {7000, 4000, 3500 }, //Centrum
      {0, 0, 0 }, //Lyxskatt
    {8000, 4000, 4000 }} //Norrmalmstorg
    //fortsätt så här men när s ändras så skriver du }{ för ändra talet if den första []
  };




  // Jag tar och listar upp de olika korten/ägendomar och all info på dem
  // Tot är räkning på tomter totallt inte sspell positioner.
  // Har taggit tallen på korten *20, allt kanske blev rätt?

  // De första/bruna/billiga

  /* Väster Långgatan/ Nr:1 / Tot:1
   Kostnad = 1200
   Hyra = 40
   Med 1 Hus = 200
   Med 2 Hus = 600
   Med 3 Hus = 1800
   Med 4 Hus = 3200
   Med Hotell = 5000
   
   Intecknings värde = 600
   Hus kostar = 1000/st
   Hotell kostar = 1000/st + 4 Hus
   */

  /* Hornsgatan/ Nr:2 7 Tot:2
   Kostnad = 1200
   Hyra = 80
   Med 1 Hus = 400
   Med 2 Hus = 1200
   Med 3 Hus = 3600
   Med 4 Hus = 6400
   Med Hotell = 9000
   
   Intecknings värde = 600
   Hus kostar = 1000/st
   Hotell kostar = 1000/st + 4 Hus
   */

  // De andra/ljus blå

  /* Folkungagatan/ Nr:1 / Tot:3
   Kostnad = 2000
   Hyra = 120
   Med 1 Hus = 600
   Med 2 Hus = 1800
   Med 3 Hus = 5400
   Med 4 Hus = 8000
   Med Hotell = 11000
   
   Intecknings värde = 1000
   Hus kostar = 1000/st
   Hotell kostar = 1000/st + 4 Hus
   */

  /* Götgatan/ Nr:2 / Tot:4
   Kostnad = 2000
   Hyra = 120
   Med 1 Hus = 600
   Med 2 Hus = 1800
   Med 3 Hus = 5400
   Med 4 Hus = 8000
   Med Hotell = 11000
   
   Intecknings värde = 1000
   Hus kostar = 1000/st
   Hotell kostar = 1000/st + 4 Hus
   */

  /* Ringvägen/ Nr:2 / Tot:4
   Kostnad = 2400
   Hyra = 180
   Med 1 Hus = 800
   Med 2 Hus = 2000
   Med 3 Hus = 6000
   Med 4 Hus = 9000
   Med Hotell = 12000
   
   Intecknings värde = 1200
   Hus kostar = 1000/st
   Hotell kostar = 1000/st + 4 Hus
   */

  // De tredje/ rosa

  /* S:T Eriksgatan/ Nr:1 / Tot:5
   Kostnad = 2800
   Hyra = 200
   Med 1 Hus = 1000
   Med 2 Hus = 3000
   Med 3 Hus = 9000
   Med 4 Hus = 12500
   Med Hotell = 15000
   
   Intecknings värde = 1400
   Hus kostar = 2000/st
   Hotell kostar = 2000/st + 4 Hus
   */

  /* Odengatan/ Nr:2 / Tot:6
   Kostnad = 2800
   Hyra = 200
   Med 1 Hus = 1000
   Med 2 Hus = 3000
   Med 3 Hus = 9000
   Med 4 Hus = 12500
   Med Hotell = 15000
   
   Intecknings värde = 1400
   Hus kostar = 2000/st
   Hotell kostar = 2000/st + 4 Hus
   */

  /* Valhallavägen/ Nr:3 / Tot:7
   Kostnad = 3300
   Hyra = 240
   Med 1 Hus = 1200
   Med 2 Hus = 3600
   Med 3 Hus = 10000
   Med 4 Hus = 14000
   Med Hotell = 18000
   
   Intecknings värde = 1600
   Hus kostar = 2000/st
   Hotell kostar = 2000/st + 4 Hus
   */

  // De fjärde/Orange

  /* Sturegatan/ Nr:1 / Tot:8
   Kostnad = 3600
   Hyra = 280
   Med 1 Hus = 1400
   Med 2 Hus = 4000
   Med 3 Hus = 11000
   Med 4 Hus = 15000
   Med Hotell = 19000
   
   Intecknings värde = 1800
   Hus kostar = 2000/st
   Hotell kostar = 2000/st + 4 Hus
   */

  /* Karlavägen/ Nr:2 / Tot:9
   Kostnad = 3600
   Hyra = 280
   Med 1 Hus = 1400
   Med 2 Hus = 4000
   Med 3 Hus = 11000
   Med 4 Hus = 15000
   Med Hotell = 19000
   
   Intecknings värde = 1800
   Hus kostar = 2000/st
   Hotell kostar = 2000/st + 4 Hus
   */

  /* Narvägen/ Nr:3 / Tot:10
   Kostnad = 4000
   Hyra = 320
   Med 1 Hus = 1600
   Med 2 Hus = 4400
   Med 3 Hus = 12000
   Med 4 Hus = 16000
   Med Hotell = 20000
   
   Intecknings värde = 2000
   Hus kostar = 2000/st
   Hotell kostar = 2000/st + 4 Hus
   */

  // De femte/röda

  /* Strandvägen/ Nr:1 / Tot:11
   Kostnad = 4400
   Hyra = 360
   Med 1 Hus = 1800
   Med 2 Hus = 5000
   Med 3 Hus = 14000
   Med 4 Hus = 17500
   Med Hotell = 21000
   
   Intecknings värde = 2200
   Hus kostar = 3000/st
   Hotell kostar = 3000/st + 4 Hus
   */

  /* Kungträdgårdsgatan/ Nr:2 / Tot:12
   Kostnad = 4400
   Hyra = 360
   Med 1 Hus = 1800
   Med 2 Hus = 5000
   Med 3 Hus = 14000
   Med 4 Hus = 17500
   Med Hotell = 21000
   
   Intecknings värde = 2200
   Hus kostar = 3000/st
   Hotell kostar = 3000/st + 4 Hus
   */

  /* Hamngatan/ Nr:3 / Tot:13
   Kostnad = 4800
   Hyra = 400
   Med 1 Hus = 2000
   Med 2 Hus = 6000
   Med 3 Hus = 15000
   Med 4 Hus = 18500
   Med Hotell = 22000
   
   Intecknings värde = 2400
   Hus kostar = 3000/st
   Hotell kostar = 3000/st + 4 Hus
   */

  // Den sjätte/gul

  /* Vasagatan/ Nr:1 / Tot:14
   Kostnad = 5200
   Hyra = 440
   Med 1 Hus = 2200
   Med 2 Hus = 6600
   Med 3 Hus = 16000
   Med 4 Hus = 19500
   Med Hotell = 23000
   
   Intecknings värde = 2600
   Hus kostar = 3000/st
   Hotell kostar = 3000/st + 4 Hus
   */

  /* Kungsgatan/ Nr:2 / Tot:15
   Kostnad = 5200
   Hyra = 440
   Med 1 Hus = 2200
   Med 2 Hus = 6600
   Med 3 Hus = 16000
   Med 4 Hus = 19500
   Med Hotell = 23000
   
   Intecknings värde = 2600
   Hus kostar = 3000/st
   Hotell kostar = 3000/st + 4 Hus
   */

  /* Stureplan/ Nr:3 / Tot:16
   Kostnad = 5600
   Hyra = 480 
   Med 1 Hus = 2400
   Med 2 Hus = 7200
   Med 3 Hus = 17000
   Med 4 Hus = 20500
   Med Hotell = 24000
   
   Intecknings värde = 2800
   Hus kostar = 3000/st
   Hotell kostar = 3000/st + 4 Hus
   */

  // De sjunde/grön

  /* Gustav Adolfs Torg/ Nr:1 / Tot:17
   Kostnad = 6000
   Hyra = 520 (26)
   Med 1 Hus = 2600 (130)
   Med 2 Hus = 7600 (390)
   Med 3 Hus = 18000 (900)
   Med 4 Hus = 22000 (1100)
   Med Hotell = 25500 (1275)
   
   Intecknings värde = 3000
   Hus kostar = 4000/st
   Hotell kostar = 4000/st + 4 Hus
   */

  /* Drottninggatan/ Nr:2 / Tot:18
   Kostnad = 6000
   Hyra = 520 (26)
   Med 1 Hus = 2600 (130)
   Med 2 Hus = 7600 (390)
   Med 3 Hus = 18000 (900)
   Med 4 Hus = 22000 (1100)
   Med Hotell = 25500 (1275)
   
   Intecknings värde = 3000
   Hus kostar = 4000/st
   Hotell kostar = 4000/st + 4 Hus
   */

  /* Diplomatstaden/ Nr:3 / Tot:19
   Kostnad = 6400
   Hyra = 560 (28)
   Med 1 Hus = 3000 (150)
   Med 2 Hus = 9000 (450)
   Med 3 Hus = 20000 (1000)
   Med 4 Hus = 24000 (1200)
   Med Hotell = 28000 (1400)
   
   Intecknings värde = 3200 (160)
   Hus kostar = 4000/st (200)
   Hotell kostar = 4000/st + 4 Hus
   */

  // De åttonde/ blå / sist

  /* Centrum/ Nr:1 / Tot:20
   Kostnad = 7000
   Hyra = 700 (35)
   Med 1 Hus = 3500 (175)
   Med 2 Hus = 10000 (500)
   Med 3 Hus = 22000 (1100)
   Med 4 Hus = 26000 (1300)
   Med Hotell = 30000 (1500)
   
   Intecknings värde = 3500 (175)
   Hus kostar = 4000/st (200)
   Hotell kostar = 4000/st + 4 Hus
   */

  /* Norrmalmstorg/ Nr:2 / Tot:21
   Kostnad = 8000
   Hyra = 1000 (50)
   Med 1 Hus = 4000 (200)
   Med 2 Hus = 12000 (600)
   Med 3 Hus = 28000 (1400)
   Med 4 Hus = 34000 (1700)
   Med Hotell = 40000 (2000)
   
   Intecknings värde = 4000 (200)
   Hus kostar = 4000/st (200)
   Hotell kostar = 4000/st + 4 Hus
   */

  /*Stationer
   Kostnad = 4000
   Hyra = 500 (25)
   Hyra med 2 = 1000 (50)
   Hyra med 3 = 2000 (100)
   Hyra med 4 = 4000 (200)
   
   Intecknings värde = 2000 (100)
   */

  /*Anläggningar / El / Vatten
   Kostnad = 3000
   Hyra 1 = 80*Tärnings slag (4*)
   Hyra 2 = 200*Tärnings slag (10*)
   
   Intecknings värde = 1500 (75)
   
   */
}
