/* 
 * With the Impressionism class, I created
 * a custom shape using PShape, and
 * using an appropriate opacity and some
 * randomly-varied vertices, managed to 
 * generate a free brush-stroke-like effect 
 * characteristic of some Impressionists. 
 * Two methods are available: one that 
 * applies the effect to the entire canvas
 * automatically, and a second which allows
 * the user to apply the effect manually.
 */

class Impressionism {

  // GLOBAL VARIABLES 
  Boolean imprAutoActive, imprPaintActive;
  PShape s;

  // CONSTRUCTOR
  Impressionism() {
    imprAutoActive = false;
    imprPaintActive = false;
  }

  void impressionismAuto(PImage pic) { 
    for (int i = 0; i < width; i += 15) {
      for (int j = 0; j < height; j += 15) {
        color pixel = pic.get(i, j);
        fill(pixel, 50);
        noStroke();
        s = createShape();
        s.beginShape();
        s.vertex(random(30, 45), random(0, 15));
        s.vertex(random(10, 25), random(20, 35));
        s.vertex(random(40, 55), random(20, 35));
        s.vertex(random(45, 60), random(0, 10));
        s.endShape(CLOSE);
        shape(s, i - 30, j - 20);
      }
    }
  }

  void impressionismPaint(PImage pic) {
    color pixel = pic.get(mouseX, mouseY);
    fill(pixel, 20);
    noStroke();
    s = createShape();
    s.beginShape();
    s.vertex(random(30, 45), random(0, 15));
    s.vertex(random(10, 25), random(20, 35));
    s.vertex(random(40, 55), random(20, 35));
    s.vertex(random(45, 60), random(0, 10));
    s.endShape(CLOSE);
    shape(s, mouseX - 30, mouseY - 20);
  }
}