class Player {
  private int points, strikes, level;
  private float sX, sY;

  //accessors
  public float getsX(){
    return sX;
  }
  public float getsY(){
    return sY;
  }
  public int getPoints(){
    return points;
  }
  public int getStrikes(){
    return strikes;
  }
  public int getLevel(){
    return level;
  }
  
  //mutators
  public void setsX(float x){
    sX = x;
  }
  public void setsY(float y){
    sY = y;
  }
  public void setPoints(int pts){
    points = pts;
  }
  public void setStrikes(int STRIKES){
    strikes = STRIKES;
  }
  public void setLevel(int lvl){
    level = lvl;
  } 
  
}