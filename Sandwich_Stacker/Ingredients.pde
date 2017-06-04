class Ingredients{
  float ix,iy;
  String name;
  int w,h;
  int status; //0 = in fallIngredients, 1 = falling, 2 = in sandwichStack, 3 = disappeared at the bottom of screen
  PImage texture;
  Ingredients(String n,int W, int H){
    name = n;
    w = W;
    h = H;
    ix = (float)(random(600));
    iy = 0;
    status = 0;
  }
  
  Ingredients(Ingredients i){
    name = i.name;
    w = i.w;
    h = i.h;
    ix = (float)(random(600));
    iy = i.iy;
    status = i.status;
  }
  
  Ingredients getInstance() {
    Ingredients i = new Ingredients(this);
    i.ix = random(600);
    return i;
  }
  
  void move(Player player){
    if ((int)iy == (int)player.getsY() - h && (int)ix >= (int)mouseX && (int)ix <= (int)mouseX + 150){
      status = 2;
      player.setsY(player.getsY() - h);
    }
    if (status == 1){
      iy += 5;
    }
    if (iy >= height){
      status = 3;
      iy = 800;
    }
    if(status == 2){
      ix = mouseX + 30;
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
  
  