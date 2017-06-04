PImage img;
PImage hamImg;
PImage cheeseImg;
PImage eggImg;
PImage baconImg;
PImage lettuceImg;
PImage tomatoImg;
PImage beefImg;
PImage onionImg;
PImage badEggImg;
PImage bananaPeelImg;

int maxPoints, level;
ALQueue<Ingredients> fallIngredients = new ALQueue<Ingredients>();
ArrayList<Ingredients> gIngredients, bIngredients;
ALStack<Ingredients> sandwich = new ALStack<Ingredients>();
ArrayList<Ingredients> holder = new ArrayList<Ingredients>();
Meal meal = new Meal();
Player playa = new Player();
boolean lvlStart;

//----------------INGREDIENTS-------------------
Ingredients ham2 = new Ingredients("ham", 40, 10);
Ingredients cheese2 = new Ingredients("cheese", 40, 5);
Ingredients egg2 = new Ingredients("egg", 40, 10);
Ingredients bacon2 = new Ingredients("bacon", 40, 10);
Ingredients tomato2 = new Ingredients("tomato", 40, 10);
Ingredients lettuce2 = new Ingredients("lettuce", 40, 10);
Ingredients beef2 = new Ingredients("beef", 40, 10);
Ingredients onion2 = new Ingredients("onion", 40, 10);
Ingredients badEgg2 = new Ingredients("badEgg", 40, 10);
Ingredients bananaPeel2 = new Ingredients("bananaPeel", 40, 10);

void setup(){
  size(600, 567);
  img = loadImage("fridge.jpg");
  level = playa.getLevel();
  lvlStart = false;
  //Ingredients image
  hamImg = loadImage("ham.png");
  cheeseImg = loadImage("cheese.png");
  eggImg = loadImage("egg.png");
  baconImg = loadImage("bacon.png"); 
  tomatoImg = loadImage("tomato.png");
  lettuceImg = loadImage("lettuce.png");
  beefImg = loadImage("beef.png");
  onionImg = loadImage("onion.png");
  badEggImg = loadImage("badEgg.png");
  bananaPeelImg = loadImage("bananaPeel.png");
  
  rect(width/2,height,20,10);
  
  gIngredients = new ArrayList<Ingredients>();
  bIngredients = new ArrayList<Ingredients>();
<<<<<<< HEAD
  
  //set images to corresponding ingredient
  for (Ingredients i: meal.getBreakfast()){
    if (i.getName().equals("cheese")){
      i.setTexture(cheeseImg);
    }
    if (i.getName().equals("egg")){
      i.setTexture(eggImg);
    }
    if (i.getName().equals("bacon")){
      i.setTexture(baconImg);
    }
=======
}

void draw(){
  image(img, 0, 0);
  fill(255,255,255);
  rect(mouseX, 500, 100, 10);
  if(lvlStart == false){
    setupLvl();
>>>>>>> 1220627a4d60ec734b09bf6bc557f8f1e7fd36c8
  }
  else{
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
<<<<<<< HEAD
  
  for (Ingredients i: meal.getDinner()){
    if (i.getName().equals("ham")){
      i.setTexture(hamImg);
    }
    if (i.getName().equals("onion")){
      i.setTexture(onionImg);
    }
  }
  
  for (Ingredients i: meal.getBadFood()){
    if (i.getName().equals("badEgg")){
      i.setTexture(badEggImg);
    }
    if (i.getName().equals("bananaPeel")){
      i.setTexture(bananaPeelImg);
    }
  }
  
=======
}

void setupLvl(){
>>>>>>> 1220627a4d60ec734b09bf6bc557f8f1e7fd36c8
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
  /*  
  //add ingredients that would fall
   for (Ingredients i: gIngredients){
     holder.add(new Ingredients(i));
   }
   for (Ingredients i: holder){
     i.setStatus(1);
   }
<<<<<<< HEAD

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
      Ingredients b = bacon2.getInstance();
      b.setTexture(baconImg);
      fallIngredients.enqueue(b);
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
=======
   */
   //set images to corresponding ingredient
  for (Ingredients i: meal.getBreakfast()){
>>>>>>> 1220627a4d60ec734b09bf6bc557f8f1e7fd36c8
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
<<<<<<< HEAD
    if (i.getName().equals("lettuce")){
      i.setTexture(lettuceImg); 
    }
    if (i.getName().equals("tomato")){
      i.setTexture(tomatoImg);
    }
    if (i.getName().equals("onion")){
      i.setTexture(onionImg);
    }
    if(i.getName().equals("badEgg")){
      i.setTexture(badEggImg);
    }  
    if(i.getName().equals("bananaPeel")){
      i.setTexture(bananaPeelImg);
    }      
    i.move(playa);
=======
>>>>>>> 1220627a4d60ec734b09bf6bc557f8f1e7fd36c8
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
}