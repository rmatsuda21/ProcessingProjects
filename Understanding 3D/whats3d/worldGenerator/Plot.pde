//Can only be made to with square prisms with varying heights
class Struct {
  //Data for structure in 3D
  int he;
  int w;
  int x, y;
  color c;

  //Data for 2D mapping
  boolean filled = false;

  public Struct(int he, int w, int x, int y, int h, int s, int b) {
    this.he = he;
    this.w = w;
    this.x = x;
    this.y = y;
    c = color(h, s, b);
  }

  public String toString() {
    return x*w + "," + y*w + "," + he + "," + w + "," + c;
  }

  public void update(int he, color c) {
    this.he = he;
    this.c = c;
  }
}
