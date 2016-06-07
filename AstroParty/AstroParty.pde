
  Ship ship;
  
  /*void setup(){
    ship = new Ship();
    size(600,600);
  } */
  PShape rectangle;
  void setup() {
  size(640,360,P2D);
  rectangle = createShape(RECT,-50,-25,100,50);
  rectangle.setStroke(color(255));
  rectangle.setStrokeWeight(4);
  rectangle.setFill(color(127));
}
  
  /*
  void draw(){
    background(4);
    fill(255);
    ship.move();
    shape(ship.shape, 300, 300, 10, 10);
    //ship.update(); 
  }*/
  
  void draw() {
  background(51);
  translate(mouseX, mouseY);
  rectangle.setFill(color(map(mouseX, 0, width, 0, 255)));
  shape(rectangle);
}
  

    