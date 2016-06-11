  Ship[] ships;
  boolean[] keysPressed;
  int MAX_PLAYERS = 4;

  void setup() {
    ships = new Ship[4];
    for (int i = 0; i < ships.length; i++) {
      ships[i] = new Ship();
    }
    keysPressed = new boolean[256];
    size(1000,1000);
  }

  void draw() {
    background(51);
    for (Ship ship : ships) {
      ship.update(); 
    }
    if (keysPressed['q']) {
      ships[0].degree += 3;
    }
    if (keysPressed['e']) {
      // ships[0].shoot();
    }
    if (keysPressed['a']) {
      ships[1].degree += 3;
    }
    if (keysPressed['d']) {
      // ships[1].shoot();
    }
    if (keysPressed['i']) {
      ships[2].degree += 3;
    }
    if (keysPressed['p']) {
      // ships[2].shoot();
    }
    if (keysPressed['k']) {
      ships[3].degree += 3;
    }
    if (keysPressed[';']) {
      // ships[3].shoot();
    }
  }
  
  void keyPressed() {
     if (key < 256) {
       keysPressed[key] = true;
     }
  }
  
  void keyReleased() {
     if (key < 256) {
        keysPressed[key] = false; 
     }
  }