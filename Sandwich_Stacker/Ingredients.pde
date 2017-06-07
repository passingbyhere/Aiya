class Ingredients{
  float ix,iy;
  String name;
  int w,h;
  int status; //0 = in fallIngredients, 1 = falling, 2 = in sandwichStack, 3 = disappeared at the bottom of screen
  PImage texture;
  int points;
  
  Ingredients(String n,int W, int H, int pts){
    name = n;
    w = W;
    h = H;
    ix = (float)(random(600));
    iy = 0;
    status = 0;
    points = pts;
  }
  
  Ingredients(Ingredients i){
    name = i.name;
    w = i.w;
    h = i.h;
    ix = (float)(random(600));
    iy = i.iy;
    status = i.status;
    points = i.points;
  }
  
  Ingredients getInstance() {
    Ingredients i = new Ingredients(this);
    i.ix = random(600);
    return i;
  }
  
  void move(Player player){
    if ((int)iy == (int)player.getsY() - h && (int)ix >= (int)mouseX - 50 && (int)ix <= (int)mouseX + 100){
      status = 2;
      player.setsY(player.getsY() - h);
      int pts = player.getPoints();
      player.setPoints(pts + points);
      player.setlvlPoints(player.getlvlPoints() + points);
      //System.out.println(player.getPoints());
      player.sandwich.push(this);
      System.out.println(player.sandwich.peek());
    }
    if (status == 1){
      if(player.getLevel() == 1){
        iy += 2.5;
      }
      if(player.getLevel() == 2 || player.getLevel() == 3){
        iy += 5;
      }
    }
    if (iy >= height){
      status = 3;
      iy = 800;
    }
    if(status == 2){
      ix = mouseX + 25;
    }
    pushMatrix();
    translate(ix, iy);
    image(texture, 0, 0);
    texture.resize(50, 10);
    popMatrix();
  }
  
  //toString
  String toString(){
    return name;
  }
  
  //accessor
  String getName(){
    return name;
  }
  
  int getStatus(){
    return status;
  }

  float getiX(){
    return ix;
  }
  float getiY(){
    return iy;
  }
  PImage getTexture(){
    return texture;
  }
  
  //mutator
  void setStatus(int stat){
    status = stat;
  }
  
  void setTexture(PImage img){
    texture = img;
  }
}
  
  