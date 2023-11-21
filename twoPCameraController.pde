class twoPCameraController {
  Object p1;
  Object p2;
  PVector pos;
  mapInterpreter mp;
  float skl = 1;
  
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
    boolean isYBig = odlY > 520*skl;
    boolean isXSmall = odlX < 500*skl;
    boolean isYSmall = odlY < 300*skl;
    if(isXBig) {
      skl += 0.02;
      p2.skl += 0.02;
    } else if(isYBig) {
      skl+= 0.02;
      p2.skl += 0.02;
    } else if(isXSmall && skl > 1.0 && odlY < 400) {
      skl -= 0.02;
      p2.skl -= 0.02;
    } else if(isYSmall && skl > 1.0 && odlX < 750) {
      skl -= 0.02;
      p2.skl -= 0.02;
    }
    updateCamera();
    mp.load();
  }
  
  public void updateCamera() {
    camera(pos.x, pos.y, 626*skl, pos.x, pos.y, 0, 0, 1.0, 0);
  }
}
