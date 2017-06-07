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
PImage start;
PImage breakfast;
PImage lunch;
PImage dinner;

int maxPoints, level, time, interval, finishedLvl, myMillis;
ALQueue<Ingredients> fallIngredients = new ALQueue<Ingredients>();
ArrayList<Ingredients> gIngredients, bIngredients;
ArrayList<Ingredients> holder = new ArrayList<Ingredients>();
Meal meal = new Meal();
Player playa = new Player();
boolean lvlStart, gameStart, endLevel;

//----------------INGREDIENTS-------------------
Ingredients ham2 = new Ingredients("ham", 40, 10, 90);
Ingredients cheese2 = new Ingredients("cheese", 40, 5, 10);
Ingredients egg2 = new Ingredients("egg", 40, 10, 25);
Ingredients bacon2 = new Ingredients("bacon", 40, 10, 50);
Ingredients tomato2 = new Ingredients("tomato", 40, 10, 10);
Ingredients lettuce2 = new Ingredients("lettuce", 40, 10, 10);
Ingredients beef2 = new Ingredients("beef", 40, 10, 80);
Ingredients onion2 = new Ingredients("onion", 40, 10, 10);
Ingredients badEgg2 = new Ingredients("badEgg", 40, 10, -25);
Ingredients bananaPeel2 = new Ingredients("bananaPeel", 40, 10, -30);

void setup(){
  size(600, 567);
  img = loadImage("fridge.jpg");
  start = loadImage("start.png");
  level = playa.getLevel();
  lvlStart = false;
  gameStart = false;
  interval = 30;
  finishedLvl = 0;
  myMillis = millis();
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
  breakfast = loadImage("breakfast.png");
  lunch = loadImage("lunch.png");
  dinner = loadImage("dinner.png");

  
  rect(width/2,height,20,10);
  
  gIngredients = new ArrayList<Ingredients>();
  bIngredients = new ArrayList<Ingredients>();
  
  textSize(32);
  text("Points: ", 10, 30); 
  text(playa.getlvlPoints(), 80, 30);
  text("Time: ", 460, 30);
  text(time, 520, 30);
  fill(295,295,295);
}

