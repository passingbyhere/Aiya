class Meal{
  
  ArrayList<Ingredients> breakfast = new ArrayList<Ingredients>();
  
  Ingredients ham = new Ingredients("ham", 40, 10, 240, 162, 162, "ham.png");
  Ingredients cheese = new Ingredients("cheese", 40, 5, 249, 250, 119, "ham.png");
  
  public Meal(){
    breakfast.add(ham);
    breakfast.add(cheese);
  }
  
  public ArrayList<Ingredients> getBreakfast(){
    return breakfast;
  }
}