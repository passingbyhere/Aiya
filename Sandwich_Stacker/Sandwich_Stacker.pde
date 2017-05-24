PImage img;
int maxPoints, level;
ALQueue<Ingredients> fallIngredients = new ALQueue<Ingredients>();
ArrayList<Ingredients> gIngredients, bIngredients;
ALStack<Ingredients> sandwich;

void setup(){
  size(600, 567);
  img = loadImage("fridge.jpg");
  gIngredients = new ArrayList<Ingredients>();
  bIngredients = new ArrayList<Ingredients>();
 
}

void draw(){
  image(img, 0, 0);
  
}