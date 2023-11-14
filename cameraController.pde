class cameraController {
  PVector pos;
  Object flw;
  mapInterpreter mp;
  private float yDiff;
  public cameraController(PVector position, Object follow, mapInterpreter map) {
    pos = position;
    flw = follow;
    mp = map;
    yDiff = pos.y - flw.position.y;
  }
  
  public void drawSquareOnfollow() {
    if(pos.x > flw.position.x + 545 && pos.x > 720) {
      pos.x += flw.speed;
      mp.loadMap();
      //print("forward");
    } else if (pos.x < flw.position.x - 450) {
      pos.x += flw.speed;
      mp.loadMap();
    }
    if(pos.y - flw.position.y > yDiff + 2 || pos.y - flw.position.y < yDiff - 2) {
      print();
      pos.y += flw.speedY;
      mp.loadMap();
    }
      //print("back");
    drawSquare();
  }
  
  public void CameraFollowConst() {
    mp.loadMap();
    camera(flw.position.x, pos.y, 626, flw.position.x, pos.y, 0, 0, 1.0, 0);
  }
  
  public void updateCamera() {  
    camera(pos.x, pos.y, 626, pos.x, pos.y, 0, 0, 1.0, 0);
  }
  
  public void drawSquare() {
    pushMatrix();
      fill(0, 255, 0);
      rect(pos.x, pos.y, 20, 20);
    popMatrix();
  }
}
