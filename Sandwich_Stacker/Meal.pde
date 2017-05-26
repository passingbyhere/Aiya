class Meal{
  
  ArrayList<Ingredients> breakfast = new ArrayList<Ingredients>();
  
  Ingredients ham = new Ingredients("ham", 20, 10, 240, 162, 162);
  
  public Meal(){
    breakfast.add(ham);
  }
  
  public ArrayList<Ingredients> getBreakfast(){
    return breakfast;
  }
}