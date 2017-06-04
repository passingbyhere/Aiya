class Meal{
  
  ArrayList<Ingredients> breakfast = new ArrayList<Ingredients>();
  ArrayList<Ingredients> lunch = new ArrayList<Ingredients>();
  ArrayList<Ingredients> dinner = new ArrayList<Ingredients>();
  
  //breakfast
  Ingredients ham = new Ingredients("ham", 40, 10);
  Ingredients cheese = new Ingredients("cheese", 40, 5);
  Ingredients egg = new Ingredients("egg", 40, 10);
  
  //lunch
  Ingredients bacon = new Ingredients("bacon", 40, 10);
  Ingredients lettuce = new Ingredients("lettuce", 40, 10);
  Ingredients tomato = new Ingredients("tomato", 40, 10);
  
  //dinner
  Ingredients beef = new Ingredients("beef", 40, 10);
  Ingredients lettuce = new Ingredients("lettuce", 40, 10);
  Ingredients tomato = new Ingredients("tomato", 40, 10);
  Ingredients beef = new Ingredients("beef", 40, 10);
  
  public Meal(){
    //set textures for Breakfast Ingredients
    ham.setTexture(hamImg);
    cheese.setTexture(cheeseImg);
    egg.setTexture(eggImg);
    bacon.setTexture(baconImg);
    
    //set textures for Lunch Ingredients
    beef.setTexture(beefImg);
    tomato.setTexture(tomatoImg);
    lettuce.setTexture(lettuceImg);
    //bacon.setTexture(baconImg);  

    //set textures for Dinner Ingredients
    
    
    //add breakfast ingredients in breakfast
    breakfast.add(ham);
    breakfast.add(cheese);
    breakfast.add(egg);
    breakfast.add(bacon);
    
    //add lunch ingredients in lunch    
    lunch.add(beef);
    lunch.add(tomato);
    lunch.add(lettuce);
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
  
}