PImage img;
int maxPoints, level;

void setup(){
  size(600, 567);
  img = loadImage("fridge.jpg");
}

void draw(){
  image(img, 0, 0);
}