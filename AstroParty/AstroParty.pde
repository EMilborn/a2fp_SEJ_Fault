ArrayList Bullet;
  Ship [] ship;
  
  PShape rectangle;
  void setup() {
    ship = new Ship[4];
    char [] test = {'a', 's'};
    ship[0] = new Ship(test);
    size(1000,1000);
  }

  void draw() {
    background(51);
    for(Ship i: ship){
      if(i != null){
        i.update();
      }
    }
  }
    
    void keyPressed(){
      for(Ship i: ship){
        if(i != null){
        if(key == i.keyLetters[0])
          i.keys[0] = true;
        if(key == i.keyLetters[1])
          i.keys[1] = true;
        }
      }
    }
    
    void keyReleased(){
      for(Ship i: ship){
        if(i != null){
        if(key == i.keyLetters[0])
          i.keys[0] = false;
        if(key == i.keyLetters[1])
          i.keys[1] = false;
        }
      }
    }