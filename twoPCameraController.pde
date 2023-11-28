class twoPCameraController {
  Object p1;
  Object p2;
  PVector pos;
  mapInterpreter mp;
  float skl = 1;
  float speed = 0;
  float targetSpeed = 1.5;
  float smooth = 0.02;
  
  public twoPCameraController(Object playerOne, Object playerTwo, PVector center, mapInterpreter map) {
    p1 = playerOne;
    p2 = playerTwo;
    pos = center;
    mp = map;
  }
  
  public void posLock() {
    float xDiff = abs(p1.position.x - p2.position.x);
    float yDiff = abs(p1.position.y - p2.position.y);
    
    float rW = pos.x + (width*0.8 - width/2);
    float lW = pos.x - (width*0.8 - width/2);
    float uW = pos.y - (height*0.8 - height/2);
    float dW = pos.y + (height*0.8 - height/2);
    
    
    
    if( !(xDiff > 0.80*width)) {
      if(p1.position.x > rW || p1.position.x < lW) {
          pos.x += p1.speed;
          updateCamera();
          mp.load();
      } else if (p2.position.x > rW || p2.position.x < lW) {
          pos.x += p2.speed;
          updateCamera();
          mp.load();
      }
    }
    
    if(!(yDiff > 0.80*height)) {
        if(p1.position.y < uW || p1.position.y > dW) {
        pos.y += p1.speedY;
        updateCamera();
        mp.load();
      } else if(p2.position.y < uW || p2.position.y > dW) {
        pos.y += p2.speedY;
        updateCamera();
        mp.load();
      }
    }
  }
  
  public void scaleCam() {
    float odlX = abs(p1.position.x - p2.position.x);
    float odlY = abs(p1.position.y - p2.position.y);
    boolean isXBig = odlX > 880*skl;
    boolean isYBig = odlY > 540*skl;
    boolean isXSmall = odlX < 500*skl;
    boolean isYSmall = odlY < 300*skl;
    
    float centerX = p2.camCenter.x;
    float centerY = p2.camCenter.y;
    
    float p1cx = p1.position.x - centerX;
    float p1cy = p1.position.x - centerY;
    
    float rW = pos.x + (width*0.8 - width/2);
    float lW = pos.x - (width*0.8 - width/2);
    float uW = pos.y - (height*0.8 - height/2);
    float dW = pos.y + (height*0.8 - height/2);
          print(p2.skl);
      print("\n");
      print(p1.position.x);
      print("\n");
      
      pos.x = (p1.position.x + p2.position.x) / 2;
      pos.y = (p1.position.y + p2.position.y) / 2;
      
      if(p1cx > rW) {
        p1.stopRight = true;
      } else if(p1cx < 0 && abs(p1cx) > lW) {
        p1.stopLeft = true;
      } else {
        p1.stopLeft = false;
        p1.stopRight = false;
      }
      
      if(p1cy > dW) {
        p1.stopDown = true;
      } else if(p1cy < 0 && abs(p1cy) > uW) {
        p1.stopUp = true;
      } else {
        p1.stopUp = false;
        p1.stopDown = false;
      }
      
      
    if(isXBig && skl < 1.5) {
      speed = 1*targetSpeed*(1-smooth) + smooth*speed;
    } else if(isYBig && skl < 1.5) { 
      speed = 1*targetSpeed*(1-smooth) + smooth*speed;
    } else if(isXSmall && skl > 1.0 && odlY < 400*skl 
              //&& (
              //(isP1YAtTop || isP1YAtBottom) || 
              //(isP2YAtTop || isP2YAtBottom)
              //)
              ) {   
      speed = -1*targetSpeed*(1-smooth) + smooth*speed;
    } else if(isYSmall && skl > 1.0 && odlX < 750*skl
              //&& (
              //(isP1XAtTop || isP1XAtBottom) || 
              //(isP2XAtTop || isP2XAtBottom)
              //)
              ) {
      
      speed = -1*targetSpeed*(1-smooth) + smooth*speed;
              }
      if(skl > 0.9 && skl < 1.6)  {
      skl += 0.02;
      p2.skl += 0.02;
      }  else {
        speed = 0;
      }
    updateCamera();
    mp.load();
    
        //boolean isP1YAtTop = p1.position.y < 30*skl && p1.position.y > 0;
    //boolean isP2YAtTop = p2.position.y < 30*skl && p2.position.y > 0;
    //boolean isP1YAtBottom = p1.position.y > 600*skl && p1.position.y < 670*skl;
    //boolean isP2YAtBottom = p2.position.y > 600*skl && p2.position.y < 670*skl;
    //boolean isP1XAtTop = p1.position.x < 30*skl && p1.position.x > 0;
    //boolean isP2XAtTop = p2.position.x < 30*skl && p2.position.x > 0;
    //boolean isP1XAtBottom = p1.position.x > 1180*skl && p1.position.x < 1230*skl;
    //boolean isP2XAtBottom = p2.position.x > 1180*skl && p2.position.x < 1230*skl;
    
    //else if((p1.position.x > 1250*skl || p1.position.y > 700*skl 
    //          || p1.position.x < 30*skl || p1.position.y < 20*skl)
    //          && skl < 1.5) {
    //          skl += 0.02;
    //          p2.skl += 0.02;
    //          } 
        //if((p1.position.x > 1250*skl || p1.position.y > 700*skl 
    //          || p1.position.x < 30*skl || p1.position.y < 20*skl)
    //          && skl < 1.5){
    //          skl += 0.02;
    //          p2.skl += 0.02;
    //          }
  }
  
  public void updateCamera() {
    camera(pos.x, pos.y, 626*skl, pos.x, pos.y, 0, 0, 1.0, 0);
  }
}
