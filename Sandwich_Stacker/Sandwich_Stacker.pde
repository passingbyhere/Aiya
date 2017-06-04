PImage img;
PImage hamImg;
PImage cheeseImg;
PImage eggImg;
PImage baconImg;
PImage lettuceImg;
PImage tomatoImg;
PImage beefImg;

int maxPoints, level;
ALQueue<Ingredients> fallIngredients = new ALQueue<Ingredients>();
ArrayList<Ingredients> gIngredients, bIngredients;
ALStack<Ingredients> sandwich = new ALStack<Ingredients>();
ArrayList<Ingredients> holder = new ArrayList<Ingredients>();
Meal meal = new Meal();
Player playa = new Player();

//----------------INGREDIENTS-------------------
Ingredients ham2 = new Ingredients("ham", 40, 10);
Ingredients cheese2 = new Ingredients("cheese", 40, 5);
Ingredients egg2 = new Ingredients("egg", 40, 10);
Ingredients bacon2 = new Ingredients("bacon", 40, 10);
Ingredients tomato2 = new Ingredients("tomato", 40, 10);
Ingredients lettuce2 = new Ingredients("lettuce", 40, 10);
Ingredients beef2 = new Ingredients("beef", 40, 10);

void setup(){
  size(600, 567);
  img = loadImage("fridge.jpg");
  level = 1;
  playa.setLevel(level);
  //Ingredients image
  hamImg = loadImage("ham.png");
  cheeseImg = loadImage("cheese.png");
  eggImg = loadImage("egg.png");
  baconImg = loadImage("bacon.png"); 
  tomatoImg = loadImage("tomato.png");
  lettuceImg = loadImage("lettuce.png");
  beefImg = loadImage("beef.png");
  
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
    if (i.getName().equals("egg")){
      i.setTexture(eggImg);
    }
    if (i.getName().equals("bacon")){
      i.setTexture(baconImg);
    }
  }
  
  for (Ingredients i: meal.getLunch()){
    if (i.getName().equals("lettuce")){
      i.setTexture(lettuceImg);
    }
    if (i.getName().equals("tomato")){
      i.setTexture(tomatoImg);
    }
    if (i.getName().equals("beef")){
      i.setTexture(beefImg);
    }  
  }

  if (playa.getLevel() == 1){
    //add good ingredients into gIngredients
    for (Ingredients i: meal.getBreakfast()){
      gIngredients.add(i);
    }
  }
  
  if(playa.getLevel() == 2){
    for (Ingredients i: meal.getLunch()){
      gIngredients.add(i);
    }  
  }

  if(playa.getLevel() == 3){
    for (Ingredients i: meal.getLunch()){
      gIngredients.add(i);
    }  
  }
    
  //add ingredients that would fall
   for (Ingredients i: gIngredients){
     holder.add(new Ingredients(i));
   }
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
    else{
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
    if (i.getName().equals("egg")){
      i.setTexture(eggImg);
    }
    if(i.getName().equals("bacon")){
      i.setTexture(baconImg);
    }
    i.move(playa);
  }
    
}