void draw(){
  if(gameStart == false){
    image(start, 0, 0);
    myMillis = millis();
  }
  else{
  image(img, 0, 0);
  fill(232,190,136);
  rect(mouseX, 500, 100, 10);
  textSize(20);
  text("Points: ", 10, 30); 
  text(playa.getlvlPoints(), 80, 30);
  text("Time: ", 460, 30);
  text(time, 520, 30);
  
  if(lvlStart == false){
    System.out.println(level);
    myMillis = millis();
    setupLvl();
  }
  lvlStart = true;
  if(endLevel){
    if(level == 1 || level == 2){
      level += 1;
      playa.setLevel(playa.getLevel() + 1);
    }
    else{
      gameStart = false;
      level = 1;
      playa.setLevel(1);
    }
    endLevel = false;
  }
  endLevel = false;
  //when holder's last item hits 1/2 point, then ask first item in falling to set status 1 && add to holder.
  if ((int)(holder.get(holder.size()-1)).getiY() >= (int)height/6){
    if (level == 1){
      int num = (int)random(3);
      if (num == 0) {
        Ingredients b = bacon2.getInstance();
        b.setTexture(baconImg);
        fallIngredients.enqueue(b);
      }
      else if (num == 1) {
        Ingredients e = egg2.getInstance();
        e.setTexture(eggImg);
        fallIngredients.enqueue(e);
      }
      else{
        Ingredients c = cheese2.getInstance();
        c.setTexture(cheeseImg);
        fallIngredients.enqueue(c);
      }
      //when time runs out
      if(time == 0){
        rect(mouseX, playa.getsY()-10, 100, 10);
        finishedLvl += 1;
        if(playa.getlvlPoints() >= 800){
          holder.clear();
          image(breakfast, 0, 0);
          fill(5,3,3);
          text("FINISH", 250, 30);
          text("Click to continue.", 200, 500);
          text("Points earned: ", 200, 520);
          text(playa.getlvlPoints(), 350, 520);
          text("Total Points: ", 200, 540);
          text(playa.getPoints(), 350, 540);
          text(playa.getEgg(), 400, 175);
          text(playa.getEgg(), 400, 275);
          text(playa.getCheese(), 400, 375);
          myMillis = millis();
          lvlStart = false;
          endLevel = true;
          noLoop();  
        }
        else{
          text("FINISH", 250, 30);
          text("Not enough points. Click to restart.", 125, 50);
          fill(232,190,136);
          playa.setPoints(playa.getPoints() - playa.getlvlPoints());
          myMillis = millis();
          lvlStart = false;
          noLoop();
        }
                       
      }
      else{
        System.out.println((int)(millis()/1000 - myMillis/1000));
        time = interval - (int)(millis()/1000-myMillis/1000);// + (finishedLvl*30);
      }
    }
    if (level == 2){
      int num = (int)random(5);
      if (num == 0) {
        Ingredients b1 = beef2.getInstance();
        b1.setTexture(beefImg);
        fallIngredients.enqueue(b1);
      }
      else if (num == 1) {
        Ingredients t = tomato2.getInstance();
        t.setTexture(tomatoImg);
        fallIngredients.enqueue(t);
      }
      else if (num == 2) {
        Ingredients bE = badEgg2.getInstance();
        bE.setTexture(badEggImg);
        fallIngredients.enqueue(bE);
      }
      else if (num == 3) {
        Ingredients bP = bananaPeel2.getInstance();
        bP.setTexture(bananaPeelImg);
        fallIngredients.enqueue(bP);
      }      
      else {
        Ingredients l = lettuce2.getInstance();
        l.setTexture(lettuceImg);
        fallIngredients.enqueue(l);
      }
      //when time runs out
      if(time == 0){
        fill(232,190,136);
        rect(mouseX, playa.getsY()-10, 100, 10);  
        finishedLvl += 1;
        if(playa.getlvlPoints() >= 1000){
          holder.clear();
          image(lunch,0,0);
          fill(5,3,3);
          text("FINISH", 250, 30);
          text(playa.getBeef(), 400, 150);
          text(playa.getLettuce(), 400, 225);
          text(playa.getTomato(), 400, 300);
          text(playa.getbadEgg(), 400, 375);
          text(playa.getbananaPeel(), 400, 450);
          text("Click to continue.", 200, 520);
          text("Points earned: ", 200, 540);
          text(playa.getlvlPoints(), 350, 540);
          text("Total Points: ", 200, 560);
          text(playa.getPoints(), 350, 560);
          myMillis = millis();
          lvlStart = false;
          endLevel = true;
          noLoop();
        }
        else{
          text("FINISH", 250, 30);
          text("Not enough points. Restarting.", 200, 50);
          playa.setPoints(playa.getPoints() - playa.getlvlPoints());
          myMillis = millis();
          lvlStart = false;
          noLoop();
        }
      }
      else{
        time = interval - int(millis()/1000 - myMillis/1000);// + (finishedLvl*30);
      }
    }
    if (level == 3){
      int num = (int)random(4);
      if (num == 0){
        Ingredients h = ham2.getInstance();
        h.setTexture(hamImg);
        fallIngredients.enqueue(h);
      }
      else if (num == 1) {
        Ingredients o = onion2.getInstance();
        o.setTexture(onionImg);
        fallIngredients.enqueue(o);
      }
      else if (num == 2){
        Ingredients bE = badEgg2.getInstance();
        bE.setTexture(badEggImg);
        fallIngredients.enqueue(bE);
      }    
      else{
        Ingredients bP = bananaPeel2.getInstance();
        bP.setTexture(bananaPeelImg);
        fallIngredients.enqueue(bP);
      }
      //When time runs out
      if(time == 0){
        rect(mouseX, playa.getsY()-10, 100, 10);  
        finishedLvl += 1;
        holder.clear();
        if(playa.getlvlPoints() >= 1200){
          holder.clear();
          image(dinner, 0, 0);
          fill(5,3,3);
          text("FINISH", 200, 30);
          text(playa.getHam(), 400, 175);
          text(playa.getOnion(), 400, 225);
          text(playa.getbadEgg(), 400, 300);
          text(playa.getbananaPeel(), 400, 375);
          text("WINNER", 200, 500);
          text("Total points: ", 150, 520);
          text(playa.getPoints(), 300, 520);
          text("Again? Click.", 200, 540);
          myMillis = millis();
          lvlStart = false;
          endLevel = true;
          noLoop();
        }
        else{
          fill(232,190,136);
          text("FINISH", 200, 30);
          text("Not enough points. Restarting.", 200, 50);
          playa.setPoints(playa.getPoints() - playa.getlvlPoints());
          myMillis = millis();
          lvlStart = false; 
          noLoop();                
        }
      }
      else{
         time = interval - int(millis()/1000-myMillis/1000);// + (finishedLvl*30);       
      }
                     
    }
      Ingredients i = fallIngredients.dequeue();
      //System.out.println(i);
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
}

void setupLvl(){
  holder.clear();
  time = interval;
  playa.setsY(500);
  playa.setlvlPoints(0);
  playa.setBacon(0);
  playa.setCheese(0);
  playa.setLettuce(0);
  playa.setEgg(0);
  playa.setOnion(0);
  playa.setTomato(0);
  playa.setBeef(0);
  playa.setbadEgg(0);
  playa.setbananaPeel(0);
  playa.setHam(0);
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
  if (playa.getLevel() == 1|| playa.getLevel() == 2||playa.getLevel() == 3 ){
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
  
  if(playa.getLevel() == 2 ||playa.getLevel() == 3){
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



void mouseClicked(){
  if(gameStart == false){
    gameStart = true;
  }
  if(gameStart){
    loop();
  }
}