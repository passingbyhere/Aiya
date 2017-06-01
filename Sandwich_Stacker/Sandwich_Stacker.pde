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
  gIngredients.add((meal.getBreakfast()).get(1));
  fallIngredients.enqueue(gIngredients.get(0));
  fallIngredients.enqueue(gIngredients.get(1));
  holder.add(new Ingredients("ham", ));
  holder.get(0).setStatus(1);
  //image(plateimg, width/2, height);
  playa.setPoints(0);
  playa.setsY(500);
  playa.setsX(mouseX);
}

void draw(){
  image(img, 0, 0);
  //image(plateimg, mouseX, mouseY);
  rect(mouseX, 500, 150, 10);
  //when holder's last item hits 1/2 point, then ask first item in falling to set status 1 && add to holder.
  if ((int)(holder.get(holder.size()-1)).getiY() == (int)height/2){
    Ingredients i = fallIngredients.dequeue();
    System.out.println(i);
    holder.add(i);
    i.setStatus(1);
  }
  //move (always)
  for (Ingredients i: holder){
    i.move(playa);
  }
  /*for (int i = 0; i < holder.size(); i+=1){
    int time = millis();
    while (millis()-time < 5){
      (holder.get(i)).setStatus(1);
      (holder.get(i)).move(playa);
    }
  }*/
  
  /*void pause(int seconds){
    int time = millis();
    while (millis()-time < seconds){
      
    }
  }*/
  
}