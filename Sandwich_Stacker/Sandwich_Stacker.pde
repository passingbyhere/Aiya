PImage img;
PImage hamImg;
PImage cheeseImg;
int maxPoints, level;
ALQueue<Ingredients> fallIngredients = new ALQueue<Ingredients>();
ArrayList<Ingredients> gIngredients, bIngredients;
ALStack<Ingredients> sandwich;
ArrayList<Ingredients> holder = new ArrayList<Ingredients>();
Meal meal = new Meal();
Player playa = new Player();

Ingredients ham2 = new Ingredients("ham", 40, 10, 240, 162, 162);
Ingredients cheese2 = new Ingredients("cheese", 40, 5, 249, 250, 119);


void setup(){
  size(600, 567);
  img = loadImage("fridge.jpg");
  hamImg = loadImage("ham.png");
  cheeseImg = loadImage("cheese.png");
  rect(width/2,height,20,10);
  gIngredients = new ArrayList<Ingredients>();
  bIngredients = new ArrayList<Ingredients>();
  //set images to corresponding ingredient
  for (Ingredients i: meal.getBreakfast()){
    if (i.getName().equals("ham")){
      i.setTexture(hamImg);
    }
    if (i.getName().equals("cheese")){
      i.setTexture(cheeseImg);
    }
  }
  
  //add good ingredients into gIngredients
  for (Ingredients i: meal.getBreakfast()){
    gIngredients.add(i);
  }
  
  //add ingredients that would fall
  holder.add(new Ingredients(ham2));
  holder.add(new Ingredients(cheese2));
  for (Ingredients i: holder){
    i.setStatus(1);
  }
  playa.setPoints(0);
  playa.setsY(500);
  playa.setsX(mouseX);
}

void draw(){
  image(img, 0, 0);
  fill(255,255,255);
  rect(mouseX, 500, 100, 10);
  //when holder's last item hits 1/2 point, then ask first item in falling to set status 1 && add to holder.
  if ((int)(holder.get(holder.size()-1)).getiY() >= (int)height/2){
    if ((int)random(2) == 0) {
      Ingredients h = ham2.getInstance();
      h.setTexture(hamImg);
      fallIngredients.enqueue(h);
    }
    else {
      Ingredients c = cheese2.getInstance();
      c.setTexture(cheeseImg);
      fallIngredients.enqueue(c);

    }
    
    Ingredients i = fallIngredients.dequeue();
    System.out.println(i);
    holder.add(i);
    i.setStatus(1);
  }
  
  //move (always)
  for (Ingredients i: holder){
    if (i.getName().equals("ham")){
      i.setTexture(hamImg); 
    }
    if (i.getName().equals("cheese")){
      i.setTexture(cheeseImg);
    }
    i.move(playa);
  }
    
}