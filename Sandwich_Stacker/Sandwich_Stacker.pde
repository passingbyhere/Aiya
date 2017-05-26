PImage img;
PImage plateimg;
int maxPoints, level;
ALQueue<Ingredients> fallIngredients = new ALQueue<Ingredients>();
ArrayList<Ingredients> gIngredients, bIngredients;
ALStack<Ingredients> sandwich;
ALStack<Ingredients> holder = new ALStack<Ingredients>();
Meal meal = new Meal();
Player playa = new Player();

void setup(){
  size(600, 567);
  img = loadImage("fridge.jpg");
  //plateimg = loadImage("plate.png"); 
  rect(width/2,height,20,10);
  gIngredients = new ArrayList<Ingredients>();
  bIngredients = new ArrayList<Ingredients>();
  
  gIngredients.add((meal.getBreakfast()).get(0));
  //image(plateimg, width/2, height); 
}

void draw(){
  image(img, 0, 0);
  //image(plateimg, mouseX, mouseY);
  rect(mouseX + 30, 500, 150, 10);
  playa.setPoints(0);
  playa.setsY(10 + 5);
  playa.setsX(mouseX);
  fallIngredients.enqueue(g.Ingredients(0));
  holder.push(fallIngredients.dequeue());
  
  
}