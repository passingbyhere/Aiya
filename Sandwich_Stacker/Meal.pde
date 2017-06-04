class Meal{
  
  ArrayList<Ingredients> breakfast = new ArrayList<Ingredients>();
  
  Ingredients ham = new Ingredients("ham", 40, 10, 240, 162, 162);
  Ingredients cheese = new Ingredients("cheese", 40, 5, 249, 250, 119);
  
  public Meal(){
    ham.setTexture(hamImg);
    cheese.setTexture(cheeseImg);
    breakfast.add(ham);
    breakfast.add(cheese);
  }
  
  public ArrayList<Ingredients> getBreakfast(){
    return breakfast;
  }
}