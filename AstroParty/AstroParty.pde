int MENU = 0;
int GAME = 1;
ArrayList<Entity> bulletsFired;
Ship [] ships;
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
  ships = new Ship [2]; 
  wins = new int[] {0, 0};
  size(1250,750);
  collision = false;
  startRound();
  NIGHT = loadImage("night.jpg");
  NIGHT.loadPixels();
}

void draw() {
  background(NIGHT);
  if (state == MENU) {
    drawMenu();
  } else if (state == GAME) {
    drawRound();
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
  ships[0] = new Ship(playerOneKeys, "green");
  ships[1] = new Ship(playerTwoKeys, "red");
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
    if (ship != null && ship.state == ship.ALIVE) {
      ship.update();
      if (ship.collide(bulletsFired)) {
        if (ship == ships[0]) {
          // Player 2 won
          wins[1]++;
        } else {
          // Player 1 won
          wins[0]++;
        }
        startRound();
        System.out.println("Player 1: " + wins[0] + "\nPlayer 2: " + wins[1]);
      }
    }
  }

  // Print out all bullets on screen
  for (int i = 0; i < bulletsFired.size(); i++) {
    Bullet bullet = (Bullet) bulletsFired.get(i);
    if (bullet == null 
    || !bullet.shot 
    || bullet.x >= bullet.gameWidth - bullet.border
    || bullet.x <= bullet.border
    || bullet.y >= bullet.gameHeight - bullet.border
    || bullet.y <= bullet.border
    ) {
      // Maintainance
      bulletsFired.remove(i);
    } else {
      bullet.update();
    }
  }
}
  
void drawMenu() {
  textSize(100);
  text("ASTRO PARTY", 200, 100);
  int rectWidth = 200;
  int rectHeight = 100;
  rect((width/2)-(rectWidth/2), height/2, rectWidth, rectHeight);
  textSize(50);
  fill(255, 0, 255);
  text("Start!", 435, 300);
  fill(255, 255, 255);
}

void mousePressed() {
  if (state == 0) {
    if (mouseX >= 400 && mouseX <= 800 && 
      mouseY >= 250 && mouseY <= 350) {
        // Player pressed "Start"
        state = 1;
    }
  }
}