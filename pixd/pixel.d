module pixel;
import common;

class Pixel {
  private:
    string draw_data;
    uint x,y,r,g,b;
  
  public:
    this(uint px, uint py, uint pr, uint pg, uint pb) {
      draw_data = format!"PX %d %d %2x%2x%2x\0\n"(px,py,pr,pg,pb);
      this.x = px;
      this.y = py;
      this.r = pr;
      this.g = pg;
      this.b = pb;
    }

    void print() {
      writefln("x: %d, y: %d, rgb: %2x%2x%2x (r: %d, g: %d, b: %d)",this.x, this.y, this.r, this.g, this.b);
    }

    string toPacketData() {
      return this.draw_data;
    }
}
    
