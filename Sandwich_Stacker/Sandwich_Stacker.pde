PImage img;
PImage plateimg;
int maxPoints, level;
ALQueue<Ingredients> fallIngredients = new ALQueue<Ingredients>();
ArrayList<Ingredients> gIngredients, bIngredients;
ALStack<Ingredients> sandwich;
ArrayList<Ingredients> holder = new ArrayList<Ingredients>();
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
  //System.out.println(gIngredients.get(0));
  fallIngredients.enqueue(gIngredients.get(0));
  //System.out.println(fallIngredients.peekFront());
  holder.add(fallIngredients.dequeue());
  //System.out.println(holder.get(0));
  for (int i = 0; i < holder.size(); i+=1){
    (holder.get(i)).setStatus(1);
    (holder.get(i)).move(playa);
  }
  
  
  
}