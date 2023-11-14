class cameraController {
  PVector pos;
  Object flw;
  public cameraController(PVector position, Object follow) {
    pos = position;
    flw = follow;
  }
  
  public void drawSquareOnfollow() {
    if(pos.x > flw.position.x + 545) {
      pos.x += flw.speed;
      print("forward");
    } else if (pos.x < flw.position.x - 545) {
      pos.x += flw.speed;
      print("back");
    }
    drawSquare();
  }
  
  public void drawSquare() {
    pushMatrix();
      fill(0, 255, 0);
      rect(pos.x, pos.y, 20, 20);
    popMatrix();
  }
}
