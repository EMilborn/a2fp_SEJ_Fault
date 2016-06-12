class Barrier extends Entity {
  int w;
  int h;
  boolean breakable;
  
  Barrier(int newX, int newY, int newW, int newH, boolean newbreakable){
    w = newW;
    h = newH;
    x = newX;
    y = newY;
    breakable = newbreakable;
    shape = createShape(RECT, x, y, w, h);
  }
  
  void update(){
    shape(shape);
  }
}