class Barrier extends Entity {
  boolean breakable;

  Barrier(int x, int y, int size, boolean breakable) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.breakable = breakable;
    shape = loadShape("images/boundary_" + breakable + ".svg");
    shape.scale(4);
  }

  Barrier(int x, int y, boolean breakable) {
    this(x, y, 15, breakable);
  }

  void update() {
    shape(shape, x, y);
  }
}