class Ingredients{
float ix,iy;
String name;
int w,h;
color c;
int status; //0 = in fallIngredients, 1 = falling, 2 = in sandwichStack, 3 = disappeared at the bottom of screen

Ingredients(String n,int W, int H, int R, int G, int B){
  name = n;
  w = W;
  h = H;
  c = color(R, G, B);
  ix = random() * width;
  iy = 0;
}