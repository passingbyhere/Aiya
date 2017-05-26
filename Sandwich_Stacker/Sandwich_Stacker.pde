PImage img;
PImage plateimg;
int maxPoints, level;
ALQueue<Ingredients> fallIngredients = new ALQueue<Ingredients>();
ArrayList<Ingredients> gIngredients, bIngredients;
ALStack<Ingredients> sandwich;
Meal meal = new Meal();

void setup(){
  size(600, 567);
  img = loadImage("fridge.jpg");
  plateimg = loadImage("plate.png"); 
  gIngredients = new ArrayList<Ingredients>();
  bIngredients = new ArrayList<Ingredients>();
  
  gIngredients.add((meal.getBreakfast()).get(0));
  image(plateimg, width/2, height); 
}

void draw(){
  image(img, 0, 0);
  image(plateimg, mouseX, mouseY);
  
}