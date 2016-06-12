ArrayList<Entity> bulletsFired;
Ship[] ships;

PShape rectangle;
//setup game
void setup() {
  ships = new Ship[4];
  // First key is to shoot, second key is to rotate
  char[] test = {'a', 's'};
  char[] test2 = {'f', 'g'};
  ships[0] = new Ship(test);
  ships[1] = new Ship(test2);
  size(1000,500);
  bulletsFired = new ArrayList<Entity>();
}


void draw() {
  background(51);
  // Print out all ships on screen
  for (Ship ship : ships) {
    if (ship != null && ship.state == ship.ALIVE) {
      ship.update();
      ship.collide(ships);
      ship.collide(bulletsFired);
    }
  }

  // Print out all bullets on screen
  for (int i = 0; i < bulletsFired.size(); i++) {
    Bullet bullet = (Bullet) bulletsFired.get(i);
    if (bullet == null || !bullet.shot) {
      // Maintainance
      bulletsFired.remove(i);
    } else {
      bullet.update();
    }
  }
}

void keyPressed() {
  for (Ship ship : ships) {
    if (ship != null) {
      // Prevents user from shooting multiple bullets while holding down the key
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