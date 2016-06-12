class Barrier extends Entity {  
  boolean breakable;
  
  Barrier(int newX, int newY, int size, boolean newbreakable) {
    x = newX;
    y = newY;
    this.size=size;
    breakable = newbreakable;
    shape = loadShape("images/boundary_" + breakable + ".svg");
    shape.scale(5);
  }
  
  Barrier(int X, int Y, boolean newbreakable){
    this(X, Y, 50, newbreakable);
  }
  
  

  void update() {
    shape(shape, x, y);
  }
}