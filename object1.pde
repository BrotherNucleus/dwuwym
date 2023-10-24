public class Object {
 public PVector position;
  public PVector size;
  public float speed = 0;
  public float targetSpeed = 5;
  public boolean moves;
  PImage img;
  
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
  
  

  
}
