class Ingredients{
  float ix,iy;
  String name;
  int w,h;
  color c;
  int status; //0 = in fallIngredients, 1 = falling, 2 = in sandwichStack, 3 = disappeared at the bottom of screen
  
  Ingredients(String n,int W, int H, int R, int G, int B){
    name = n;
    w = W;
    h = H;
    c = color(R, G, B);
    ix = (float)(random(width));
    iy = 0;
    status = 0;
  }
  
  void move(Player player){
    if(status == 1){
      iy += 5;
      if(iy == player.getsY() && ix == player.getsX()){
        status = 2;
      }
    }
    if(iy == height){
      status = 3;
    }
    if(status == 2){
      ix = mouseX;
    }
  }
  
  void setStatus(int stat){
    status = stat;
  }
}
  