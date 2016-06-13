int MENU = 0;
int GAME = 1;
int WINNER = 2;

Ship winner;
ArrayList<Entity> bulletsFired;
Ship[] ships;
int[] wins;
PImage NIGHT;
ArrayList<Barrier> field;

// First key is to shoot, second key is to rotate
char[] playerOneKeys = {'a', 's'};
char[] playerTwoKeys = {'k', 'l'};

int state;
int fieldSize;
boolean collision;

//setup game
void setup() {
  state = 0;
  fieldSize = 750;
  ships = new Ship[2];
  wins = new int[] {0, 0};
  size(1250,750);
  collision = false;
  startRound();
  NIGHT = loadImage("start.png");
  NIGHT.loadPixels();
}

void draw() {
  background(NIGHT);
  if (state == GAME) {
    drawRound();
  } else if (state == WINNER) {
    drawWinner();
  }
}

void keyPressed() {
  for (Ship ship : ships) {
    if (ship != null) {
      // Prevents user from shooting multiple bullets while holding down the key
      if (key == ship.keyLetters[0] && !ship.keys[0]) {
        if (ship.state == ship.PILOT) {
          // Shoot button propels pilot
          ship.speed = 4;
        } else {
          bulletsFired.add(ship.shoot());
        }
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
        if (ship.state == ship.PILOT) {
          ship.speed = 0;
        }
        ship.keys[0] = false;
      }
      if (key == ship.keyLetters[1]) {
        ship.keys[1] = false;
      }
    }
  }
}

void startRound() {
  ships[0] = new Ship(playerOneKeys, "green");
  ships[1] = new Ship(playerTwoKeys, "red");
  ships[0].setXY(75, 75);
  ships[1].setXY(675, 675);
  ships[1].degree = 230; // 50 + 180
  
  // Autobalance
  if (wins[1] - wins[0] > 2) {
    ships[0].shield = true;
    ships[0].updateShape();
  } else if (wins[0] - wins[1] > 2) {
    ships[1].shield = true;
    ships[1].updateShape();
  }
  bulletsFired = new ArrayList<Entity>();
  field = new ArrayList<Barrier>();
  setupField();
}

void setupField(){
  for(int i=0; i < fieldSize; i+=30){
    field.add(new Barrier(i,0, false));
    field.add(new Barrier(fieldSize - i,fieldSize, false));
    field.add(new Barrier(0, fieldSize - i, false));
    field.add(new Barrier(fieldSize, i, false));
  }
}
void drawRound() {
  // Print out all ships on screen
  for(Barrier i: field) i.update();
  //ships[0].update(ships[1]);
  for (Ship ship : ships) {
    if (ship != null && ship.state != ship.DEAD) {

      /*//new implementation - start
      ship.move();
      ship.x += ship.addX;

      if (ship.collide(field.toArray(new Entity[field.size()]))) {
        ship.x -= ship.addX;
        System.out.println("collided with x...");
      }

      ship.y += ship.addY;
      if (ship.collide(field.toArray(new Entity[field.size()]))) {
        ship.y -= ship.addY;
        System.out.println("collided with y...");
    }

      ship.update();
      //new implementation - end*/
      ship.move();
      ship.borderCheck();
      ship.update();

      if (ship.collideBullet(bulletsFired)) {
        if (ship == ships[0]) {
          if (ship.shield) {
            ship.shield = false;
            ship.updateShape();
          } else if (ship.state == ship.PILOT) {
            // Player 2 won
            wins[1]++;
            if (wins[1] == 5) {
              setWinner(ship.col);
            } else {
              startRound();
            }
          } else {
            // Player 1 has been hit, but isn't dead.
            ship.state = ship.PILOT;
            ship.shape = loadShape("images/green_pilot.svg");
            ship.shape.scale(1.5);
            ship.speed = 0;
          }
        } else {
          if (ship.shield) {
            ship.shield = false;
            ship.updateShape();
          } else if (ship.state == ship.PILOT) {
            // Player 1 won
            wins[0]++;
            if (wins[0] == 5) {
              setWinner(ship.col);
            } else {
              startRound();
            }
          } else {
            // Player 2 has been hit, but isn't dead.
            ship.state = ship.PILOT;
            ship.shape = loadShape("images/red_pilot.svg");
            ship.shape.scale(1.5);
            ship.speed = 0;
          }
        }
      }
    }
  }

  // Print out all bullets on screen
  for (int i = 0; i < bulletsFired.size(); i++) {
    Bullet bullet = (Bullet) bulletsFired.get(i);
    if (bullet == null
    || bullet.x >= bullet.gameWidth - bullet.border
    || bullet.x <= bullet.border
    || bullet.y >= bullet.gameHeight - bullet.border
    || bullet.y <= bullet.border
    ) {
      // Maintainance
      bulletsFired.remove(i);
    } else {
      bullet.move();
      bullet.moveCheckX();
      bullet.moveCheckY();
      bullet.update();
    }
  }
}

void mousePressed() {
  if (state == 0) {
    System.out.println(mouseX + " " + mouseY);
    if (mouseX >= 450 && mouseX <= 800 &&
      mouseY >= 430 && mouseY <= 520) {
        // Player pressed "Start"
        state = GAME;
        NIGHT = loadImage("night.jpg");
        NIGHT.loadPixels();
    }
  }
}

void setWinner(String col) {
  winner = new Ship(width/2, height/2, 0, col);
  winner.speed = 0;
  state = WINNER;
  NIGHT = loadImage("blank_night.png");
  NIGHT.loadPixels();
}

void drawWinner() {
  textSize(75);
  text("WINNER!", width/2-150, 200);
  winner.update();
  winner.degree += 2;
}