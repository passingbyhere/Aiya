class Meal{
  
  ArrayList<Ingredients> breakfast = new ArrayList<Ingredients>();
  ArrayList<Ingredients> lunch = new ArrayList<Ingredients>();
  ArrayList<Ingredients> dinner = new ArrayList<Ingredients>();
  ArrayList<Ingredients> badFood = new ArrayList<Ingredients>();
  
  //breakfast
  Ingredients bacon = new Ingredients("bacon", 40, 10);  
  Ingredients cheese = new Ingredients("cheese", 40, 5);
  Ingredients egg = new Ingredients("egg", 40, 10);
  
  //lunch
  Ingredients beef = new Ingredients("beef", 40, 10);
  Ingredients lettuce = new Ingredients("lettuce", 40, 10);
  Ingredients tomato = new Ingredients("tomato", 40, 10);
  
  //dinner

  Ingredients ham = new Ingredients("ham", 40, 10);  
  Ingredients onion = new Ingredients("onion", 40, 10);
 
  //badFood
  Ingredients badEgg = new Ingredients("badEgg", 40, 10);
  Ingredients bananaPeel = new Ingredients ("bananaPeel", 40, 10);

  //Ingredients beef = new Ingredients("beef", 40, 10);
  //Ingredients lettuce = new Ingredients("lettuce", 40, 10);
  //Ingredients tomato = new Ingredients("tomato", 40, 10);
  //Ingredients beef = new Ingredients("beef", 40, 10);

  
  public Meal(){
    //set textures for Breakfast Ingredients
    cheese.setTexture(cheeseImg);
    egg.setTexture(eggImg);
    bacon.setTexture(baconImg);
    
    //set textures for Lunch Ingredients
    beef.setTexture(beefImg);
    tomato.setTexture(tomatoImg);
    lettuce.setTexture(lettuceImg);
    //bacon.setTexture(baconImg);  

    //set textures for Dinner Ingredients
    ham.setTexture(hamImg);    
    onion.setTexture(onionImg);
    
    //set textures for badFood
    badEgg.setTexture(badEggImg);
    bananaPeel.setTexture(bananaPeelImg);
    
    //add breakfast ingredients in breakfast
    breakfast.add(cheese);
    breakfast.add(egg);
    breakfast.add(bacon);
    
    //add lunch ingredients in lunch    
    lunch.add(beef);
    lunch.add(tomato);
    lunch.add(lettuce);

    //add dinner ingredients in dinner   
    dinner.add(ham);
    dinner.add(onion);
    
    //add badFood
    badFood.add(badEgg);
    badFood.add(bananaPeel);
    
  }
  
  //accessors
  public ArrayList<Ingredients> getBreakfast(){
    return breakfast;
  }
  
  public ArrayList<Ingredients> getLunch(){
    return lunch;
  }
  
  public ArrayList<Ingredients> getDinner(){
    return dinner;
  }  

  public ArrayList<Ingredients> getBadFood(){
    return badFood;
  }    
}