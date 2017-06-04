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
  
  playa.setPoints(0);
  playa.setsY(500);
  playa.setsX(mouseX);
}

void draw(){
  image(img, 0, 0);
  fill(255,255,255);
  rect(mouseX, 500, 100, 10);
  if(lvlStart == false){
    setupLvl();
  }
  lvlStart = true;
  //when holder's last item hits 1/2 point, then ask first item in falling to set status 1 && add to holder.
  if ((int)(holder.get(holder.size()-1)).getiY() >= (int)height/2){
    if (level == 1){
      if ((int)random(3) == 0) {
        Ingredients b = bacon2.getInstance();
        b.setTexture(baconImg);
        fallIngredients.enqueue(b);
      }
      else if ((int)random(3) == 1) {
        Ingredients e = egg2.getInstance();
        e.setTexture(eggImg);
        fallIngredients.enqueue(e);
      }
      else{
        Ingredients c = cheese2.getInstance();
        c.setTexture(cheeseImg);
        fallIngredients.enqueue(c);
      }
    }
    if (level == 2){
      if ((int)random(5) == 0) {
        Ingredients b1 = beef2.getInstance();
        b1.setTexture(beefImg);
        fallIngredients.enqueue(b1);
      }
      else if ((int)random(5) == 1) {
        Ingredients t = tomato2.getInstance();
        t.setTexture(tomatoImg);
        fallIngredients.enqueue(t);
      }
      else if ((int)random(5) == 2) {
        Ingredients bE = badEgg2.getInstance();
        bE.setTexture(badEggImg);
        fallIngredients.enqueue(bE);
      }
      else if ((int)random(5) == 3) {
        Ingredients bP = bananaPeel2.getInstance();
        bP.setTexture(bananaPeelImg);
        fallIngredients.enqueue(bP);
      }      
      else {
        Ingredients l = lettuce2.getInstance();
        l.setTexture(lettuceImg);
        fallIngredients.enqueue(l);
      }
    }
    if (level == 3){
      if ((int)random(4) == 0){
        Ingredients h = ham2.getInstance();
        h.setTexture(hamImg);
        fallIngredients.enqueue(h);
      }
      else if ((int)random(4) == 1) {
        Ingredients o = onion2.getInstance();
        o.setTexture(onionImg);
        fallIngredients.enqueue(o);
      }
      else if ((int)random(4) == 2){
        Ingredients bE = badEgg2.getInstance();
        bE.setTexture(badEggImg);
        fallIngredients.enqueue(bE);
      }    
      else{
        Ingredients bP = bananaPeel2.getInstance();
        bP.setTexture(bananaPeelImg);
        fallIngredients.enqueue(bP);
      }
    }
      Ingredients i = fallIngredients.dequeue();
      System.out.println(i);
      holder.add(i);
      i.setStatus(1);
    }
    
    //move (always)
    for (Ingredients i: holder){
      //System.out.println(i.getName());
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
      if (i.getName().equals("tomato")){
        i.setTexture(tomatoImg); 
      }
      if (i.getName().equals("beef")){
        i.setTexture(beefImg);
      }
      if (i.getName().equals("lettuce")){
        i.setTexture(lettuceImg);
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
    }
}

void setupLvl(){
  
  //set images to corresponding ingredient
  //breakfast
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
  }
  
  //lunch
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
  
  //dinner
  for (Ingredients i: meal.getDinner()){
    if (i.getName().equals("ham")){
      i.setTexture(hamImg);
    }
    if (i.getName().equals("onion")){
      i.setTexture(onionImg);
    }
  }
  
  //badFood
  for (Ingredients i: meal.getBadFood()){
    if (i.getName().equals("badEgg")){
      i.setTexture(badEggImg);
    }
    if (i.getName().equals("bananaPeel")){
      i.setTexture(bananaPeelImg);
    }
  }
  
  //determine level
  if (playa.getLevel() == 1){
    //add good ingredients into gIngredients
    for (Ingredients i: meal.getBreakfast()){
      gIngredients.add(i);
    }
    for (Ingredients i: gIngredients){
      if (i.getName().equals("bacon")){
        holder.add(new Ingredients(bacon2));         
      }
      if (i.getName().equals("egg")){
        holder.add(new Ingredients(egg2)); 
      }
      if (i.getName().equals("cheese")){
        holder.add(new Ingredients(cheese2));     
      }
      holder.get(holder.size()-1).setStatus(1);
    }    
  }
  
  if(playa.getLevel() == 2){
    for (Ingredients i: meal.getLunch()){
      gIngredients.add(i);
    }
    for (Ingredients i: gIngredients){
      if (i.getName().equals("beef")){
        holder.add(new Ingredients(beef2));         
      }
      if (i.getName().equals("tomato")){
        holder.add(new Ingredients(tomato2)); 
      }
      if (i.getName().equals("lettuce")){
        holder.add(new Ingredients(lettuce2));     
      }
      holder.get(holder.size()-1).setStatus(1);
    }
    
    for (Ingredients i: meal.getBadFood()){
      bIngredients.add(i);
    }
    for (Ingredients i: bIngredients){
      if (i.getName().equals("badEgg")){
        holder.add(new Ingredients(badEgg2));         
      }
      if (i.getName().equals("bananaPeel")){
        holder.add(new Ingredients(bananaPeel2)); 
      }
      holder.get(holder.size()-1).setStatus(1);
    }
  }
  
  if(playa.getLevel() == 3){
    for (Ingredients i: meal.getDinner()){
      gIngredients.add(i);
    }
    for (Ingredients i: gIngredients){
      if (i.getName().equals("ham")){
        holder.add(new Ingredients(ham2));         
      }
      if (i.getName().equals("onion")){
        holder.add(new Ingredients(onion2)); 
      }
      holder.get(holder.size()-1).setStatus(1);
    }    
    for (Ingredients i: meal.getBadFood()){
      bIngredients.add(i);
    }
    for (Ingredients i: bIngredients){
      if (i.getName().equals("badEgg")){
        holder.add(new Ingredients(badEgg2));         
      }
      if (i.getName().equals("bananaPeel")){
        holder.add(new Ingredients(bananaPeel2)); 
      }
      holder.get(holder.size()-1).setStatus(1);
    }     
  }
}