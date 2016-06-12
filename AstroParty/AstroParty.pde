ArrayList<Entity> bulletsFired;
Ship[] ships;
int[] wins;

// First key is to shoot, second key is to rotate
char[] playerOneKeys = {'a', 's'};
char[] playerTwoKeys = {'f', 'g'};

//setup game
void setup() {
  ships = new Ship[2];
  wins = new int[] {0, 0};
  size(1000,500);
  startRound();
}

void draw() {
  background(51);
  // Print out all ships on screen
  for (Ship ship : ships) {
    if (ship != null && ship.state == ship.ALIVE) {
      ship.update();
      ship.collide(ships);
      if (ship.collide(bulletsFired)) {
        if (ship == ships[0]) {
          // Player 2 won
          wins[1]++;
        } else {
          // Player 1 won
          wins[0]++;
        }
        startRound();
      }
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

void startRound() {
  ships[0] = new Ship(playerOneKeys);
  ships[1] = new Ship(playerTwoKeys);
  bulletsFired = new ArrayList<Entity>();
}