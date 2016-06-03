class Entity{
  //attributes
  int x;
  int y;
  PShape shape;
  float degree;
  int speed;
  int size;

  //Methods
  void move(){
    x += cos(radians(degree)) * speed;
    y += sin(radians(degree)) * speed;
    collision();
  }
  
  void print(){
    rotate(angle);
    shape(shape, x, y, size, size);
    rotate(-angle);
  }
 
  void collision(){}
}