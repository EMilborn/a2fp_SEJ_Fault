  ArrayList<Entity> bulletsFired;
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
    bulletsFired = new ArrayList<Entity>();
  }

 
  void draw() {
    background(51);
    for (Ship ship : ships) {
      if (ship != null) {
       ship.update();
       ship.collide(ships);
       ship.collide(bulletsFired);
       ship.move();
      }
    }
    for (Entity bullet : bulletsFired) {
      if (bullet != null) {
        ((Bullet) bullet).draw();
      }
    }
    
  }
    
    
  void keyPressed() {
    for (Ship ship : ships) {
      if (ship != null) {
        if (key == ship.keyLetters[0] && !ship.keys[0]) {
          bulletsFired.add(ship.shoot());
          ship.keys[0] = true;
        }
        if (key == ship.keyLetters[1]) {
          ship.keys[1] = true;
        }
      } 
    }
  }
    
  void keyReleased(){
    for (Ship ship : ships) {
      if (ship != null) {
        if (key == ship.keyLetters[0] && ship.keys[0]) {
          ship.keys[0] = false;
        }
        if (key == ship.keyLetters[1]) {
          ship.keys[1] = false;
        }
      }
    }
  }