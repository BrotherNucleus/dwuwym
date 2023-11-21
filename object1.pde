public class Object {
 public PVector position;
  public PVector size;
  public float speed = 0;
  public float speedY = 0;
  public float targetSpeed = 5;
  public boolean moves;
  PImage img;
  public boolean stopX = false;
  public boolean stopY = false;
  float skl = 1;
  
  public Object(PVector pos, boolean isMoving, String path, PVector s)
  {
      if(path != " ") {
        img = loadImage(path);
      } else {
        img = null;
      }
      position = pos;
      moves = isMoving;
      size = s;
  }
  
  public void display() {
  
  }
  
  public void stopX() {
    if(stopX) {
      stopX = false;
    } else {
      stopX = true;
    }
  }
  
    public void stopY() {
    if(stopY) {
      stopY = false;
    } else {
      stopY = true;
    }
  }
  
  

  
}
