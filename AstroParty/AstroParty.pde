  ArrayList Bullet;
  Ship[] ships;
  
  PShape rectangle;
  void setup() {
    ships = new Ship[4];
    for (int i = 0; i < ships.length; i++) {
      ships[i] = new Ship();
    }
    size(1000,1000);
  }

  void draw() {
    background(51);
    for (Ship ship : ships) {
       ship.update(); 
    }
    /*
    if (keyPressed==true){
      ship.degree += 3;
    }
    */
    /*
    void keyPressed(){
      for(Ship i: ship){
        if(key = i.keyLetters[0]){
          keys[0] = 
    */
  }

  

    