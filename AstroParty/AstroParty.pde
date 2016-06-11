  ArrayList<Bullet> bulletsFired;
  Ship[] ships;
  
  PShape rectangle;
  //setup game
  void setup() {
    ships = new Ship[4];
    char[] test = {'a', 's'};
    char[] test2 = {'f', 'g'};
    ships[0] = new Ship(test);
    ships[1] = new Ship(test2);
    size(1000,500);
    bulletsFired = new ArrayList<Bullet>();
  }

 
  void draw() {
    background(51);
    for (Ship ship : ships) {
      if (ship != null) {
       ship.update();
      }
    }
    for (Bullet bullet : bulletsFired) {
      if (bullet != null) {
        bullet.draw();
      }
    }
  }
    
    
  void keyPressed() {
    for (Ship ship : ships) {
      if (ship != null) {
        if (key == ship.keyLetters[0] && ship.keys[0] == 0) {
          bulletsFired.add(ship.shoot());
          ship.keys[0] = 1;
        }
        if (key == ship.keyLetters[1]) {
          ship.keys[1] = 1;
        }
      } 
    }
  }
    
  void keyReleased(){
    for (Ship ship : ships) {
      if (ship != null) {
        if (key == ship.keyLetters[0] && ship.keys[0] == 1) {
          ship.keys[0] = 0;
        }

        if (key == ship.keyLetters[1]) {
          ship.keys[1] = 0;
        }
      }
    }
  }